-- Importing necessary modules
-- lfs is LuaFileSystem, a library to handle directory operations in Lua
-- The 'config' module holds the configuration data for the Set Bonus mod
-- The 'interop' module contains functions for registering sets, items, and set directories
local lfs = require("lfs")
local config = require("Static.SetBonus.config")
local interop = require("Static.SetBonus.interop") -- Importing the interop module we defined earlier

-- 'countItemsEquipped' function checks if a character reference has each item from a given list equipped
local function countItemsEquipped(ref, items)
    local count = 0
    
    -- Loop over the items
    for _, item in ipairs(items) do
        
        -- Check if the item is equipped by the given reference (typically a character)
        if mwscript.hasItemEquipped{reference=ref, item=item} then
            count = count + 1
        end
    end
    return count -- Returns the count of equipped items
end

-- 'addSpell' function: If the provided target (t) already has the spell effect, 
-- it returns the spell effect. If not, it adds the spell to the target.
local function addSpell(t) 
    return mwscript.getSpellEffects(t) or mwscript.addSpell(t) 
end

-- 'removeSpell' function: If the provided target (t) has the spell effect, 
-- it returns the spell effect and also removes the spell from the target. If not, it simply returns false.
local function removeSpell(t) 
    return mwscript.getSpellEffects(t) and mwscript.removeSpell(t) 
end

-- 'addSetBonus' function applies a set bonus based on the number of items a character has equipped from the same set
local function addSetBonus(set, ref, numEquipped)

    -- If the character has equipped 6 or more items from the set, remove the minimum bonus and add the maximum bonus
    if numEquipped >= 6 then
        removeSpell{ reference = ref, spell = set.minBonus }
        addSpell{ reference = ref, spell = set.maxBonus }
        
    -- If the character has equipped 4 or more items from the set, add the minimum bonus and remove the maximum bonus
    elseif numEquipped >= 4 then
        addSpell{ reference = ref, spell = set.minBonus }
        removeSpell{ reference = ref, spell = set.maxBonus }

    -- If the character has equipped less than 4 items from the set, remove both bonuses
    else
        removeSpell{ reference = ref, spell = set.minBonus }
        removeSpell{ reference = ref, spell = set.maxBonus }
    end
end

-- 'equipsChanged' function handles the event when a character's equipment changes
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
event.register("loaded", equipsChanged)

-- 'npcLoaded' function handles the event when an NPC is loaded into the game
local function npcLoaded(e)
    if not e.reference then
        return
    end

    -- Create a table to store the count of items from each set the NPC has equipped
    local setCounts = {}    
    for stack in tes3.iterate(e.reference.object.equipment) do
        local allowedTypes = {
          [tes3.objectType.armor] = true,
          [tes3.objectType.clothing] = true
        }
        if allowedTypes[stack.object.objectType] then
            local set = config.setLinks[stack.object.id:lower()] -- Ensure the ID is in lowercase
            if set ~= nil then
                setCounts[set.name] = (setCounts[set.name] or 0) + 1
            end
        end
    end

    -- For each set, apply the set bonus
    for set, count in pairs(setCounts) do
        local set = config.sets[setName:lower()]
        addSetBonus(set, e.reference, count)
    end
end

-- Registering events to call 'npcLoaded' function when an NPC is loaded
event.register("mobileActivated", npcLoaded)
event.register("loaded", npcLoaded)

-- Create a global variable 'StaticSetBonusInterop' for other mods to use the interop module
_G.StaticSetBonusInterop = interop

--[[ 
SUMMARY OF FUNCTIONS AND LOOPS:

1. Function 'countItemsEquipped':
    - This function checks if a character reference (like a player or NPC) has each item from a provided list equipped.
    - It iterates over the provided list of items, checking if each item is equipped by the reference, and increments a counter if it is.
    - Finally, it returns the total count of equipped items.

2. Functions 'addSpell' and 'removeSpell':
    - These functions manage the spells associated with a character based on their equipped set.
    - 'addSpell' either returns the spell effects of a character or adds a new spell to the character.
    - 'removeSpell' either returns the spell effects of a character or removes a spell from the character.

3. Function 'addSetBonus':
    - This function applies a set bonus to a character based on the number of items the character has equipped from the same set.
    - It checks the number of equipped items, and depending on the number, it applies the appropriate bonus or removes existing bonuses.

4. Function 'equipsChanged':
    - This function handles the event when a character's equipment changes.
    - It identifies the set to which the changed item belongs, counts the number of items equipped from that set, and applies the set bonus using the 'addSetBonus' function.

5. Function 'npcLoaded':
    - This function handles the event when an NPC is loaded into the game.
    - It counts the number of equipped items from each set the NPC has and applies the relevant set bonuses.

6. Loops:
    - Several loops are used to iterate over items and equipment. For example, the loop in 'countItemsEquipped' iterates over the item list to count equipped items.
    - The loop in 'npcLoaded' iterates over an NPC's equipment to count the number of items from each set.
]]