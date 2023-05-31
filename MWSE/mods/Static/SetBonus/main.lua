-- Importing necessary modules
--- The 'config' module holds the configuration data for the Set Bonus mod
local log = require("Static.logger")
local config = require("Static.SetBonus.config")
-- 'countItemsEquipped' function checks if a character reference has each item from a given list equipped
---@param ref tes3reference
---@param items tes3item[]
---@return number
local function countItemsEquipped(ref, items)
    log:info("countItemsEquipped: Entry point")
    if not items or type(items) ~= "table" then
        return 0
    end
    local count = 0
    -- Loop over the items
    for _, item in ipairs(items) do
        -- Check if the item is equipped by the given reference (typically a character)
        ---@diagnostic disable-next-line
        if ref.object:hasItemEquipped(item) then
            count = count + 1
        end
    end
    -- Log the counted items
    log:debug("countItemsEquipped: Counted %s equipped items for the reference: %s", count, ref)
    return count -- Returns the count of equipped items
end
-- 'addSetBonus' function applies a set bonus based on the number of items a character has equipped from the same set
---@param set table
---@param ref tes3reference
---@param numEquipped number
local function addSetBonus(set, ref, numEquipped)
    log:info("addSetBonus: Entry point")

    -- Add bonuses based on the number of equipped items
    if numEquipped >= 6 then
        log:debug("addSetBonus: Attempting to add max bonus spell. Reference: %s, Spell: %s", ref, set.maxBonus)
        log:debug("addSetBonus: Types - Reference: %s, Spell: %s", type(ref), type(set.maxBonus))
        tes3.addSpell{ reference = ref, spell = set.maxBonus }
        tes3.removeSpell{ reference = ref, spell = set.midBonus }
    elseif numEquipped >= 4 and numEquipped < 6 then
        log:debug("addSetBonus: Attempting to add mid bonus spell. Reference: %s, Spell: %s", ref, set.midBonus)
        log:debug("addSetBonus: Types - Reference: %s, Spell: %s", type(ref), type(set.midBonus))
        tes3.addSpell{ reference = ref, spell = set.midBonus }
        tes3.removeSpell{ reference = ref, spell = set.minBonus }
    elseif numEquipped >= 2 and numEquipped < 4 then
        log:debug("addSetBonus: Attempting to add min bonus spell. Reference: %s, Spell: %s", ref, set.minBonus)
        log:debug("addSetBonus: Types - Reference: %s, Spell: %s", type(ref), type(set.minBonus))
        tes3.addSpell{ reference = ref, spell = set.minBonus }
    else
        log:info("addSetBonus: No bonuses applicable")
    end
    -- Remove non-applicable bonuses
    if numEquipped < 2 and tes3.hasSpell({reference = ref, spell = set.minBonus}) then
        log:debug("addSetBonus: Attempting to remove min bonus spell. Reference: %s, Spell: %s", ref, set.minBonus)
        log:debug("addSetBonus: Types - Reference: %s, Spell: %s", type(ref), type(set.minBonus))
        tes3.removeSpell{ reference = ref, spell = set.minBonus }
    end
    if numEquipped < 4 and tes3.hasSpell({reference = ref, spell = set.midBonus}) then
        log:debug("addSetBonus: Attempting to remove mid bonus spell. Reference: %s, Spell: %s", ref, set.midBonus)
        log:debug("addSetBonus: Types - Reference: %s, Spell: %s", type(ref), type(set.midBonus))
        tes3.removeSpell{ reference = ref, spell = set.midBonus }
    end
    if numEquipped < 6 and tes3.hasSpell({reference = ref, spell = set.maxBonus}) then
        log:debug("addSetBonus: Attempting to remove max bonus spell. Reference: %s, Spell: %s", ref, set.maxBonus)
        log:debug("addSetBonus: Types - Reference: %s, Spell: %s", type(ref), type(set.maxBonus))
        tes3.removeSpell{ reference = ref, spell = set.maxBonus }
    end
    log:info("addSetBonus: Exit point")
end
-- 'equipsChanged' function handles the event when a character's equipment changes
---@param e equippedEventData
local function equipsChanged(e)
    log:info("equipsChanged: Entry point")
    -- Get the item id from the event
    local id = e and e.item and e.item.id
    if not id then
        return
    end
    -- Find the set that the item belongs to
    local linkSet = config.setLinks[id:lower()]
    if not linkSet then
        return
    end
    -- Iterate over each set in the linkSet dictionary
    for setName, _ in pairs(linkSet) do
        local set = config.sets[setName]
        if set then
            local numEquipped = countItemsEquipped(e.reference, set.items)
            -- Log the number of equipped items
            log:debug("equipsChanged: items from set (%s) by reference (%s): %s", setName, e.reference, numEquipped)
            -- Provide a notification if the character is the player
            if e.reference == tes3.player then
                tes3.messageBox("You have %s items of the %s set equipped", numEquipped, setName)
            end
            -- Apply set bonus
            addSetBonus(set, e.reference, numEquipped)
        end
    end
    log:info("equipsChanged: Exit point")
end
-- Registering events to call 'equipsChanged' function when equipment changes
event.register("equipped", equipsChanged)
event.register("unequipped", equipsChanged)
-- 'npcLoaded' function handles the event when an NPC is loaded into the game
---@param e mobileActivatedEventData
local function npcLoaded(e)
    log:info("npcLoaded: Entry point")
    if not e.reference then return end
    if not e.reference.object.equipment then return end
    -- Create a table to store the count of items from each set the NPC has equipped
    local setCounts = {}
    local allowedTypes = {
      [tes3.objectType.armor] = true,
      [tes3.objectType.clothing] = true,
      [tes3.objectType.weapon] = true
    }
    for _, stack in pairs(e.reference.object.equipment) do
        if allowedTypes[stack.object.objectType] then
            local keySets = config.setLinks[stack.object.id:lower()] -- Ensure the ID is in lowercase
            if keySets ~= nil then
                for set, _ in pairs(keySets) do
                    setCounts[set] = (setCounts[set] or 0) + 1
                end
            end
        end
    end
    -- For each set, apply the set bonus
    for setName, count in pairs(setCounts) do
        local set = config.sets[setName:lower()]
        if set then
            addSetBonus(set, e.reference, count)
        end
    end
    log:info("npcLoaded: Exit point")
end
-- Registering events to call 'npcLoaded' function when an NPC is loaded
event.register(tes3.event.mobileActivated, npcLoaded)
event.register(tes3.event.loaded, npcLoaded)