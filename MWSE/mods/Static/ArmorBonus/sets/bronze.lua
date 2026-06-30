return {
        name = "Bronze",
        items = { "_WYRM_bronze_helm_crested", "_WYRM_bronze_towershield", "_WYRM_bronze_helmet", "_WYRM_bronze_shield" },
	bonuses = {
		min = {
			{ effect = "shield", magnitude = 5 },
			{ effect = "resistShock", magnitude = 10 },
		},
		mid = {
			{ effect = "shield", magnitude = 10 },
			{ effect = "resistShock", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
		},
		max = {
			{ effect = "shield", magnitude = 15 },
			{ effect = "resistShock", magnitude = 35 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
		},
	},
}
