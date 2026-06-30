return {
        name = "Padded",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 25 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 40 },
			{ effect = "resistFrost", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 60 },
			{ effect = "resistFrost", magnitude = 20 },
			{ effect = "fortifyHealth", magnitude = 15 },
		},
	},
}
