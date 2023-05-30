-- Importing necessary modules
-- lfs is LuaFileSystem, a library to handle directory operations in Lua
-- The 'config' module holds the configuration data for the Set Bonus mod
-- The 'interop' module contains functions for registering sets, items, and set directories
local lfs = require("lfs")
local config = require("Static.SetBonus.config")
local interop = require("Static.SetBonus.interop") -- Importing the interop module we defined earlier

-- 'countItemsEquipped' function checks if a character reference has each item from a given list equipped
---@param ref tes3reference
---@param items tes3item[]
---@return number
local function countItemsEquipped(ref, items)
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

    -- If the character has equipped 6 or more items from the set, remove the minimum bonus and add the maximum bonus
    if numEquipped >= 6 then
        tes3.removeSpell{ reference = ref, spell = set.minBonus }
        tes3.addSpell{ reference = ref, spell = set.maxBonus }

    -- If the character has equipped 4 or more items from the set, add the minimum bonus and remove the maximum bonus
    elseif numEquipped >= 4 and numEquipped < 6 then
        tes3.addSpell{ reference = ref, spell = set.minBonus }
        tes3.removeSpell{ reference = ref, spell = set.maxBonus }

    -- If the character has equipped less than 4 items from the set, remove both bonuses
    else
        tes3.removeSpell{ reference = ref, spell = set.minBonus }
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
    local set = config.setLinks[id:lower()]
    if (set == nil) then
        return
    end

    -- Count the number of items equipped from the same set
    local numEquipped = countItemsEquipped(e.reference, set.items)

    -- Provide a notification if the character is the player
    if e.reference == tes3.player then
        tes3.messageBox("You have %s items of the %s set equipped", numEquipped, set.name)
    end

    -- Apply set bonus
    addSetBonus(set, e.reference, numEquipped)
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
    for _, stack in pairs(e.reference.object.equipment) do
        local allowedTypes = {
          [tes3.objectType.armor] = true,
          [tes3.objectType.clothing] = true,
          [tes3.objectType.weapon] = true
        }
        if allowedTypes[stack.object.objectType] then
            local set = config.setLinks[stack.object.id:lower()] -- Ensure the ID is in lowercase
            if set ~= nil then
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


-- Registering events to call 'npcLoaded' function when an NPC is loaded
event.register(tes3.event.mobileActivated, npcLoaded)
event.register(tes3.event.loaded, npcLoaded)

--[[ 
SUMMARY OF FUNCTIONS:

1. Function 'countItemsEquipped':
    - This function checks if a character reference (like a player or NPC) has each item from a provided list equipped.
    - It iterates over the provided list of items, checking if each item is equipped by the reference, and increments a counter if it is.
    - Finally, it returns the total count of equipped items.

2. Function 'addSetBonus':
    - This function applies a set bonus to a character based on the number of items the character has equipped from the same set.
    - It checks the number of equipped items, and depending on the number, it applies the appropriate bonus or removes existing bonuses.

3 Function 'equipsChanged':
    - This function handles the event when a character's equipment changes.
    - It identifies the set to which the changed item belongs, counts the number of items equipped from that set, and applies the set bonus using the 'addSetBonus' function.

4. Function 'npcLoaded':
    - This function handles the event when an NPC is loaded into the game.
    - It counts the number of equipped items from each set the NPC has and applies the relevant set bonuses.
]]