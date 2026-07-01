return {
        name = "Daedric",
        items = { "daedric_fountain_helm", "daedric_terrifying_helm", "daedric_god_helm", "daedric_pauldron_left", "daedric_pauldron_right", "daedric_cuirass", "daedric_gauntlet_left", "daedric_gauntlet_right", "daedric_greaves", "daedric_boots", "daedric_shield", "daedric_towershield", "daedric_cuirass_htab", "daedric_greaves_htab", "daedric_helm_clavicusvile", "azura's servant", "ATL_a_buck_daed", "ATL_a_buck_daed_h", "ATL_a_buck_daed_mana", "ATL_a_buck_daed_h_Thunderward", "ATL_a_buck_daed_LightningStrike", "daedric_helm_clavicusvile_x" },
	bonuses = {
		min = {
			{ effect = "spellAbsorption", magnitude = 3 },
		},
		mid = {
			{ effect = "spellAbsorption", magnitude = 5 },
			{ effect = "resistMagicka", magnitude = 8 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "spellAbsorption", magnitude = 8 },
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "fortifyAttack", magnitude = 8 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
