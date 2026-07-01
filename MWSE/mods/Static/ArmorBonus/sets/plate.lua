return {
        name = "Plate",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "resistNormalWeapons", magnitude = 3 },
			{ effect = "fortifyHealth", magnitude = 8 },
		},
		mid = {
			{ effect = "resistNormalWeapons", magnitude = 5 },
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
