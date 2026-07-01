return {
        name = "Gah-Julan",
        items = { "bonemold_gah-julan_hhda", "bonemold_gah-julan_cuirass", "bonemold_gah-julan_pauldron_l", "bonemold_gah-julan_pauldron_r", "bonemold_gah-julan_helm" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 8 },
			{ effect = "resistBlightDisease", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "resistBlightDisease", magnitude = 15 },
			{ effect = "resistNormalWeapons", magnitude = 5 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "resistBlightDisease", magnitude = 20 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "resistFire", magnitude = 20 },
		},
	},
}
