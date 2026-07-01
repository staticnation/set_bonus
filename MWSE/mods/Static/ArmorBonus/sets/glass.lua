return {
        name = "Glass",
        items = { "glass_helm", "glass_cuirass", "glass_shield", "glass_towershield", "glass_pauldron_left", "glass_pauldron_right", "glass_boots", "glass_greaves", "glass_bracer_left", "glass_bracer_right", "ATL_a_buck_glass", "ATL_a_buck_glass_h", "ATL_a_buck_glass_KissAlessia", "ATL_a_buck_glass_h_Delyns_Kiln", "ATL_a_buck_glass_Wizards_Ward" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
			{ effect = "resistFire", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
			{ effect = "resistFire", magnitude = 15 },
			{ effect = "sanctuary", magnitude = 7 },
			{ effect = "weaknesstoFrost", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
			{ effect = "resistFire", magnitude = 20 },
			{ effect = "sanctuary", magnitude = 10 },
			{ effect = "chameleon", magnitude = 10 },
			{ effect = "weaknesstoFrost", magnitude = 20 },
		},
	},
}
