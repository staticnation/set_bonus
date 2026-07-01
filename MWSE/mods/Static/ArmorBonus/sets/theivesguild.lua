-- STUB: fill in this set's equippable item IDs below; the bonus is already
-- defined in Lua (no ESP needed). An empty list is harmless (set never triggers).
return {
	name = "Thieves Guild",
	items = {  },
	bonuses = {
		min = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 5 },
			{ effect = "fortifySkill", skill = "security", magnitude = 5 },
		},
		mid = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 8 },
			{ effect = "fortifySkill", skill = "security", magnitude = 8 },
			{ effect = "chameleon", magnitude = 7 },
		},
		max = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 12 },
			{ effect = "fortifySkill", skill = "security", magnitude = 12 },
			{ effect = "chameleon", magnitude = 10 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
		},
	},
}
