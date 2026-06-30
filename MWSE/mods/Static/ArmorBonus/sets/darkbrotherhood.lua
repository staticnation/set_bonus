return {
        name = "Dark Brotherhood",
        items = { "darkbrotherhood helm", "darkbrotherhood cuirass", "darkbrotherhood pauldron_l", "darkbrotherhood pauldron_r", "darkbrotherhood greaves", "darkbrotherhood boots", "darkbrotherhood gauntlet_l", "darkbrotherhood gauntlet_r" },
	bonuses = {
		min = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 10 },
			{ effect = "resistPoison", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 20 },
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "chameleon", magnitude = 10 },
		},
		max = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 30 },
			{ effect = "resistPoison", magnitude = 35 },
			{ effect = "chameleon", magnitude = 20 },
			{ effect = "fortifyAttackBonus", magnitude = 15 },
		},
	},
}
