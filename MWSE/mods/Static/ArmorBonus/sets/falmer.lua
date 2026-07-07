-- Falmer -- the POST-FALL Betrayed: blind, sun-shunning cave-dwellers. Their
-- daylight vulnerability lives in the Conditional Rebalance. This is the mirror
-- of the pre-fall "Snow Prince" set (the Ice Armour). Items are left open for
-- Betrayed/Snow-Elf armour from add-ons; do NOT file noble Snow Elf gear here.
return {
        name = "Falmer",
        items = {},
	bonuses = {
		min = {
			{ effect = "resistFrost", magnitude = 10 },
			{ effect = "chameleon", magnitude = 5 },
		},
		mid = {
			{ effect = "resistFrost", magnitude = 15 },
			{ effect = "chameleon", magnitude = 7 },
			{ effect = "nightEye", magnitude = 40 },
		},
		max = {
			{ effect = "resistFrost", magnitude = 20 },
			{ effect = "chameleon", magnitude = 10 },
			{ effect = "nightEye", magnitude = 50 },
		},
	},
}
