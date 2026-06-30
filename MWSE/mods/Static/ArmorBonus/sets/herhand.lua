return {
        name = "Her Hand",
        items = { "Indoril_Almalexia_helmet", "Indoril_Almalexia_boots", "Indoril_Almalexia_Cuirass", "Indoril_Almalexia_Greaves", "Indoril_Almalexia_Pauldron_L", "Indoril_Almalexia_Pauldron_R", "Indoril_Almalexia_gauntlet_R", "Indoril_Almalexia_gauntlet_L", "Indoril_Almalexia_shield", "Indoril_MH_Guard_boots", "Indoril_MH_Guard_Cuirass", "Indoril_MH_Guard_gauntlet_L", "Indoril_MH_Guard_gauntlet_R", "Indoril_MH_Guard_Greaves", "Indoril_MH_Guard_helmet", "Indoril_MH_Guard_Pauldron_L", "Indoril_MH_Guard_Pauldron_R", "Indoril_MH_Guard_shield" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 15 },
			{ effect = "fortifyHealth", magnitude = 10 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 25 },
			{ effect = "fortifyHealth", magnitude = 20 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 15 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 40 },
			{ effect = "fortifyHealth", magnitude = 35 },
			{ effect = "turnUndead", magnitude = 30 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 25 },
		},
	},
}
