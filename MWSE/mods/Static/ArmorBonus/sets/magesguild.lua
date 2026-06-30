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
			{ effect = "restoreMagicka", magnitude = 2, duration = 1 },
			{ effect = "fortifySkill", skill = "destruction", magnitude = 10 },
			{ effect = "resistMagicka", magnitude = 15 },
		},
		max = {
			{ effect = "restoreMagicka", magnitude = 3, duration = 1 },
			{ effect = "fortifySkill", skill = "destruction", magnitude = 20 },
			{ effect = "resistMagicka", magnitude = 25 },
			{ effect = "fortifyAttribute", attribute = "intelligence", magnitude = 15 },
		},
	},
}
