return {
        name = "Netch Leather",
        items = { "netch_leather_helm", "netch_leather_cuirass", "netch_leather_pauldron_left", "netch_leather_pauldron_right", "netch_leather_gauntlet_left", "netch_leather_gauntlet_right", "netch_leather_greaves", "netch_leather_boots", "snetch_leather_shield", "netch_leather_boiled_helm", "netch_leather_boiled_cuirass", "netch_leather_towershield", "boots of blinding speed[unique]", "left_horny_fist_gauntlet", "right horny fist gauntlet", "veloths_tower_shield", "merisan_cuirass", "netch_leather_shield", "ATL_a_buck_netch", "ATL_a_buck_netch_h", "ATL_a_buck_netch_h_Vampire", "ATL_a_buck_netch_RedOak", "ATL_a_buck_netch_ThiefsWard" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 12 },
			{ effect = "resistPoison", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 8 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "fortifySkill", skill = "athletics", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "speed", magnitude = 8 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
