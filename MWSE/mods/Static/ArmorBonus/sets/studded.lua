return {
        name = "Studded",
        items = { "imperial_studded_cuirass" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 12 },
			{ effect = "resistNormalWeapons", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "resistNormalWeapons", magnitude = 5 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
