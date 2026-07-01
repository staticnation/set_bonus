-- STUB: fill in this set's equippable item IDs below; the bonus is already
-- defined in Lua (no ESP needed). An empty list is harmless (set never triggers).
return {
	name = "Mages Guild",
	items = {  },
	bonuses = {
		min = {
			{ effect = "restoreMagicka", magnitude = 1, duration = 1 },
			{ effect = "fortifySkill", skill = "destruction", magnitude = 5 },
		},
		mid = {
			{ effect = "restoreMagicka", magnitude = 1, duration = 1 },
			{ effect = "fortifySkill", skill = "destruction", magnitude = 8 },
			{ effect = "resistMagicka", magnitude = 8 },
		},
		max = {
			{ effect = "restoreMagicka", magnitude = 2, duration = 1 },
			{ effect = "fortifySkill", skill = "destruction", magnitude = 12 },
			{ effect = "resistMagicka", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 8 },
		},
	},
}
