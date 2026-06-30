return {
        name = "Dragonscale",
        items = { "dragonscale_helm", "dragonscale_cuirass", "dragonscale_towershield" },
	bonuses = {
		min = {
			{ effect = "resistFire", magnitude = 20 },
		},
		mid = {
			{ effect = "resistFire", magnitude = 35 },
			{ effect = "resistMagicka", magnitude = 15 },
		},
		max = {
			{ effect = "resistFire", magnitude = 60 },
			{ effect = "resistMagicka", magnitude = 25 },
			{ effect = "shield", magnitude = 10 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
		},
	},
}
