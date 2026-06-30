-- STUB: fill in this set's equippable item IDs below; the bonus is already
-- defined in Lua (no ESP needed). An empty list is harmless (set never triggers).
return {
	name = "Thieves Guild",
	items = {  },
	bonuses = {
		min = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 10 },
			{ effect = "fortifySkill", skill = "security", magnitude = 10 },
		},
		mid = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 15 },
			{ effect = "fortifySkill", skill = "security", magnitude = 20 },
			{ effect = "chameleon", magnitude = 10 },
		},
		max = {
			{ effect = "fortifySkill", skill = "sneak", magnitude = 25 },
			{ effect = "fortifySkill", skill = "security", magnitude = 30 },
			{ effect = "chameleon", magnitude = 20 },
			{ effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
		},
	},
}
