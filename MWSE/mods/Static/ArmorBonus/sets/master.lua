return {
        name = "Master",
        items = { "redoran_master_helm" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 3 },
			{ effect = "fortifyFatigue", magnitude = 12 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "fortifyHealth", magnitude = 12 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "fortifyAttack", magnitude = 8 },
		},
	},
}
