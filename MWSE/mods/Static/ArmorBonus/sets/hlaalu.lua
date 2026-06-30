return {
        name = "House Hlaalu",
        items = { "NOD_dnk_hlaalu_cuirass", "NOD_ARhlaalu", "bonemold_tshield_hlaaluguard", "AB_a_ChitinHlaHelm01", "NOD_RV_Chitin Helm F_hh" },
	bonuses = {
		min = {
			{ effect = "fortifySkill", skill = "mercantile", magnitude = 10 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifySkill", skill = "mercantile", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 15 },
		},
		max = {
			{ effect = "fortifySkill", skill = "mercantile", magnitude = 30 },
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 25 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 10 },
		},
	},
}
