-- STUB: fill in this set's equippable item IDs below; the bonus is already
-- defined in Lua (no ESP needed). An empty list is harmless (set never triggers).
return {
	name = "Fighters Guild",
	items = {  },
	bonuses = {
		min = {
			{ effect = "fortifyAttack", magnitude = 3 },
			{ effect = "fortifyHealth", magnitude = 8 },
		},
		mid = {
			{ effect = "fortifyAttack", magnitude = 5 },
			{ effect = "fortifyHealth", magnitude = 12 },
			{ effect = "fortifyFatigue", magnitude = 20 },
		},
		max = {
			{ effect = "fortifyAttack", magnitude = 8 },
			{ effect = "fortifyHealth", magnitude = 18 },
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
		},
	},
}
