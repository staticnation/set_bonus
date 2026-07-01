return {
        name = "Bronze",
        items = { "_WYRM_bronze_helm_crested", "_WYRM_bronze_towershield", "_WYRM_bronze_helmet", "_WYRM_bronze_shield" },
	bonuses = {
		min = {
			{ effect = "resistNormalWeapons", magnitude = 3 },
			{ effect = "resistShock", magnitude = 10 },
		},
		mid = {
			{ effect = "resistNormalWeapons", magnitude = 5 },
			{ effect = "resistShock", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
		},
		max = {
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "resistShock", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
		},
	},
}
