return {
        name = "Cloth",
        items = { "cloth bracer left", "cloth bracer right", "right cloth horny fist bracer", "left cloth horny fist bracer" },
	bonuses = {
		min = {
			{ effect = "restoreMagicka", magnitude = 1, duration = 1 },
			{ effect = "feather", magnitude = 5 },
		},
		mid = {
			{ effect = "restoreMagicka", magnitude = 1, duration = 1 },
			{ effect = "feather", magnitude = 10 },
			{ effect = "fortifySkill", skill = "alteration", magnitude = 8 },
			{ effect = "weaknesstoNormalWeapons", magnitude = 10 },
		},
		max = {
			{ effect = "restoreMagicka", magnitude = 2, duration = 1 },
			{ effect = "feather", magnitude = 15 },
			{ effect = "fortifySkill", skill = "alteration", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 8 },
			{ effect = "weaknesstoNormalWeapons", magnitude = 20 },
		},
	},
}
