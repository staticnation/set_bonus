return {
        name = "Orsimer",
        items = { "orcish_helm", "orcish_cuirass", "orcish_pauldron_left", "orcish_pauldron_right", "orcish_bracer_left", "orcish_bracer_right", "orcish_greaves", "orcish_boots", "orcish_towershield", "AB_a_OrcHelmOpen", "Sky_iRe_KW_OrcChestIron", "ATL_a_buck_orc", "ATL_a_buck_orc_h", "ATL_a_buck_orc_h_Blood", "ATL_a_buck_orc_Kazul" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
			{ effect = "fortifyHealth", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 10 },
			{ effect = "fortifyHealth", magnitude = 20 },
			{ effect = "resistMagicka", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 15 },
			{ effect = "fortifyHealth", magnitude = 35 },
			{ effect = "resistMagicka", magnitude = 20 },
			{ effect = "fortifyAttackBonus", magnitude = 10 },
		},
	},
}
