return {
        name = "House Dres",
        items = {  },
	bonuses = {
		min = {
			{ effect = "resistPoison", magnitude = 10 },
			{ effect = "resistFire", magnitude = 10 },
		},
		mid = {
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "resistFire", magnitude = 15 },
			{ effect = "fortifySkill", skill = "longBlade", magnitude = 8 },
		},
		max = {
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "resistFire", magnitude = 20 },
			{ effect = "fortifySkill", skill = "longBlade", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
		},
	},
}
