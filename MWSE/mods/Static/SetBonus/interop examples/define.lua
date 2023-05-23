local setBonusInterop = include("Static.SetBonus.interop")
local sets = {
  -- Add new set configs here
  {
    name = "Adamantium",
    items = { "adamantium_helm", "addamantium_helm", "adamantium_cuirass", "adamantium_pauldron_left", "adamantium_pauldron_right", "adamantium_greaves", "adamantium_boots", "adamantium_bracer_left", "adamantium_bracer_right", "helm_tohan_unique" },
    minBonus = "_sn_adam_min",
    maxBonus = "_sn_adam_max"
  }
}

if setBonusInterop then
  for _, set in ipairs(sets) do
    setBonusInterop.registerSet(set)
  end
end
