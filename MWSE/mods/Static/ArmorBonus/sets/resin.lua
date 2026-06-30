-- STUB: fill in this set's equippable item IDs below; the bonus is already
-- defined in Lua (no ESP needed). An empty list is harmless (set never triggers).
return {
	name = "Resin Molded",
	items = {  },
	bonuses = {
		min = {
			{ effect = "resistBlightDisease", magnitude = 15 },
		},
		mid = {
			{ effect = "resistBlightDisease", magnitude = 25 },
			{ effect = "fortifyFatigue", magnitude = 30 },
		},
		max = {
			{ effect = "resistBlightDisease", magnitude = 40 },
			{ effect = "fortifyFatigue", magnitude = 50 },
			{ effect = "resistPoison", magnitude = 25 },
		},
	},
}
