return {
        name = "Chitin",
        items = { "chitin cuirass", "chitin helm", "chitin_mask_helm", "chitin pauldron - left", "chitin pauldron - right", "chitin guantlet - left", "chitin guantlet - right", "chitin greaves", "chitin boots", "chitin_shield", "chitin_towershield", "chitin_watchman_helm", "cephalopod_helm", "dust_adept_helm", "mole_crab_helm", "the_chiding_cuirass", "chest of fire", "merisan helm", "velothian_helm", "boneweave gauntlet", "left gauntlet of the horny fist", "right gauntlet of horny fist", "shield of the undaunted", "devil mole crab helm", "demon mole crab", "fiend helm", "devil helm", "demon helm", "cephalopod_helm_htnk", "devil cephalopod helm", "demon cephalopod", "veloths_shield", "velothian shield", "bonedancer gauntlet", "ATL_a_buck_chitin_Almsivi", "ATL_a_buck_chitin_Seryns_Brew" },
	bonuses = {
		min = {
			{ effect = "resistBlightDisease", magnitude = 10 },
			{ effect = "resistPoison", magnitude = 10 },
		},
		mid = {
			{ effect = "resistBlightDisease", magnitude = 15 },
			{ effect = "resistPoison", magnitude = 15 },
			{ effect = "resistParalysis", magnitude = 15 },
			{ effect = "weaknesstoFrost", magnitude = 10 },
		},
		max = {
			{ effect = "resistBlightDisease", magnitude = 20 },
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "resistParalysis", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
			{ effect = "weaknesstoFrost", magnitude = 20 },
		},
	},
}
