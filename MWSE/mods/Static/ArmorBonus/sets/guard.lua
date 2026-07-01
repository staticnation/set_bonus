return {
        name = "Guard",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 8 },
			{ effect = "resistNormalWeapons", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "resistNormalWeapons", magnitude = 5 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
