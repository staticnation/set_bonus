return {
        name = "Newtscale",
        items = { "newtscale_cuirass" },
	bonuses = {
		min = {
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "swiftSwim", magnitude = 20 },
		},
		mid = {
			{ effect = "resistPoison", magnitude = 25 },
			{ effect = "swiftSwim", magnitude = 40 },
			{ effect = "waterBreathing", magnitude = 1 },
		},
		max = {
			{ effect = "resistPoison", magnitude = 40 },
			{ effect = "swiftSwim", magnitude = 60 },
			{ effect = "waterBreathing", magnitude = 1 },
			{ effect = "resistCommonDisease", magnitude = 30 },
		},
	},
}
