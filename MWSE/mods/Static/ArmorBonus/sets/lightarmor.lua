return {
        name = "Light Armor",
        items = { "imperial_studded_cuirass", "darkbrotherhood helm", "darkbrotherhood cuirass", "darkbrotherhood pauldron_l", "darkbrotherhood pauldron_r", "darkbrotherhood greaves", "darkbrotherhood boots", "darkbrotherhood gauntlet_l", "darkbrotherhood gauntlet_r" },
	bonuses = {
		min = {
			{ effect = "fortifyFatigue", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
			{ effect = "sanctuary", magnitude = 7 },
		},
		max = {
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
			{ effect = "sanctuary", magnitude = 10 },
			{ effect = "fortifySkill", skill = "acrobatics", magnitude = 12 },
		},
	},
}
