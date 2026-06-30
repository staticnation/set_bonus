return {
        name = "Khajiit",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "nightEye", magnitude = 25 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
		},
		mid = {
			{ effect = "nightEye", magnitude = 50 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
			{ effect = "fortifySkill", skill = "acrobatics", magnitude = 10 },
		},
		max = {
			{ effect = "nightEye", magnitude = 75 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
			{ effect = "fortifySkill", skill = "acrobatics", magnitude = 20 },
			{ effect = "fortifySkill", skill = "handToHand", magnitude = 20 },
		},
	},
}
