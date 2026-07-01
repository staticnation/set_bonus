return {
        name = "Kynareth",
        items = { "_WYRM_kynareth_gauntlet_right", "_WYRM_kynareth_pauldron_right", "_WYRM_kynareth_gauntlet_left", "_WYRM_kynareth_pauldron_left", "_WYRM_kynareth_shield_battle", "_WYRM_kynareth_shield_round", "_WYRM_kynareth_open_helm", "_WYRM_kynareth_cuirass", "_WYRM_kynareth_greaves", "_WYRM_kynareth_quiver", "_WYRM_kynareth_shield", "_WYRM_kynareth_tabard", "_WYRM_kynareth_boots", "_WYRM_kynareth_helm", "_WYRM_kynareth_quiver2" },
	bonuses = {
		min = {
			{ effect = "slowFall", magnitude = 10 },
			{ effect = "resistShock", magnitude = 10 },
		},
		mid = {
			{ effect = "slowFall", magnitude = 15 },
			{ effect = "resistShock", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
		},
		max = {
			{ effect = "slowFall", magnitude = 20 },
			{ effect = "resistShock", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "speed", magnitude = 8 },
			{ effect = "fortifyFatigue", magnitude = 28 },
		},
	},
}
