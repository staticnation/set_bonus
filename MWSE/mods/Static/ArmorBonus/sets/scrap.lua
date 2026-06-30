return {
        name = "Scrap",
        items = { "NOD_RV_dwemscr_boots", "NOD_RV_dwemscr_bracer_left", "NOD_RV_dwemscr_bracer_right", "NOD_RV_dwemscr_cuirass", "NOD_RV_dwemscr_helmet", "NOD_RV_dwemscr_greaves", "NOD_RV_dwemscr_pauldron_left", "NOD_RV_dwemscr_pauldron_right" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 10 },
			{ effect = "fortifyFatigue", magnitude = 25 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 15 },
			{ effect = "fortifyFatigue", magnitude = 50 },
			{ effect = "shield", magnitude = 5 },
		},
	},
}
