return {
        name = "Padded",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 12 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "resistFrost", magnitude = 20 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
