return {
        name = "Hide",
        items = { "cuirass_savior_unique_x", "cuirass_savior_unique" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 12 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 8 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "speed", magnitude = 8 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
