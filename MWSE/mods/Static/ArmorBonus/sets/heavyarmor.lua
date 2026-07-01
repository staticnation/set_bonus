return {
        name = "Heavy Armor",
        items = { "daedric_fountain_helm", "daedric_terrifying_helm", "daedric_god_helm", "daedric_pauldron_left", "daedric_pauldron_right", "daedric_cuirass", "daedric_gauntlet_left", "daedric_gauntlet_right", "daedric_greaves", "daedric_boots", "daedric_shield", "daedric_towershield", "daedric_cuirass_htab", "daedric_greaves_htab", "daedric_helm_clavicusvile", "azura's servant" },
	bonuses = {
		min = {
			{ effect = "resistNormalWeapons", magnitude = 3 },
			{ effect = "fortifyHealth", magnitude = 8 },
		},
		mid = {
			{ effect = "resistNormalWeapons", magnitude = 5 },
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
		},
		max = {
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
		},
	},
}
