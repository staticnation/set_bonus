return {
        name = "Heavy Armor",
        items = { "daedric_fountain_helm", "daedric_terrifying_helm", "daedric_god_helm", "daedric_pauldron_left", "daedric_pauldron_right", "daedric_cuirass", "daedric_gauntlet_left", "daedric_gauntlet_right", "daedric_greaves", "daedric_boots", "daedric_shield", "daedric_towershield", "daedric_cuirass_htab", "daedric_greaves_htab", "daedric_helm_clavicusvile", "azura's servant" },
	bonuses = {
		min = {
			{ effect = "shield", magnitude = 5 },
			{ effect = "fortifyHealth", magnitude = 10 },
		},
		mid = {
			{ effect = "shield", magnitude = 10 },
			{ effect = "fortifyHealth", magnitude = 25 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
		},
		max = {
			{ effect = "shield", magnitude = 15 },
			{ effect = "fortifyHealth", magnitude = 40 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 15 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
		},
	},
}
