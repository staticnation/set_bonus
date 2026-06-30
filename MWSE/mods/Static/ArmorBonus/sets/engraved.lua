return {
        name = "Engraved",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 10 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 30 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
			{ effect = "spellAbsorption", magnitude = 10 },
		},
	},
}
