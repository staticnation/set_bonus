-- Importing modules
local lfs = require('lfs') -- filesystem functions
local config = require("Static.Set Bonus.config") -- your custom configuration
local sets = config.sets -- sets from the configuration
local setLinks = config.setLinks -- setLinks from the configuration
local interop = require("Static.Set Bonus.init") -- your custom initialization code
local util = require("Static.Set Bonus.util") -- your custom utility functions

-- Function to load and register set data
local function initAll(path)
    path = "sets" .. path .. "/"
    for file in lfs.dir(path) do
        if file:match("(.+)%.lua$") then
            local modulePath = path .. file:match("(.+)%.lua$")
            mwse.log("Loading set file: %s", modulePath) -- Debug log
            local set = require(modulePath)
            interop.registerSet(set)
        end
    end
end

-- Load set files using interop
initAll("sets") -- Make sure this "sets" folder is present in the project directory

-- Loop over sets to create links
for id, set in pairs(sets) do
    mwse.log("Creating links for set: %s", set.name)
    for _, item in ipairs(set.items) do
        mwse.log("  setLinks[%s] = sets[%s]", item, id)
        setLinks[item:lower()] = set
    end
end

-- Function to count equipped items
local function countItemsEquipped(ref, items)
    local count = 0
    for _, item in ipairs(items) do
        mwse.log("Checking if item %s is equipped...", item) -- Debug log
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
        removeSpell{reference=ref, spell=set.minBonus}
        addSpell{reference=ref, spell=set.maxBonus}
    elseif numEquipped >= 4 then
        addSpell{reference=ref, spell=set.minBonus}
        removeSpell{reference=ref, spell=set.maxBonus}
    else
        removeSpell{reference=ref, spell=set.minBonus}
        removeSpell{reference=ref, spell=set.maxBonus}
    end
end

-- Function to handle change in equipped items
local function equipsChanged(e)
    -- Perform the nil check first.
    local id = e and e.item and e.item.id
    if not id then 
        mwse.log("equipsChanged event fired, but no item data was found.")
        return 
    end

    -- Now we know e.item.id exists, it's safe to log it.
    mwse.log("equipsChanged event fired for item: %s", e.item.id)
    
    local set = setLinks[id:lower()]
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
    mwse.log("mobileActivated event fired")
    if not e.reference then return end
    local set_counts = {}

    for stack in tes3.iterate(e.reference.object.equipment) do
        if stack.object.objectType == tes3.objectType.armor then
            mwse.log("Checking equipment stack: %s", stack.object.id) -- Debug log
            local set = setLinks[stack.object.id:lower()]
            if set then
                set_counts[set] = (set_counts[set] or 0) + 1
            end
        end
    end

    for set, count in pairs(set_counts) do
        mwse.log("Adding set bonus for set: %s", set.name) -- Debug log
        addSetBonus(set, e.reference, count)
    end
end

-- Registering events
event.register("mobileActivated", npcLoaded)
event.register("loaded", npcLoaded)