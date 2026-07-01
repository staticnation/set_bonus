return {
        name = "Royal Guard",
        items = { "helsethguard_helmet", "helsethguard_cuirass ", "helsethguard_pauldron_left", "helsethguard_pauldron_right", "helsethguard_greaves", "helsethguard_boots", "helsethguard_gauntlet_left", "helsethguard_gauntlet_right" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 8 },
			{ effect = "resistNormalWeapons", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "resistNormalWeapons", magnitude = 5 },
			{ effect = "resistMagicka", magnitude = 8 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "fortifyAttackBonus", magnitude = 8 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
