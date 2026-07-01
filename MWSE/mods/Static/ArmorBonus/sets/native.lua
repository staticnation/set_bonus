return {
        name = "Native",
        items = { "bonemold_gah-julan_hhda", "bonemold_gah-julan_helm", "bonemold_chuzei_helm", "bonemold_armun-an_helm", "bonemold_gah-julan_pauldron_r", "bonemold_armun-an_pauldron_r", "bonemold_gah-julan_pauldron_l", "bonemold_armun-an_pauldron_l", "bonemold_gah-julan_cuirass", "bonemold_armun-an_cuirass" },
	bonuses = {
		min = {
			{ effect = "resistBlightDisease", magnitude = 10 },
			{ effect = "resistPoison", magnitude = 10 },
		},
		mid = {
			{ effect = "resistBlightDisease", magnitude = 15 },
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 8 },
			{ effect = "weaknesstoFrost", magnitude = 10 },
		},
		max = {
			{ effect = "resistBlightDisease", magnitude = 20 },
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 12 },
			{ effect = "resistFire", magnitude = 20 },
			{ effect = "weaknesstoFrost", magnitude = 20 },
		},
	},
}
