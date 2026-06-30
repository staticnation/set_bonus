return {
        name = "Tribunal Temple",
        items = { "indoril helmet", "indoril cuirass", "indoril pauldron left", "indoril pauldron right", "indoril left gauntlet", "indoril right gauntlet", "indoril boots", "indoril shield", "spirit of indoril", "succour of indoril", "indoril_mh_guard_helmet", "indoril_mh_guard_cuirass ", "indoril_mh_guard_pauldron_l", "indoril_mh_guard_pauldron_r", "indoril_mh_guard_greaves", "indoril_mh_guard_boots", "indoril_mh_guard_gauntlet_l", "indoril_mh_guard_gauntlet_r", "indoril_mh_guard_shield" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 15 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 10 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 25 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 20 },
			{ effect = "restoreHealth", magnitude = 1, duration = 1 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 40 },
			{ effect = "fortifySkill", skill = "restoration", magnitude = 30 },
			{ effect = "restoreHealth", magnitude = 2, duration = 1 },
			{ effect = "turnUndead", magnitude = 30 },
		},
	},
}
