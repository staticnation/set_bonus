return {
        name = "Artifacts",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 5 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 3 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 8 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
			{ effect = "reflect", magnitude = 5 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
			{ effect = "reflect", magnitude = 8 },
			{ effect = "spellAbsorption", magnitude = 8 },
		},
	},
}
