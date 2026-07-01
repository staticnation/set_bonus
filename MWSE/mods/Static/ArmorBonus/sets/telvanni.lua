return {
        name = "House Telvanni",
        items = { "bonemold_tshield_telvanniguard", "dust_adept_helm", "mole_crab_helm", "cephalopod_helm" },
	bonuses = {
		min = {
			{ effect = "restoreMagicka", magnitude = 1, duration = 1 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 3 },
		},
		mid = {
			{ effect = "restoreMagicka", magnitude = 1, duration = 1 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 5 },
			{ effect = "fortifySkill", skill = "mysticism", magnitude = 8 },
		},
		max = {
			{ effect = "restoreMagicka", magnitude = 2, duration = 1 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 8 },
			{ effect = "fortifySkill", skill = "mysticism", magnitude = 12 },
			{ effect = "fortifySkill", skill = "destruction", magnitude = 12 },
		},
	},
}
