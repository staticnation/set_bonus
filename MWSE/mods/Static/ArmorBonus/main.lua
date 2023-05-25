local config = require("Static.SetBonus.config")
local interop = require("Static.SetBonus.interop")
-- Initializing set files using the interop module
interop.initAll("Data Files/MWSE/mods/Static/ArmorBonus/sets")
for _, set in pairs(config.sets) do
    for _, item in ipairs(set.items) do
        config.setLinks[item] = set
    end
end