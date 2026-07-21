-- MYTHIC prototype -- Fists of Randagulf.
-- Showcase for the 1.7.1 `stance` condition: the Fists only honour a wearer who
-- fights with their hands. Draw steel and the gauntlets work against you.
-- Two pieces, so one fist is a partial blessing and the pair is the full one.
return {
    name = "Fists of Randagulf",
    thresholds = { min = 1, mid = 2, max = 2 },
    items = { "gauntlet_fists_l_unique", "gauntlet_fists_r_unique" },
    bonuses = {
        min = {
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 10 },
        },
        max = {
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 25 },
            -- Unarmed only: weapon sheathed.
            { effect = "fortifySkill", skill = "handToHand", magnitude = 40,
              condition = { kind = "stance", value = "none" } },
            { effect = "fortifyAttack", magnitude = 15, condition = { kind = "stance", value = "none" } },
            -- The gauntlets resent a blade.
            { effect = "weaknesstoNormalWeapons", magnitude = 25,
              condition = { kind = "stance", value = "weapon" } },
        },
    },
}
