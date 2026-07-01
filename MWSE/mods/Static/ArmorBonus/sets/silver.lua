return {
        name = "Silver",
        items = { "silver_helm", "silver_cuirass", "silver_dukesguard_cuirass", "silver_helm_uvenim" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 5 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 8 },
			{ effect = "turnUndead", magnitude = 15 },
			{ effect = "weaknesstoShock", magnitude = 10 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "turnUndead", magnitude = 20 },
			{ effect = "spellAbsorption", magnitude = 8 },
			{ effect = "weaknesstoShock", magnitude = 20 },
		},
	},
}
