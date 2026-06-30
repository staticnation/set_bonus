return {
        name = "Native",
        items = { "AB_a_IronDeBoots", "AB_a_IronDeCuirass", "AB_a_IronDeHelm", "AB_a_IronDeHelmTong", "AB_a_IronDePldLeft", "AB_a_IronDePldRight", "bonemold_gah-julan_hhda", "bonemold_gah-julan_helm", "bonemold_chuzei_helm", "bonemold_armun-an_helm", "bonemold_gah-julan_pauldron_r", "bonemold_armun-an_pauldron_r", "bonemold_gah-julan_pauldron_l", "bonemold_armun-an_pauldron_l", "bonemold_gah-julan_cuirass", "bonemold_armun-an_cuirass" },
	bonuses = {
		min = {
			{ effect = "resistBlightDisease", magnitude = 15 },
			{ effect = "resistPoison", magnitude = 15 },
		},
		mid = {
			{ effect = "resistBlightDisease", magnitude = 25 },
			{ effect = "resistPoison", magnitude = 25 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 10 },
		},
		max = {
			{ effect = "resistBlightDisease", magnitude = 40 },
			{ effect = "resistPoison", magnitude = 40 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 20 },
			{ effect = "resistFire", magnitude = 25 },
		},
	},
}
