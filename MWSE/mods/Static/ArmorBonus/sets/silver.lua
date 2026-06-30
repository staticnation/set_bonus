return {
        name = "Silver",
        items = { "silver_helm", "silver_cuirass", "silver_dukesguard_cuirass", "silver_helm_uvenim" },
	bonuses = {
		min = {
			{ effect = "resistMagicka", magnitude = 10 },
		},
		mid = {
			{ effect = "resistMagicka", magnitude = 20 },
			{ effect = "turnUndead", magnitude = 15 },
		},
		max = {
			{ effect = "resistMagicka", magnitude = 30 },
			{ effect = "turnUndead", magnitude = 30 },
			{ effect = "spellAbsorption", magnitude = 10 },
		},
	},
}
