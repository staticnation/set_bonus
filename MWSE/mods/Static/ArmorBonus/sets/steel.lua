return {
    	name = "Steel",
        items = { "steel_helm", "steel_cuirass", "steel_pauldron_left", "steel_pauldron_right", "steel_gauntlet_left", "steel_gauntlet_right", "steel_greaves", "steel_boots", "steel_shield", "steel_towershield", "blessed_shield", "blessed_tower_shield", "blood_feast_shield", "steel_boots_ancient", "steel_cuirass_ancient", "steel_gauntlet_left_ancient", "steel_gauntlet_right_ancient", "steel_greaves_ancient", "steel_helm_ancient", "steel_pauldron_left_ancient", "steel_pauldron_right_ancient", "steel_towershield_ancient", "ATL_a_buck_steel", "ATL_a_buck_steel_h", "ATL_a_buck_steel_Divines", "ATL_a_buck_steel_h_Vesicle" },
	bonuses = {
		min = {
			{ effect = "fortifyHealth", magnitude = 8 },
			{ effect = "fortifyAttackBonus", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "fortifyAttackBonus", magnitude = 5 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "fortifyAttackBonus", magnitude = 8 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
