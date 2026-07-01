return {
        name = "Bearskin",
        items = { "fur_bearskin_cuirass" },
	bonuses = {
		min = {
			{ effect = "resistFrost", magnitude = 10 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 3 },
		},
		mid = {
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "weaknesstoFire", magnitude = 10 },
		},
		max = {
			{ effect = "resistFrost", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "weaknesstoFire", magnitude = 20 },
		},
	},
}
