return {
        name = "Khajiit",
        items = { "" },
	bonuses = {
		min = {
			{ effect = "nightEye", magnitude = 25 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
		},
		mid = {
			{ effect = "nightEye", magnitude = 40 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
			{ effect = "fortifySkill", skill = "acrobatics", magnitude = 8 },
		},
		max = {
			{ effect = "nightEye", magnitude = 50 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
			{ effect = "fortifySkill", skill = "acrobatics", magnitude = 12 },
			{ effect = "fortifySkill", skill = "handToHand", magnitude = 12 },
		},
	},
}
