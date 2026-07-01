return {
        name = "Dragonscale",
        items = { "dragonscale_helm", "dragonscale_cuirass", "dragonscale_towershield" },
	bonuses = {
		min = {
			{ effect = "resistFire", magnitude = 10 },
		},
		mid = {
			{ effect = "resistFire", magnitude = 15 },
			{ effect = "resistMagicka", magnitude = 8 },
			{ effect = "weaknesstoFrost", magnitude = 10 },
		},
		max = {
			{ effect = "resistFire", magnitude = 20 },
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "resistNormalWeapons", magnitude = 8 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
			{ effect = "weaknesstoFrost", magnitude = 20 },
		},
	},
}
