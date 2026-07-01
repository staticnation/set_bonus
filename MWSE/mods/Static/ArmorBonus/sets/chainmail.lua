return {
        name = "Chain Mail",
        items = { "imperial_chain_pauldron_right", "imperial_chain_pauldron_left", "imperial_chain_greaves", "imperial_chain_coif_helm", "imperial_chain_cuirass", "_WYRM_chain_coif" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 12 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "resistNormalWeapons", magnitude = 5 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
