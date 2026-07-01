return {
        name = "Templar",
        items = { "templar_helmet_armor", "templar_cuirass", "templar_pauldron_left", "templar_pauldron_right", "templar bracer left", "templar bracer right", "templar_greaves", "templar boots", "_WYRM_templar_pld_l", "_WYRM_templar_pld_r" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 8 },
			{ effect = "turnUndead", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "turnUndead", magnitude = 15 },
			{ effect = "resistMagicka", magnitude = 8 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "turnUndead", magnitude = 20 },
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "fortifyAttackBonus", magnitude = 8 },
		},
	},
}
