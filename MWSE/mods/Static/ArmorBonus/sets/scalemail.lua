return {
        name = "Scale Mail",
        items = { "newtscale_cuirass", "dragonscale_helm", "dragonscale_cuirass", "dragonscale_towershield" },
	bonuses = {
		min = {
			{ effect = "shield", magnitude = 5 },
			{ effect = "resistNormalWeapons", magnitude = 5 },
		},
		mid = {
			{ effect = "shield", magnitude = 10 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
		},
		max = {
			{ effect = "shield", magnitude = 15 },
			{ effect = "resistNormalWeapons", magnitude = 12 },
			{ effect = "fortifyHealth", magnitude = 20 },
		},
	},
}
