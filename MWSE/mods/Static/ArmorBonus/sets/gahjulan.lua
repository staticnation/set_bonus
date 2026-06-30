return {
        name = "Gah-Julan",
        items = { "bonemold_gah-julan_hhda", "bonemold_gah-julan_cuirass", "bonemold_gah-julan_pauldron_l", "bonemold_gah-julan_pauldron_r", "bonemold_gah-julan_helm" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 10 },
			{ effect = "resistBlightDisease", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 25 },
			{ effect = "resistBlightDisease", magnitude = 20 },
			{ effect = "shield", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 40 },
			{ effect = "resistBlightDisease", magnitude = 30 },
			{ effect = "shield", magnitude = 15 },
			{ effect = "resistFire", magnitude = 20 },
		},
	},
}
