return {
        name = "Guard",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 10 },
			{ effect = "shield", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 20 },
			{ effect = "shield", magnitude = 10 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 35 },
			{ effect = "shield", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 15 },
		},
	},
}
