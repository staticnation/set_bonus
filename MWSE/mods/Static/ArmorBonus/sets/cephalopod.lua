return {
        name = "Cephalopod",
        items = { "cephalopod_helm", "demon cephalopod", "devil cephalopod helm", "cephalopod_helm_HTNK", "AB_a_CephHelmOpen", "AB_a_CephPauldronLeft", "AB_a_CephPauldronRight" },
	bonuses = {
		min = {
			{ effect = "swiftSwim", magnitude = 30 },
			{ effect = "waterBreathing", magnitude = 1 },
		},
		mid = {
			{ effect = "swiftSwim", magnitude = 50 },
			{ effect = "waterBreathing", magnitude = 1 },
			{ effect = "sanctuary", magnitude = 8 },
		},
		max = {
			{ effect = "swiftSwim", magnitude = 70 },
			{ effect = "waterBreathing", magnitude = 1 },
			{ effect = "sanctuary", magnitude = 15 },
			{ effect = "resistFrost", magnitude = 25 },
		},
	},
}
