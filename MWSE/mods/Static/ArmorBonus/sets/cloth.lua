return {
        name = "Cloth",
        items = { "cloth bracer left", "cloth bracer right", "right cloth horny fist bracer", "left cloth horny fist bracer", "AB_a_ClothHelm1", "AB_a_ClothHelm2", "AB_a_ClothHelm3", "AK_cloth_helm_uni", "NOD_hat_straw_vd_helm_cloth" },
	bonuses = {
		min = {
			{ effect = "restoreMagicka", magnitude = 1, duration = 1 },
			{ effect = "feather", magnitude = 5 },
		},
		mid = {
			{ effect = "restoreMagicka", magnitude = 2, duration = 1 },
			{ effect = "feather", magnitude = 10 },
			{ effect = "fortifySkill", skill = "alteration", magnitude = 10 },
		},
		max = {
			{ effect = "restoreMagicka", magnitude = 3, duration = 1 },
			{ effect = "feather", magnitude = 20 },
			{ effect = "fortifySkill", skill = "alteration", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 10 },
		},
	},
}
