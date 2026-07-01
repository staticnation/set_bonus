return {
        name = "Dreugh",
        items = { "dreugh_cuirass", "dreugh_helm", "dreugh_shield", "helm of holy fire", "dreugh_cuirass_ttrm" },
	bonuses = {
		min = {
			{ effect = "resistShock", magnitude = 10 },
			{ effect = "waterBreathing", magnitude = 1 },
		},
		mid = {
			{ effect = "resistShock", magnitude = 15 },
			{ effect = "waterBreathing", magnitude = 1 },
			{ effect = "swiftSwim", magnitude = 30 },
			{ effect = "weaknesstoFrost", magnitude = 10 },
		},
		max = {
			{ effect = "resistShock", magnitude = 20 },
			{ effect = "waterBreathing", magnitude = 1 },
			{ effect = "swiftSwim", magnitude = 40 },
			{ effect = "weaknesstoFrost", magnitude = 20 },
		},
	},
}
