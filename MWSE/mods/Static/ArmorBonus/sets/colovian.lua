return {
        name = "Colovian",
        items = { "fur_colovian_helm", "fur_colovian_helm_red", "fur_colovian_helm_white" },
	bonuses = {
		min = {
			{ effect = "resistFrost", magnitude = 10 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 3 },
		},
		mid = {
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
			{ effect = "fortifyAttack", magnitude = 5 },
		},
		max = {
			{ effect = "resistFrost", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
			{ effect = "fortifyAttack", magnitude = 8 },
			{ effect = "fortifyHealth", magnitude = 18 },
		},
	},
}
