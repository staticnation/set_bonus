return {
        name = "House Dres",
        items = { "NOD_ARdres" },
	bonuses = {
		min = {
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "resistFire", magnitude = 15 },
		},
		mid = {
			{ effect = "resistPoison", magnitude = 25 },
			{ effect = "resistFire", magnitude = 25 },
			{ effect = "fortifySkill", skill = "longBlade", magnitude = 10 },
		},
		max = {
			{ effect = "resistPoison", magnitude = 40 },
			{ effect = "resistFire", magnitude = 40 },
			{ effect = "fortifySkill", skill = "longBlade", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
		},
	},
}
