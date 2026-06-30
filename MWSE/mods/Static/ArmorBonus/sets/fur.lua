return {
        name = "Fur",
        items = { "fur_helm", "fur_colovian_helm", "fur_pauldron_left", "fur_cuirass", "fur_bracer_left", "fur_bracer_right", "fur_greaves", "fur_boots", "fur_pauldron_right", "fur_gauntlet_left", "fur_gauntlet_right", "fur_colovian_helm_red", "fur_colovian_helm_white" },
	bonuses = {
		min = {
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "fortifyFatigue", magnitude = 20 },
		},
		mid = {
			{ effect = "resistFrost", magnitude = 30 },
			{ effect = "fortifyFatigue", magnitude = 35 },
		},
		max = {
			{ effect = "resistFrost", magnitude = 50 },
			{ effect = "fortifyFatigue", magnitude = 50 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
		},
	},
}
