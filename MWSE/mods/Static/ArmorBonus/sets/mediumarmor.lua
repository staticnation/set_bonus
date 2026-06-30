return {
        name = "Medium Armor",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 25 },
			{ effect = "shield", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 40 },
			{ effect = "shield", magnitude = 8 },
			{ effect = "fortifyHealth", magnitude = 20 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 60 },
			{ effect = "shield", magnitude = 12 },
			{ effect = "fortifyHealth", magnitude = 30 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
		},
	},
}
