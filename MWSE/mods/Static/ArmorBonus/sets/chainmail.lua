return {
        name = "Chain Mail",
        items = { "imperial_chain_pauldron_right", "imperial_chain_pauldron_left", "imperial_chain_greaves", "imperial_chain_coif_helm", "imperial_chain_cuirass", "_WYRM_chain_coif" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 25 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 40 },
			{ effect = "resistNormalWeapons", magnitude = 5 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 60 },
			{ effect = "resistNormalWeapons", magnitude = 10 },
			{ effect = "shield", magnitude = 5 },
		},
	},
}
