return {
        name = "Templar",
        items = { "templar_helmet_armor", "templar_cuirass", "templar_pauldron_left", "templar_pauldron_right", "templar bracer left", "templar bracer right", "templar_greaves", "templar boots", "_WYRM_templar_pld_l", "_WYRM_templar_pld_r" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 10 },
			{ effect = "turnUndead", magnitude = 15 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 20 },
			{ effect = "turnUndead", magnitude = 25 },
			{ effect = "resistMagicka", magnitude = 15 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 35 },
			{ effect = "turnUndead", magnitude = 40 },
			{ effect = "resistMagicka", magnitude = 25 },
			{ effect = "fortifyAttackBonus", magnitude = 10 },
		},
	},
}
