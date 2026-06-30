return {
        name = "Artifacts",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 10 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 10 },
			{ effect = "reflect", magnitude = 8 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 30 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 15 },
			{ effect = "reflect", magnitude = 12 },
			{ effect = "spellAbsorption", magnitude = 15 },
		},
	},
}
