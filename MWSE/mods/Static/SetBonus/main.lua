-- Importing modules
local lfs = require('lfs')
local init = require("Static.SetBonus.init")
local config = require("Static.SetBonus.config")
local interop = require("Static.SetBonus.interop") -- The interop module we defined

-- Load and register set data
local function initAll(path)
    path = "sets/" .. path .. "/"
    for file in lfs.dir(path) do
        if file:match("(.+)%.lua$") then
            local modulePath = path .. file:match("(.+)%.lua$")
            mwse.log("Loading set file: %s", modulePath)
            local set = dofile(modulePath)

            mwse.log("Loaded set: %s", set.name or "")

            interop.registerSet(set)
            interop.mergeTables(config.sets[set.name], set) -- Merge the existing set with the new set
        end
    end
end

-- Load set files using interop
initAll("")

-- Loop over sets to create links
for name, set in pairs(config.sets) do
    mwse.log("Creating links for set: %s", name)
    for _, item in ipairs(set.items) do
        mwse.log("  setLinks[%s] = sets[%s]", item, name)
        config.setLinks[item:lower()] = config.sets[name:lower()]
    end
end

-- Function to count equipped items
local function countItemsEquipped(ref, items)
    local count = 0
    for _, item in ipairs(items) do
        mwse.log("Checking if item %s is equipped...", item)
        if tes3.hasItemEquipped(ref, item) then
            count = count + 1
        end
    end
    return count
end

-- Function to add a spell
local function addSpell(t)
    for _, spell in ipairs(t.spell) do
        mwse.log("Trying to add spell: %s", spell)
        if not tes3.hasSpell(t.reference, spell) then
            tes3.addSpell(t.reference, spell)
        end
    end
end

-- Function to remove a spell
local function removeSpell(t)
    for _, spell in ipairs(t.spell) do
        mwse.log("Trying to remove spell: %s", spell)
        if tes3.hasSpell(t.reference, spell) then
            tes3.removeSpell(t.reference, spell)
        end
    end
end

-- Function to add set bonus
local function addSetBonus(set, ref, numEquipped)
    local minBonus = set.minBonus or {}
    local maxBonus = set.maxBonus or {}

    if type(minBonus) == "string" then
        minBonus = { minBonus }
    end

    if type(maxBonus) == "string" then
        maxBonus = { maxBonus }
    end

    if numEquipped >= 6 then
        removeSpell{ reference = ref, spell = minBonus }
        addSpell{ reference = ref, spell = maxBonus }
    elseif numEquipped >= 4 then
        addSpell{ reference = ref, spell = minBonus }
        removeSpell{ reference = ref, spell = maxBonus }
    else
        removeSpell{ reference = ref, spell = minBonus }
        removeSpell{ reference = ref, spell = maxBonus }
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

    local lowercaseId = id:lower()
    local set = config.setLinks[lowercaseId]
    if not set then
        mwse.log("Item: %s is not linked to any set", lowercaseId)
        return
    end

    mwse.log("Item: %s is linked to set: %s", lowercaseId, set.name)
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
    mwse.log("mobileActivated event fired")
    local setCounts = {}

    for stack in tes3.iterate(e.reference.object.equipment) do
        if stack.object.objectType == tes3.objectType.armor then
            mwse.log("Checking equipment stack: %s", stack.object.id)
            local set = config.setLinks[stack.object.id:lower()] -- Ensure the ID is in lowercase
            if set then
                setCounts[set] = (setCounts[set] or 0) + 1
            end
        end
    end

    for set, count in pairs(setCounts) do
        mwse.log("Adding set bonus for set: %s", set.name)
        addSetBonus(set, e.reference, count)
    end
end

-- Registering events
event.register("mobileActivated", npcLoaded)
event.register("loaded", npcLoaded)

-- Create a global variable for other mods to use the interop module
_G.StaticSetBonusInterop = interop