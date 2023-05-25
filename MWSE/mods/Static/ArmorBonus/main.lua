-- Import required modules
local config = require("Static.SetBonus.config")
local interop = require("Static.SetBonus.interop")

-- 'initAll' function from 'interop' module is used to initialize all set files in a specific directory
interop.initAll("Data Files/MWSE/mods/Static/ArmorBonus/sets")

-- This loop registers each item to its set in the 'setLinks' table
for _, set in pairs(config.sets) do
    for _, item in ipairs(set.items) do
        config.setLinks[item] = set
    end
end

--[[ 
SUMMARY:

1. The 'config' and 'interop' modules from the 'Static.SetBonus' package are required at the beginning.
2. The 'initAll' function from the 'interop' module is used to initialize all set files in the specified directory. 
   These files define different sets of items for the Set Bonus mod.
3. The subsequent loop goes through each set in the 'config.sets' table.
4. Within each set, it loops over each item and registers the item to its set in the 'setLinks' table.
5. This provides a way to quickly find which set an item belongs to by looking it up in the 'setLinks' table.
]]