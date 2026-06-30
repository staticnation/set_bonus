return {
	name = "Orcish",
	items = { "orcish_helm", "orcish_cuirass", "orcish_pauldron_left", "orcish_pauldron_right", "orcish_bracer_left", "orcish_bracer_right", "orcish_greaves", "orcish_boots", "orcish_towershield", "AB_a_OrcHelmOpen", "_RV_Orcishmask_1", "_RV_Orcishmask_2", "ATL_a_buck_orc", "ATL_a_buck_orc_h", "ATL_a_buck_orc_Kazul", "ATL_a_buck_orc_h_Blood" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 25 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 10 },
			{ effect = "fortifyFatigue", magnitude = 30 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 40 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 15 },
			{ effect = "fortifyFatigue", magnitude = 50 },
			{ effect = "fortifyAttackBonus", magnitude = 10 },
		},
	},
}
