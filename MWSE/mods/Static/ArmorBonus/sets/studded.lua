return {
        name = "Studded",
        items = { "imperial_studded_cuirass" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "resistNormalWeapons", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 35 },
			{ effect = "resistNormalWeapons", magnitude = 5 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 50 },
			{ effect = "resistNormalWeapons", magnitude = 10 },
			{ effect = "shield", magnitude = 5 },
		},
	},
}
