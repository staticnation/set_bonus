return {
        name = "Adamantium",
        items = { "adamantium_helm", "addamantium_helm", "adamantium_cuirass", "adamantium_pauldron_left", "adamantium_pauldron_right", "adamantium_greaves", "adamantium boots", "adamantium_bracer_left", "adamantium_bracer_right", "helm_tohan_unique" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 5 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 8 },
			{ effect = "reflect", magnitude = 5 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "reflect", magnitude = 8 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
