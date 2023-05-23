-- init.lua: Interoperability module for the Set Bonus mod.
-- This script exposes two functions for external scripts:
-- `registerSet`: Allows external scripts to register new set data.
-- `registerSetLink`: Allows external scripts to register new set link data.

local interop = {}
local config = require("Static.SetBonus.config")

-- Register a new set.
-- `setData` should be a table with at least a `name` field and an `items` field.
-- The `items` field should be an array of item IDs that are part of the set.
-- The set data is stored in `config.sets` with the set's name as the key.
function interop.registerSet(setData)
    assert(setData.name, "setData must have a `name` field.")
    assert(setData.items, "setData must have an `items` field.")
    config.sets[setData.name:lower()] = setData
end

-- Register a new set link.
-- `setLinkData` should be a table where the keys are item IDs and the values are corresponding set names.
-- The set link data is merged into `config.setLinks` so that items can be associated with their sets.
function interop.registerSetLink(setLinkData)
    for itemId, setName in pairs(setLinkData) do
        config.setLinks[itemId:lower()] = config.sets[setName:lower()]
    end
end

return interop