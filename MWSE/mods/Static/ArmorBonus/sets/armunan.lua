return {
        name = "Armun-An",
        items = { "bonemold_armun-an_helm", "bonemold_armun-an_pauldron_r", "bonemold_armun-an_pauldron_l", "bonemold_armun-an_cuirass" },
	bonuses = {
		min = {
			{ effect = "resistFire", magnitude = 15 },
		},
		mid = {
			{ effect = "resistFire", magnitude = 25 },
			{ effect = "fortifyHealth", magnitude = 20 },
		},
		max = {
			{ effect = "resistFire", magnitude = 40 },
			{ effect = "fortifyHealth", magnitude = 35 },
			{ effect = "shield", magnitude = 10 },
		},
	},
}
