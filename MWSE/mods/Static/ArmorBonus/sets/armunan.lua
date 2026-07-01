return {
        name = "Armun-An",
        items = { "bonemold_armun-an_helm", "bonemold_armun-an_pauldron_r", "bonemold_armun-an_pauldron_l", "bonemold_armun-an_cuirass" },
	bonuses = {
		min = {
			{ effect = "resistFire", magnitude = 10 },
		},
		mid = {
			{ effect = "resistFire", magnitude = 15 },
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "weaknesstoFrost", magnitude = 10 },
		},
		max = {
			{ effect = "resistFire", magnitude = 20 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "weaknesstoFrost", magnitude = 20 },
		},
	},
}
