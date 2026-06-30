return {
        name = "Royal Guard",
        items = { "helsethguard_helmet", "helsethguard_cuirass ", "helsethguard_pauldron_left", "helsethguard_pauldron_right", "helsethguard_greaves", "helsethguard_boots", "helsethguard_gauntlet_left", "helsethguard_gauntlet_right" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 15 },
			{ effect = "shield", magnitude = 8 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 25 },
			{ effect = "shield", magnitude = 12 },
			{ effect = "resistMagicka", magnitude = 15 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 45 },
			{ effect = "shield", magnitude = 18 },
			{ effect = "resistMagicka", magnitude = 25 },
			{ effect = "fortifyAttackBonus", magnitude = 15 },
		},
	},
}
