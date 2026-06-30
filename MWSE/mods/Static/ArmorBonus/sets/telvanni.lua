return {
        name = "House Telvanni",
        items = { "AB_a_CephHelmOpen", "bonemold_tshield_telvanniguard", "dust_adept_helm", "mole_crab_helm", "cephalopod_helm", "NOD_hat_telv_RM_HeadWear_10", "NOD_hat_telv_RM_HeadWear_11", "NOD_hat_telv_RM_HeadWear_12", "NOD_hat_shroomcap_telvanni", "NOD_ARtelvanni", "AB_a_DustBoots", "AB_a_DustBracerLeft", "AB_a_DustBracerRight", "AB_a_DustChest", "AB_a_DustGreaves", "AB_a_DustHelm", "AB_a_DustPldrLeft", "AB_a_DustPldrRight" },
	bonuses = {
		min = {
			{ effect = "restoreMagicka", magnitude = 1, duration = 1 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 5 },
		},
		mid = {
			{ effect = "restoreMagicka", magnitude = 2, duration = 1 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 10 },
			{ effect = "fortifySkill", skill = "mysticism", magnitude = 15 },
		},
		max = {
			{ effect = "restoreMagicka", magnitude = 3, duration = 1 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 15 },
			{ effect = "fortifySkill", skill = "mysticism", magnitude = 25 },
			{ effect = "fortifySkill", skill = "destruction", magnitude = 20 },
		},
	},
}
