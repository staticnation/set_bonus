return {
        name = "Wolf Fur",
        items = { "BM wolf cuirass", "BM wolf greaves", "BM Wolf Helmet", "bm wolf left gauntlet", "BM Wolf Left Pauldron", "BM wolf right gauntlet", "BM Wolf right pauldron", "BM wolf boots", "BM_wolf_cuirass_snow", "BM_wolf_greaves_snow", "BM_wolf_helmet_snow", "BM_wolf_left_gauntlet_snow", "BM_wolf_left_pauldron_snow", "BM_wolf_right_gauntlet_snow", "BM_wolf_right_pauldron_snow", "BM_wolf_boots_snow", "BM wolf shield", "BM Wolf Helmet_heartfang" },
	bonuses = {
		min = {
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
		},
		mid = {
			{ effect = "resistFrost", magnitude = 30 },
			{ effect = "fortifyAttribute", attribute = "speed", magnitude = 10 },
			{ effect = "nightEye", magnitude = 25 },
		},
		max = {
			{ effect = "resistFrost", magnitude = 45 },
			{ effect = "fortifyAttribute", attribute = "speed", magnitude = 15 },
			{ effect = "nightEye", magnitude = 50 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 15 },
		},
	},
}
