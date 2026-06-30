return {
        name = "Glass",
        items = { "glass_helm", "glass_cuirass", "glass_shield", "glass_towershield", "glass_pauldron_left", "glass_pauldron_right", "glass_boots", "glass_greaves", "glass_bracer_left", "glass_bracer_right", "AB_a_GlassAssassinPauldronLeft", "AB_a_GlassAssassinPauldronRight", "AB_a_GlassHelmClose", "AATL_a_buck_glass", "AATL_a_buck_glass_h", "ATL_a_buck_glass", "ATL_a_buck_glass_h", "ATL_a_buck_glass_KissAlessia", "ATL_a_buck_glass_h_Delyns_Kiln", "ATL_a_buck_glass_Wizards_Ward" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
			{ effect = "resistFire", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
			{ effect = "resistFire", magnitude = 20 },
			{ effect = "sanctuary", magnitude = 8 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
			{ effect = "resistFire", magnitude = 30 },
			{ effect = "sanctuary", magnitude = 12 },
			{ effect = "chameleon", magnitude = 15 },
		},
	},
}
