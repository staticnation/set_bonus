-- Importing modules
-- lfs is LuaFileSystem, a library to handle directory operations in Lua
-- config module is the configuration data for the Set Bonus mod
-- interop is the previously defined module providing functions to register sets, items, and set directories
local lfs = require("lfs")
local config = require("Static.SetBonus.config")
local interop = require("Static.SetBonus.interop") -- Importing the interop module we defined earlier

-- initAll: A function that takes a directory path as input, reads all Lua files in the directory,
-- and registers the sets and items defined in the Lua files. It then creates links between each item and its set.
local function initAll(path)
    debug.log(path)
    -- Using LuaFileSystem to iterate through all files in the directory

    -- Loop through all files in the given path
    for file in lfs.dir(path) do

        -- If the file ends in .lua (indicating it's a Lua file), we try to load it as a module
        if file:match("(.+)%.lua$") then -- Only processing Lua files
            local modulePath = path .. "/" .. file
            
            -- Use pcall to call the dofile function, which loads and runs the Lua file. This way, if there are any errors, it won't crash the script
            local success, set = pcall(dofile, modulePath) -- Using pcall to handle any errors when loading the Lua files
            if success then
                
                -- Loop through the items in the set
                for _, item in ipairs(set.items) do
                end
                interop.registerSet(set) -- If the Lua file is loaded successfully, register the set using the interop module's function
            else
            end
        end
    end

    -- After registering all sets and items, create links in the setLinks table in the config module
    -- Loop over the registered sets to create links between items and their sets
    for _, set in pairs(config.sets) do
        for _, item in ipairs(set.items) do
            config.setLinks[item] = set
        end
    end
end

-- Initializing set files using the interop module
initAll("Data Files/MWSE/mods/Static/ArmorBonus/sets")

-- After loading the sets, create links in the setLinks table in the config module again
-- Loop over sets to create links
for _, set in pairs(config.sets) do
    for _, item in ipairs(set.items) do
        config.setLinks[item] = set
    end
end

-- countItemsEquipped: A function that checks if a reference (usually a character) has each item in a given list equipped
local function countItemsEquipped(ref, items)
    local count = 0
    -- Loop over the items
    for _, item in ipairs(items) do
        
        -- Check if the item is equipped by the given reference (most likely the player or an NPC)
        if mwscript.hasItemEquipped{reference=ref, item=item} then
            count = count + 1
        end
    end
    return count -- Return the count
end

local function addSpell(t) return mwscript.getSpellEffects(t) or mwscript.addSpell(t) end
local function removeSpell(t) return mwscript.getSpellEffects(t) and mwscript.removeSpell(t) end

-- addSetBonus: A function to add set bonus based on the number of equipped items from the same set
local function addSetBonus(set, ref, numEquipped)
    -- If the player has equipped 6 or more items from the set, remove the minimum bonus and add the maximum bonus
    if numEquipped >= 6 then
        removeSpell{ reference = ref, spell = set.minBonus }
        addSpell{ reference = ref, spell = set.maxBonus }
        mwseLogger("Added max set bonus for set %s", set.name)
        
    -- If the player has equipped 4 or more items from the set, add the minimum bonus and remove the maximum bonus
    elseif numEquipped >= 4 then
        addSpell{ reference = ref, spell = set.minBonus }
        removeSpell{ reference = ref, spell = set.maxBonus }
        mwseLogger("Added min set bonus for set %s", set.name)
        
    -- If the player has equipped less than 4 items from the set, remove both bonuses
    else
        removeSpell{ reference = ref, spell = set.minBonus }
        removeSpell{ reference = ref, spell = set.maxBonus }
        mwseLogger("No set bonus added for set %s", set.name)
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
    if (set == nil) then
        return
    end

    -- Count the number of items equipped from the same set
    local numEquipped = countItemsEquipped(e.reference, set.items)

    if e.reference == tes3.player then
        tes3.messageBox("You have %s items of the %s set equipped", numEquipped, set.name)
    end
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
        if stack.object.objectType == tes3.objectType.armor or tes3.objectType.clothing then
            local set = config.setLinks[stack.object.id:lower()] -- Ensure the ID is in lowercase
            if set ~= nil then
                setCounts[set.name] = (setCounts[set.name] or 0) + 1
            else
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