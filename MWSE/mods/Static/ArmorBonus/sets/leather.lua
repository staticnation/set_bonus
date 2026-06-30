return {
        name = "Leather",
        items = { "right leather bracer", "left leather bracer", "netch_leather_helm", "netch_leather_boiled_helm", "netch_leather_pauldron_left", "netch_leather_cuirass", "netch_leather_boiled_cuirass", "netch_leather_gauntlet_left", "netch_leather_gauntlet_right", "netch_leather_greaves", "netch_leather_boots", "netch_leather_shield", "netch_leather_towershield", "nordic_leather_shield", "netch_leather_pauldron_right", "heavy_leather_boots", "AB_a_LeatherHat", "NOD_R0_netch_leather_pauldron_l", "NOD_R0_netch_leather_pauldron_r" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "fortifySkill", skill = "acrobatics", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 35 },
			{ effect = "fortifySkill", skill = "acrobatics", magnitude = 10 },
			{ effect = "fortifySkill", skill = "sneak", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 50 },
			{ effect = "fortifySkill", skill = "acrobatics", magnitude = 15 },
			{ effect = "fortifySkill", skill = "sneak", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
		},
	},
}
