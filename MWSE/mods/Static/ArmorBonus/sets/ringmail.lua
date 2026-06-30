return {
        name = "Ring Mail",
        items = { "nordic_ringmail_cuirass" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 35 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 50 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
			{ effect = "shield", magnitude = 5 },
		},
	},
}
