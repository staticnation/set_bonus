return {
        name = "Plate",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "shield", magnitude = 10 },
			{ effect = "fortifyHealth", magnitude = 10 },
		},
		mid = {
			{ effect = "shield", magnitude = 15 },
			{ effect = "fortifyHealth", magnitude = 25 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
		},
		max = {
			{ effect = "shield", magnitude = 20 },
			{ effect = "fortifyHealth", magnitude = 45 },
			{ effect = "resistNormalWeapons", magnitude = 15 },
		},
	},
}
