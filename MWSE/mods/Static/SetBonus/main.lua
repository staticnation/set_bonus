-- Importing modules
-- lfs is LuaFileSystem, a library to handle directory operations in Lua
-- config module is the configuration data for the Set Bonus mod
-- interop is the previously defined module providing functions to register sets, items, and set directories
local lfs = require("lfs") 
local config = require("Static.SetBonus.config")
local interop = require("Static.SetBonus.interop")

-- initAll: A function that takes a directory path as input, reads all Lua files in the directory,
-- and registers the sets and items defined in the Lua files. It then creates links between each item and its set.
local function initAll(path)
    -- Using LuaFileSystem to iterate through all files in the directory
    for file in lfs.dir(path) do
        if file:match("(.+)%.lua$") then -- Only processing Lua files
            local modulePath = path .. "/" .. file
            local success, set = pcall(dofile, modulePath) -- Using pcall to handle any errors when loading the Lua files
            if success then
                interop.registerSet(set) -- If the Lua file is loaded successfully, register the set
            end
        end
    end
    -- After registering all sets and items, create links in the setLinks table in the config module
    for _, set in pairs(config.sets) do
        for _, item in ipairs(set.items) do
            config.setLinks[item] = set
        end
    end
end

-- Loading set files using interop module
initAll("Data Files/MWSE/mods/Static/ArmorBonus/sets")

-- After loading the sets, create links in the setLinks table in the config module again
for _, set in pairs(config.sets) do
    for _, item in ipairs(set.items) do
        config.setLinks[item] = set
    end
end

-- countItemsEquipped: A function that checks if a reference (usually a character) has each item in a given list equipped
local function countItemsEquipped(ref, items)
    local count = 0
    for _, item in ipairs(items) do
        if mwscript.hasItemEquipped{reference=ref, item=item} then
            count = count + 1
        end
    end
    return count
end

-- addSpell: A function to add a spell or a list of spells to a reference (usually a character)
local function addSpell(t)
    local spells = type(t.spell) == "table" and t.spell or {t.spell} -- Make sure the input is a table
    for _, spell in ipairs(spells) do
        if not mwscript.getSpellEffects{reference=t.reference, spell=spell} then -- Check if the reference already has the spell
            mwscript.addSpell{reference=t.reference, spell=spell}
        end
    end
end

-- removeSpell: A function to remove a spell or a list of spells from a reference (usually a character)
local function removeSpell(t)
    local spells = type(t.spell) == "table" and t.spell or {t.spell} -- Make sure the input is a table
    for _, spell in ipairs(spells) do
        if mwscript.getSpellEffects{reference=t.reference, spell=spell} then -- Check if the reference has the spell
            mwscript.removeSpell{reference=t.reference, spell=spell}
        end
    end
end

-- addSetBonus: A function to add set bonus based on the number of equipped items from the same set
local function addSetBonus(set, ref,

 numEquipped)
    -- Depending on the number of equipped items, different bonuses are given
    -- If 6 or more items are equipped, the maxBonus is applied
    -- If 4 or more items are equipped, the minBonus is applied
    -- Otherwise, no bonuses are applied
    if numEquipped >= 6 then
        removeSpell{ reference = ref, spell = set.minBonus }
        addSpell{ reference = ref, spell = set.maxBonus }
    elseif numEquipped >= 4 then
        addSpell{ reference = ref, spell = set.minBonus }
        removeSpell{ reference = ref, spell = set.maxBonus }
    else
        removeSpell{ reference = ref, spell = set.minBonus }
        removeSpell{ reference = ref, spell = set.maxBonus }
    end
end

-- equipsChanged: A function to handle the event when a character's equipment changes
local function equipsChanged(e)
    -- Get the item id from the event
    local id = e and e.item and e.item.id
    if not id then
        return
    end
    -- Lookup the set the item belongs to
    local set = config.setLinks[id:lower()]
    if not set then
        return
    end
    -- Count the number of items equipped from the same set
    local numEquipped = countItemsEquipped(e.reference, set.items)
    -- Apply set bonus
    addSetBonus(set, e.reference, numEquipped)
end

-- Registering events to call equipsChanged function when equipment changes
event.register("equipped", equipsChanged)
event.register("unequipped", equipsChanged)
event.register("loaded", equipsChanged)

-- npcLoaded: A function to handle the event when an NPC is loaded into the game
local function npcLoaded(e)
    if not e.reference then
        return
    end
    -- Create a table to store the count of items from each set the NPC has equipped
    local setCounts = {}
    for stack in tes3.iterate(e.reference.object.equipment) do
        if stack.object.objectType == tes3.objectType.armor then
            local set = config.setLinks[stack.object.id:lower()] -- Ensure the ID is in lowercase
            if set then
                setCounts[set.name] = (setCounts[set.name] or 0) + 1
            end
        end
    end
    -- For each set, apply the set bonus
    for setName, count in pairs(setCounts) do
        local set = config.sets[setName:lower()]
        addSetBonus(set, e.reference, count)
    end
end

-- Registering events to call npcLoaded function when an NPC is loaded
event.register("mobileActivated", npcLoaded)
event.register("loaded", npcLoaded)

-- Create a global variable for other mods to use the interop module
_G.StaticSetBonusInterop = interop


-- #####################################################################
-- This script is designed to initialize and manage an armor set bonus
-- system in Morrowind. It imports three modules, lfs for filesystem 
-- operations, config for accessing and modifying the configuration 
-- data for the Set Bonus mod, and interop to utilize previously 
-- defined functions for registering and managing sets and their items.

-- Key functions are `initAll`, `countItemsEquipped`, `addSpell`, 
-- `removeSpell`, `addSetBonus`, `equipsChanged`, and `npcLoaded`. 

-- `initAll` initializes and registers all sets and items contained in
-- Lua files in a specified directory path and creates links between 
-- items and their sets in the `config.setLinks` table.

-- `countItemsEquipped` checks if a reference (typically a character)
--  has each item in a given list equipped and returns the count of 
-- equipped items.

-- addSpell and removeSpell are used to manage the spells associated 
-- with a character, depending on the status of their equipment set.

-- addSetBonus determines and applies a bonus based on the number of 
-- items from the same set a character has equipped.

-- equipsChanged handles the event of equipment changes. It finds the
-- set to which the item belongs, counts the number of items equipped
-- from that set, and calls addSetBonus to apply the appropriate bonus.

-- npcLoaded is designed to handle the event when an NPC is loaded into
-- the game. It counts the number of equipped items from each set the 
-- NPC has and applies the relevant set bonuses.

-- Finally, a global variable StaticSetBonusInterop is created for other
-- mods to use the interop module.