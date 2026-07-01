return {
        name = "Fur",
        items = { "fur_helm", "fur_colovian_helm", "fur_pauldron_left", "fur_cuirass", "fur_bracer_left", "fur_bracer_right", "fur_greaves", "fur_boots", "fur_pauldron_right", "fur_gauntlet_left", "fur_gauntlet_right", "fur_colovian_helm_red", "fur_colovian_helm_white" },
	bonuses = {
		min = {
			{ effect = "resistFrost", magnitude = 10 },
			{ effect = "fortifyFatigue", magnitude = 12 },
		},
		mid = {
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "resistFrost", magnitude = 20 },
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
