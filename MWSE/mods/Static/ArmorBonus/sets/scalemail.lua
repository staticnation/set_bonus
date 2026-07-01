return {
        name = "Scale Mail",
        items = { "newtscale_cuirass", "dragonscale_helm", "dragonscale_cuirass", "dragonscale_towershield" },
	bonuses = {
		min = {
			{ effect = "resistNormalWeapons", magnitude = 3 },
		},
		mid = {
			{ effect = "resistNormalWeapons", magnitude = 5 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
