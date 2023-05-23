-- Importing modules
local lfs = require("lfs") -- lfs is LuaFileSystem, a library to handle directory in Lua

local config = require("Static.SetBonus.config")
local interop = require("Static.SetBonus.interop") -- The interop module we defined

-- Load and register set data
local function initAll(path)
    path = "Data Files/MWSE/mods/Static/ArmorBonus/sets/" .. path .. "/"
    for file in lfs.dir(path) do
        if file:match("(.+)%.lua$") then
            local modulePath = dofile(path .. "/" .. file)
            mwse.log("Loading set file: %s", modulePath)
            local success, set = xpcall(function() return require(modulePath) end, 
                function(err) 
                    mwse.log("Error loading set file: %s. Error: %s", modulePath, err)
                end)

            if success then
                mwse.log("Loaded set: %s", set.name or "")
                for _, item in ipairs(set.items) do
                    mwse.log("  Item in set: %s", item)
                end
                interop.registerSet(set)
            end
        end
    end
end

-- Load set files using interop
initAll("Data Files/MWSE/mods/Static/ArmorBonus/sets")

-- Loop over sets to create links
for _, set in pairs(config.sets) do
    mwse.log("Creating links for set: %s", set.name)
    for _, item in ipairs(set.items) do
        mwse.log("  Linking item to set: %s -> %s", item, set.name)
        config.setLinks[item] = set
    end
end

-- Function to count equipped items
local function countItemsEquipped(ref, items)
    local count = 0
    for _, item in ipairs(items) do
        mwse.log("Checking if item %s is equipped...", item)
        if mwscript.hasItemEquipped{reference=ref, item=item} then
            count = count + 1
        end
    end
    return count
end

-- Function to add a spell
local function addSpell(t)
    for _, spell in ipairs(t.spell) do
        mwse.log("Trying to add spell: %s", spell) -- Debug log
        if not mwscript.getSpellEffects{reference=t.reference, spell=spell} then
            mwscript.addSpell{reference=t.reference, spell=spell}
        end
    end
end

-- Function to remove a spell
local function removeSpell(t)
    for _, spell in ipairs(t.spell) do
        mwse.log("Trying to remove spell: %s", spell) -- Debug log
        if mwscript.getSpellEffects{reference=t.reference, spell=spell} then
            mwscript.removeSpell{reference=t.reference, spell=spell}
        end
    end
end


-- Function to add set bonus
local function addSetBonus(set, ref, numEquipped)
    if numEquipped >= 6 then
        removeSpell{ reference = ref, spell = set.minBonus }
        addSpell{ reference = ref, spell = set.maxBonus }
        mwse.log("Added max set bonus for set %s", set.name)
    elseif numEquipped >= 4 then
        addSpell{ reference = ref, spell = set.minBonus }
        removeSpell{ reference = ref, spell = set.maxBonus }
        mwse.log("Added min set bonus for set %s", set.name)
    else
        removeSpell{ reference = ref, spell = set.minBonus }
        removeSpell{ reference = ref, spell = set.maxBonus }
        mwse.log("No set bonus added for set %s", set.name)
    end
end

-- Function to handle change in equipped items
local function equipsChanged(e)
    local id = e and e.item and e.item.id
    if not id then
        mwse.log("equipsChanged event fired, but no item data was found.")
        return
    end

    mwse.log("equipsChanged event fired for item: %s", e.item.id)

    local set = config.setLinks[id:lower()]
    if not set then
        mwse.log("Item: %s is not linked to any set", id)
        return
    end

    mwse.log("Item: %s is linked to set: %s", id, set.name)
    local numEquipped = countItemsEquipped(e.reference, set.items)

    if e.reference == tes3.player then
        tes3.messageBox("You have %s items of the %s set equipped", numEquipped, set.name)
    end

    addSetBonus(set, e.reference, numEquipped)
end

-- Registering events
event.register("equipped", equipsChanged)
event.register("unequipped", equipsChanged)
event.register("loaded", equipsChanged)

-- Function to handle NPC load event
local function npcLoaded(e)
    if not e.reference then 
        return 
    end
    mwse.log("mobileActivated event fired")
    local setCounts = {}

    for stack in tes3.iterate(e.reference.object.equipment) do
        if stack.object.objectType == tes3.objectType.armor then
            mwse.log("Checking equipment stack: %s", stack.object.id)
            local set = config.setLinks[stack.object.id:lower()] -- Ensure the ID is in lowercase
            if set then
                mwse.log("Item: %s is linked to set: %s", stack.object.id, set.name)
                setCounts[set.name] = (setCounts[set.name] or 0) + 1
            else
                mwse.log("Item: %s is not linked to any set", stack.object.id)
            end
        end
    end

    for _, setName, count in pairs(setCounts) do
        mwse.log("Adding set bonus for set: %s", setName)
        local set = config.sets[setName:lower()]
        addSetBonus(set, e.reference, count)
    end
end

-- Registering events
event.register("mobileActivated", npcLoaded)
event.register("loaded", npcLoaded)

-- Create a global variable for other mods to use the interop module
_G.StaticSetBonusInterop = interop
