return {
        name = "Bearskin",
        items = { "fur_bearskin_cuirass" },
	bonuses = {
		min = {
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
		},
		mid = {
			{ effect = "resistFrost", magnitude = 30 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 10 },
			{ effect = "fortifyHealth", magnitude = 20 },
		},
		max = {
			{ effect = "resistFrost", magnitude = 45 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 15 },
			{ effect = "fortifyHealth", magnitude = 35 },
		},
	},
}
