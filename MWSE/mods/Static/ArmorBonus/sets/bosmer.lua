return {
        name = "Bosmer",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "resistPoison", magnitude = 10 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
		},
		mid = {
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
			{ effect = "fortifySkill", skill = "marksman", magnitude = 8 },
		},
		max = {
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
			{ effect = "fortifySkill", skill = "marksman", magnitude = 12 },
			{ effect = "resistCommonDisease", magnitude = 20 },
		},
	},
}
