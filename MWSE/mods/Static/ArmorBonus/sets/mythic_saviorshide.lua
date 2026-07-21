-- MYTHIC prototype -- Cuirass of the Savior's Hide.
-- Identity: the Hide turns magic aside almost completely, but it is hide, not
-- plate -- steel goes straight through it. The classic Mythic bargain: immune
-- to one damage type, dangerously exposed to another.
return {
    name = "Savior's Hide",
    thresholds = { min = 1, mid = 1, max = 1 },
    items = { "cuirass_savior_unique", "cuirass_savior_unique_x" },
    bonuses = {
        max = {
            { effect = "resistMagicka", magnitude = 40 },
            { effect = "spellAbsorption", magnitude = 15 },
            { effect = "weaknesstoNormalWeapons", magnitude = 40 },
            -- It saves its wearer: the hide knits when you are nearly gone.
            { effect = "restoreHealth", magnitude = 2,
              condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        },
    },
}
