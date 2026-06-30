return {
        name = "Bosmer",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
		},
		mid = {
			{ effect = "resistPoison", magnitude = 25 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
			{ effect = "fortifySkill", skill = "marksman", magnitude = 15 },
		},
		max = {
			{ effect = "resistPoison", magnitude = 40 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
			{ effect = "fortifySkill", skill = "marksman", magnitude = 25 },
			{ effect = "resistCommonDisease", magnitude = 30 },
		},
	},
}
