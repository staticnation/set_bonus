return {
        name = "Ring Mail",
        items = { "nordic_ringmail_cuirass" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
