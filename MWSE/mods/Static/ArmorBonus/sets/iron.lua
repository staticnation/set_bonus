return {
        name = "Iron",
        items = { "nordic_iron_helm", "nordic_iron_cuirass", "iron_pauldron_left", "iron_pauldron_right", "iron_cuirass", "iron_shield", "iron_towershield", "iron_bracer_left", "iron_bracer_right", "iron_greaves", "iron_gauntlet_left", "iron_gauntlet_right", "iron_helmet", "iron boots", "ATL_a_buck_iron", "ATL_a_buck_iron_h", "ATL_a_buck_niron", "ATL_a_buck_niron_h", "ATL_a_buck_niron_avalanche", "ATL_a_buck_niron_h_iceward", "ATL_a_buck_iron_h_Thunderwave", "ATL_a_buck_iron_Devil", "ATL_a_buck_iron_h_WarriorsWard" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 8 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
