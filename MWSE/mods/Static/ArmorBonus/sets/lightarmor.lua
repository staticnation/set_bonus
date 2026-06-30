return {
        name = "Light Armor",
        items = { "imperial_studded_cuirass", "darkbrotherhood helm", "darkbrotherhood cuirass", "darkbrotherhood pauldron_l", "darkbrotherhood pauldron_r", "darkbrotherhood greaves", "darkbrotherhood boots", "darkbrotherhood gauntlet_l", "darkbrotherhood gauntlet_r" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 25 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 40 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
			{ effect = "sanctuary", magnitude = 8 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 60 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
			{ effect = "sanctuary", magnitude = 12 },
			{ effect = "fortifySkill", skill = "acrobatics", magnitude = 15 },
		},
	},
}
