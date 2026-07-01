return {
        name = "Orsimer",
        items = { "orcish_helm", "orcish_cuirass", "orcish_pauldron_left", "orcish_pauldron_right", "orcish_bracer_left", "orcish_bracer_right", "orcish_greaves", "orcish_boots", "orcish_towershield", "Sky_iRe_KW_OrcChestIron", "ATL_a_buck_orc", "ATL_a_buck_orc_h", "ATL_a_buck_orc_h_Blood", "ATL_a_buck_orc_Kazul" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 3 },
			{ effect = "fortifyHealth", magnitude = 8 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "resistMagicka", magnitude = 8 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "fortifyAttack", magnitude = 8 },
		},
	},
}
