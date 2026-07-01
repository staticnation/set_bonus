return {
        name = "Morag Tong",
        items = { "morag_tong_helm" },
	bonuses = {
		min = {
			{ effect = "resistPoison", magnitude = 10 },
			{ effect = "fortifySkill", skill = "shortBlade", magnitude = 5 },
		},
		mid = {
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "fortifySkill", skill = "shortBlade", magnitude = 8 },
			{ effect = "fortifySkill", skill = "sneak", magnitude = 8 },
		},
		max = {
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "fortifySkill", skill = "shortBlade", magnitude = 12 },
			{ effect = "fortifySkill", skill = "sneak", magnitude = 12 },
			{ effect = "chameleon", magnitude = 10 },
		},
	},
}
