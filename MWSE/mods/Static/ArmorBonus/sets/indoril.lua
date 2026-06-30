return {
        name = "House Indoril",
        items = { "indoril shield", "indoril pauldron left", "indoril pauldron right", "indoril helmet", "indoril cuirass", "indoril left gauntlet", "indoril right gauntlet", "indoril boots", "succour of indoril", "spirit of indoril", "Indoril_Almalexia_helmet", "Indoril_Almalexia_boots", "Indoril_Almalexia_Cuirass", "Indoril_Almalexia_Greaves", "Indoril_Almalexia_Pauldron_L", "Indoril_Almalexia_Pauldron_R", "Indoril_Almalexia_gauntlet_R", "Indoril_Almalexia_gauntlet_L", "Indoril_Almalexia_shield", "Indoril_MH_Guard_boots", "Indoril_MH_Guard_Cuirass", "Indoril_MH_Guard_gauntlet_L", "Indoril_MH_Guard_gauntlet_R", "Indoril_MH_Guard_Greaves", "Indoril_MH_Guard_helmet", "Indoril_MH_Guard_Pauldron_L", "Indoril_MH_Guard_Pauldron_R", "Indoril_MH_Guard_shield", "NOD_ARindoril", "NOD_ARindoril2", "NOD_AR_IndRobe1", "NOD_AR_IndHelm", "NOD_AR_IndRobe_nC1", "NOD_ARindoril_hood", "NOD_ARindoril_hood&Mask", "NOD_AR_indoril helmet2" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 15 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 10 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 25 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 40 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 30 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
			{ effect = "turnUndead", magnitude = 25 },
		},
	},
}
