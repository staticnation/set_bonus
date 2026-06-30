return {
        name = "Trollbone",
        items = { "trollbone_helm", "trollbone_cuirass", "trollbone_shield" },
	bonuses = {
		min = {
			{ effect = "restoreHealth", magnitude = 1, duration = 1 },
		},
		mid = {
			{ effect = "restoreHealth", magnitude = 2, duration = 1 },
			{ effect = "resistFrost", magnitude = 15 },
		},
		max = {
			{ effect = "restoreHealth", magnitude = 3, duration = 1 },
			{ effect = "resistFrost", magnitude = 30 },
			{ effect = "fortifyHealth", magnitude = 25 },
		},
	},
}
