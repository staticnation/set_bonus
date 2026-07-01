return {
        name = "Engraved",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 5 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 8 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
			{ effect = "spellAbsorption", magnitude = 8 },
		},
	},
}
