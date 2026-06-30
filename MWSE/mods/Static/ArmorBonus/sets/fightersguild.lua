-- STUB: fill in this set's equippable item IDs below; the bonus is already
-- defined in Lua (no ESP needed). An empty list is harmless (set never triggers).
return {
	name = "Fighters Guild",
	items = {  },
	bonuses = {
		min = {
			{ effect = "fortifyAttackBonus", magnitude = 5 },
			{ effect = "fortifyHealth", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifyAttackBonus", magnitude = 10 },
			{ effect = "fortifyHealth", magnitude = 20 },
			{ effect = "fortifyFatigue", magnitude = 40 },
		},
		max = {
			{ effect = "fortifyAttackBonus", magnitude = 15 },
			{ effect = "fortifyHealth", magnitude = 35 },
			{ effect = "fortifyFatigue", magnitude = 60 },
			{ effect = "fortifyAttribute", attribute = "strength", magnitude = 10 },
		},
	},
}
