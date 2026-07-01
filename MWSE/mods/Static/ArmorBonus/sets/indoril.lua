return {
        name = "House Indoril",
        items = { "indoril shield", "indoril pauldron left", "indoril pauldron right", "indoril helmet", "indoril cuirass", "indoril left gauntlet", "indoril right gauntlet", "indoril boots", "succour of indoril", "spirit of indoril", "Indoril_Almalexia_helmet", "Indoril_Almalexia_boots", "Indoril_Almalexia_Cuirass", "Indoril_Almalexia_Greaves", "Indoril_Almalexia_Pauldron_L", "Indoril_Almalexia_Pauldron_R", "Indoril_Almalexia_gauntlet_R", "Indoril_Almalexia_gauntlet_L", "Indoril_Almalexia_shield", "Indoril_MH_Guard_boots", "Indoril_MH_Guard_Cuirass", "Indoril_MH_Guard_gauntlet_L", "Indoril_MH_Guard_gauntlet_R", "Indoril_MH_Guard_Greaves", "Indoril_MH_Guard_helmet", "Indoril_MH_Guard_Pauldron_L", "Indoril_MH_Guard_Pauldron_R", "Indoril_MH_Guard_shield" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 5 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 5 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 8 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 8 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
			{ effect = "turnUndead", magnitude = 20 },
		},
	},
}
