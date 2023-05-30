-- Importing necessary modules
-- lfs is LuaFileSystem, a library to handle directory operations in Lua
--- func descThe 'config' module holds the configuration data for the Set Bonus mod
-- The 'interop' module contains functions for registering sets, items, and set directories
local config = require("Static.SetBonus.config")

-- 'countItemsEquipped' function checks if a character reference has each item from a given list equipped
---@param ref tes3reference
---@param items tes3item[]
---@return number
local function countItemsEquipped(ref, items)
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
    return count -- Returns the count of equipped items
end

-- 'addSetBonus' function applies a set bonus based on the number of items a character has equipped from the same set
---@param set table
---@param ref tes3reference
---@param numEquipped number
local function addSetBonus(set, ref, numEquipped)
    -- Delay the addition of spells to the next frame
    -- If the character has equipped 6 or more items from the set, add the maximum bonus
    if numEquipped > 5 then
        tes3.removeSpell{ reference = ref, spell = set.minBonus }
        tes3.removeSpell{ reference = ref, spell = set.midBonus }
        tes3.addSpell{ reference = ref, spell = set.maxBonus }
        -- If the character has equipped 4 or more items from the set, add the minimum bonus
    elseif numEquipped > 3 and numEquipped < 6 then
        tes3.removeSpell{ reference = ref, spell = set.minBonus}
        tes3.addSpell{ reference = ref, spell = set.midBonus }
        tes3.removeSpell{ reference = ref, spell = set.maxBonus }
    elseif numEquipped > 1 and numEquipped < 4 then
        tes3.addSpell{ reference = ref, spell = set.minBonus }
        tes3.removeSpell{ reference = ref, spell = set.midBonus }
        tes3.removeSpell{ reference = ref, spell = set.maxBonus }
    else     -- Remove all bonuses
        tes3.removeSpell{ reference = ref, spell = set.minBonus }
        tes3.removeSpell{ reference = ref, spell = set.midBonus }
        tes3.removeSpell{ reference = ref, spell = set.maxBonus }
    end
end

-- 'equipsChanged' function handles the event when a character's equipment changes
---@param e equippedEventData
local function equipsChanged(e)

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

            -- Provide a notification if the character is the player
            if e.reference == tes3.player then
                tes3.messageBox("You have %s items of the %s set equipped", numEquipped, setName)
            end
            -- Apply set bonus
            addSetBonus(set, e.reference, numEquipped)
        end
    end
end
-- Registering events to call 'equipsChanged' function when equipment changes
event.register("equipped", equipsChanged)
event.register("unequipped", equipsChanged)

-- 'npcLoaded' function handles the event when an NPC is loaded into the game
---@param e mobileActivatedEventData
local function npcLoaded(e)
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
end


-- Registering events to call 'npcLoaded' function when an NPC is loaded
event.register(tes3.event.mobileActivated, npcLoaded)
event.register(tes3.event.loaded, npcLoaded)

