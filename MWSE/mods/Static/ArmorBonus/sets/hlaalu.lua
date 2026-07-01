return {
        name = "House Hlaalu",
        items = { "bonemold_tshield_hlaaluguard" },
	bonuses = {
		min = {
			{ effect = "fortifySkill", skill = "mercantile", magnitude = 5 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifySkill", skill = "mercantile", magnitude = 8 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 8 },
		},
		max = {
			{ effect = "fortifySkill", skill = "mercantile", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
		},
	},
}
