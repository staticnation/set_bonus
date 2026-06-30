return {
        name = "Morag Tong",
        items = { "AB_a_MoragTongHelm01", "AB_a_MoragTongHelm02", "AB_a_MoragTongHelm03", "AB_a_MoragTongHelm04", "morag_tong_helm" },
	bonuses = {
		min = {
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "fortifySkill", skill = "shortBlade", magnitude = 10 },
		},
		mid = {
			{ effect = "resistPoison", magnitude = 25 },
			{ effect = "fortifySkill", skill = "shortBlade", magnitude = 20 },
			{ effect = "fortifySkill", skill = "sneak", magnitude = 15 },
		},
		max = {
			{ effect = "resistPoison", magnitude = 40 },
			{ effect = "fortifySkill", skill = "shortBlade", magnitude = 30 },
			{ effect = "fortifySkill", skill = "sneak", magnitude = 25 },
			{ effect = "chameleon", magnitude = 15 },
		},
	},
}
