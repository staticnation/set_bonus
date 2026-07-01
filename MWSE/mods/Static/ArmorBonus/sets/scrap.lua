return {
        name = "Scrap",
        items = {  },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
			{ effect = "fortifyFatigue", magnitude = 20 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
		},
	},
}
