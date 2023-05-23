-- main.lua
local setBonusInterop = include("Static.SetBonus.interop")

-- Register sets from a directory
setBonusInterop.registerSetsFromDirectory("sets")

-- Register sets from local defined table
local sets = {
  --Add new set configs here
  {
    --some data here for example
    name = "Adamantium",
    items = { "adamantium_helm", "addamantium_helm", "adamantium_cuirass", "adamantium_pauldron_left", "adamantium_pauldron_right", "adamantium_greaves", "adamantium_boots", "adamantium_bracer_left", "adamantium_bracer_right", "helm_tohan_unique" },
    minBonus = "_sn_adam_min",
    maxBonus = "_sn_adam_max"
  } 
}

-- Register individual sets
for _, set in ipairs(sets) do
    setBonusInterop.registerSet(set)
end