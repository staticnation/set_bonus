return {
        name = "Medium Armor",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 12 },
			{ effect = "resistNormalWeapons", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "resistNormalWeapons", magnitude = 5 },
			{ effect = "fortifyHealth", magnitude = 12 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
		},
	},
}
