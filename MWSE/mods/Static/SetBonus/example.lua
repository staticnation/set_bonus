-- example.lua -- copy-paste template for registering your own set.
-- This file is NOT loaded automatically. Put real registrations in your mod's
-- own main.lua, or drop per-set files in a folder and call setBonus.initAll(...).
-- See SetBonus_Interop_Guide.md for the full API.

local setBonus = require("Static.SetBonus.interop")
if not (setBonus and setBonus.version >= 2) then return end

setBonus.registerSet{
    name = "Example Glassweave",
    items = {
        "example_glass_helm", "example_glass_cuirass", "example_glass_greaves",
        "example_glass_boots", "example_glass_pauldron_l", "example_glass_pauldron_r",
    },
    bonuses = {
        min = {
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
        },
        mid = {
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
            { effect = "sanctuary", magnitude = 8 },
        },
        max = {
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
            { effect = "sanctuary", magnitude = 12 },
            { effect = "chameleon", magnitude = 15 },
            { effect = "restoreFatigue", magnitude = 2, duration = 1 },
        },
    },
}
