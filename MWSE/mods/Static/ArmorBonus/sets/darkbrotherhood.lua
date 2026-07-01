return {
        name = "Dark Brotherhood",
        items = { "darkbrotherhood helm", "darkbrotherhood cuirass", "darkbrotherhood pauldron_l", "darkbrotherhood pauldron_r", "darkbrotherhood greaves", "darkbrotherhood boots", "darkbrotherhood gauntlet_l", "darkbrotherhood gauntlet_r" },
	bonuses = {
		min = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 5 },
			{ effect = "resistPoison", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 8 },
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "chameleon", magnitude = 7 },
		},
		max = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 12 },
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "chameleon", magnitude = 10 },
			{ effect = "fortifyAttackBonus", magnitude = 8 },
		},
	},
}
