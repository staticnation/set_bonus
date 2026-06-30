return {
        name = "Master",
        items = { "redoran_master_helm" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
			{ effect = "fortifyFatigue", magnitude = 20 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 10 },
			{ effect = "fortifyFatigue", magnitude = 40 },
			{ effect = "fortifyHealth", magnitude = 20 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 15 },
			{ effect = "fortifyFatigue", magnitude = 60 },
			{ effect = "fortifyHealth", magnitude = 30 },
			{ effect = "fortifyAttackBonus", magnitude = 10 },
		},
	},
}
