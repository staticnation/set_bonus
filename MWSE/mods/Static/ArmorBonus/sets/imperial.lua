return {
        name = "Imperial",
        items = { "silver_helm", "silver_cuirass", "silver_dukesguard_cuirass", "templar_helmet_armor", "templar_cuirass", "templar_pauldron_left", "templar_pauldron_right", "templar bracer left", "templar bracer right", "templar_greaves", "templar boots", "imperial helmet armor", "imperial cuirass_armor", "imperial left pauldron", "imperial right pauldron", "imperial left gauntlet", "imperial right gauntlet", "imperial_greaves", "imperial boots", "imperial shield", "imperial_chain_coif_helm", "imperial_chain_cuirass", "imperial_chain_pauldron_left", "imperial_chain_pauldron_right", "imperial_chain_greaves", "dragonscale_helm", "dragonscale_cuirass", "dragonscale_towershield", "imperial_studded_cuirass", "newtscale_cuirass", "imperial_helm_frald_uniq", "imperial helmet armor_dae_curse", "feather_shield", "shield_of_light", "velothis_shield" },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 3 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 8 },
			{ effect = "fortifySkill", skill = "mercantile", magnitude = 8 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 12 },
			{ effect = "fortifySkill", skill = "mercantile", magnitude = 12 },
			{ effect = "fortifyAttack", magnitude = 8 },
		},
	},
}
