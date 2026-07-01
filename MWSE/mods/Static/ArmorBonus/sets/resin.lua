-- STUB: fill in this set's equippable item IDs below; the bonus is already
-- defined in Lua (no ESP needed). An empty list is harmless (set never triggers).
return {
	name = "Resin Molded",
	items = {  },
	bonuses = {
		min = {
			{ effect = "resistBlightDisease", magnitude = 10 },
		},
		mid = {
			{ effect = "resistBlightDisease", magnitude = 15 },
			{ effect = "fortifyFatigue", magnitude = 20 },
			{ effect = "weaknesstoFrost", magnitude = 10 },
		},
		max = {
			{ effect = "resistBlightDisease", magnitude = 20 },
			{ effect = "fortifyFatigue", magnitude = 28 },
			{ effect = "resistPoison", magnitude = 20 },
			{ effect = "weaknesstoFrost", magnitude = 20 },
		},
	},
}
