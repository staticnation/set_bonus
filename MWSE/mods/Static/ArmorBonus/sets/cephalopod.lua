return {
        name = "Cephalopod",
        items = { "cephalopod_helm", "demon cephalopod", "devil cephalopod helm", "cephalopod_helm_HTNK" },
	bonuses = {
		min = {
			{ effect = "swiftSwim", magnitude = 20 },
			{ effect = "waterBreathing", magnitude = 1 },
		},
		mid = {
			{ effect = "swiftSwim", magnitude = 30 },
			{ effect = "waterBreathing", magnitude = 1 },
			{ effect = "sanctuary", magnitude = 7 },
		},
		max = {
			{ effect = "swiftSwim", magnitude = 40 },
			{ effect = "waterBreathing", magnitude = 1 },
			{ effect = "sanctuary", magnitude = 10 },
			{ effect = "resistFrost", magnitude = 20 },
		},
	},
}
