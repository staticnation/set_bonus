return {
        name = "Goblin",
        items = { "goblin_shield_durgok_uni", "goblin_shield" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 3 },
			{ effect = "resistCommonDisease", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
			{ effect = "resistCommonDisease", magnitude = 15 },
			{ effect = "fortifyFatigue", magnitude = 20 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
			{ effect = "resistCommonDisease", magnitude = 20 },
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "fortifyAttack", magnitude = 8 },
		},
	},
}
