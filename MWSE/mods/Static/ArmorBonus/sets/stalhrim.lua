return {
        name = "Stalhrim",
        items = { "bm_ice_boots", "bm_ice_cuirass ", "bm_ice_greaves", "bm_ice_helmet", "bm_ice_gauntletl", "bm_ice_gauntletr", "bm_ice_pauldronl boots", "bm_ice_pauldronr", "bm_ice_shield" },
	bonuses = {
		min = {
			{ effect = "resistFrost", magnitude = 10 },
		},
		mid = {
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "restoreMagicka", magnitude = 1, duration = 1 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "resistFrost", magnitude = 20 },
			{ effect = "restoreMagicka", magnitude = 2, duration = 1 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
