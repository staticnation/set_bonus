return {
	name = "Orcish",
	items = { "orcish_helm", "orcish_cuirass", "orcish_pauldron_left", "orcish_pauldron_right", "orcish_bracer_left", "orcish_bracer_right", "orcish_greaves", "orcish_boots", "orcish_towershield", "ATL_a_buck_orc", "ATL_a_buck_orc_h", "ATL_a_buck_orc_Kazul", "ATL_a_buck_orc_h_Blood" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 8 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "fortifyAttackBonus", magnitude = 8 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
