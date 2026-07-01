return {
        name = "Trollbone",
        items = { "trollbone_helm", "trollbone_cuirass", "trollbone_shield" },
	bonuses = {
		min = {
			{ effect = "restoreHealth", magnitude = 1, duration = 1 },
		},
		mid = {
			{ effect = "restoreHealth", magnitude = 1, duration = 1 },
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "restoreHealth", magnitude = 1, duration = 1 },
			{ effect = "resistFrost", magnitude = 20 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
