return {
        name = "Goblin",
        items = { "goblin_shield_durgok_uni", "goblin_shield" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
			{ effect = "resistCommonDisease", magnitude = 15 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 10 },
			{ effect = "resistCommonDisease", magnitude = 25 },
			{ effect = "fortifyFatigue", magnitude = 30 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 15 },
			{ effect = "resistCommonDisease", magnitude = 40 },
			{ effect = "fortifyFatigue", magnitude = 50 },
			{ effect = "fortifyAttackBonus", magnitude = 10 },
		},
	},
}
