return {
        name = "Hide",
        items = { "cuirass_savior_unique_x", "cuirass_savior_unique" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 20 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 35 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 50 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
		},
	},
}
