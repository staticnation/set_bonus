-- STUB: fill in this set's equippable item IDs below; the bonus is already
-- defined in Lua (no ESP needed). An empty list is harmless (set never triggers).
return {
	name = "Embossed",
	items = {  },
	bonuses = {
		min = {
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 10 },
		},
		max = {
			{ effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
			{ effect = "fortifySkill", skill = "speechcraft", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
		},
	},
}
