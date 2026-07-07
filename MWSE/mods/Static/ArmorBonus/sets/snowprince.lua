-- Snow Prince -- the PRE-FALL Snow Elves (Falmer before the Betrayal).
-- The Snow Prince fell at the Battle of the Moesring in the Merethic Era, long
-- before the Dwemer enslaved and blinded his people into the sun-shunning
-- Betrayed. His Ice Armour is proud, sighted, sun-walking gear -- so unlike the
-- "Falmer" (post-fall) set, it carries NO daylight weakness and instead favours
-- the open sky. (The Ice Armour also still counts toward Nordic / Stalhrim / its
-- weight-class sets -- overlap is intentional; the bonuses stack.)
return {
    name = "Snow Prince",
    items = {
        "BM_Ice_Boots", "BM_Ice_cuirass", "BM_Ice_gauntletL", "BM_Ice_gauntletR",
        "BM_Ice_greaves", "BM_Ice_Helmet", "BM_Ice_PauldronL", "BM_Ice_PauldronR",
        "BM_Ice_Shield",
    },
    bonuses = {
        min = {
            { effect = "resistFrost", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
        },
        mid = {
            { effect = "resistFrost", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "resistMagicka", magnitude = 8 },
        },
        max = {
            { effect = "resistFrost", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "sanctuary", magnitude = 10 },
        },
    },
}
