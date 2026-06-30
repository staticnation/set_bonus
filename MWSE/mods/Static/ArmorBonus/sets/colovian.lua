return {
        name = "Colovian",
        items = { "fur_colovian_helm", "fur_colovian_helm_red", "fur_colovian_helm_white" },
	bonuses = {
		min = {
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
		},
		mid = {
			{ effect = "resistFrost", magnitude = 30 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
			{ effect = "fortifyAttackBonus", magnitude = 10 },
		},
		max = {
			{ effect = "resistFrost", magnitude = 45 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 15 },
			{ effect = "fortifyAttackBonus", magnitude = 15 },
			{ effect = "fortifyHealth", magnitude = 25 },
		},
	},
}
