-- STUB: fill in this set's equippable item IDs below; the bonus is already
-- defined in Lua (no ESP needed). An empty list is harmless (set never triggers).
return {
	name = "Embossed",
	items = {  },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 3 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 8 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 12 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
		},
	},
}
