return {
        name = "Newtscale",
        items = { "newtscale_cuirass" },
	bonuses = {
		min = {
			{ effect = "resistPoison", magnitude = 10 },
			{ effect = "swiftSwim", magnitude = 20 },
		},
		mid = {
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "swiftSwim", magnitude = 30 },
			{ effect = "waterBreathing", magnitude = 1 },
			{ effect = "weaknesstoFrost", magnitude = 10 },
		},
		max = {
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "swiftSwim", magnitude = 40 },
			{ effect = "waterBreathing", magnitude = 1 },
			{ effect = "resistCommonDisease", magnitude = 20 },
			{ effect = "weaknesstoFrost", magnitude = 20 },
		},
	},
}
