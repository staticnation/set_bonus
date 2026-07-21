-- MYTHIC prototype -- Boots of Blinding Speed.
-- Mythic sets are 1-2 piece artifacts with a game-changing effect and a real
-- cost, in the spirit of ESO's Mythics. One boot = full power immediately
-- (thresholds all 1), so the tradeoff lands the moment you put them on.
-- Identity: absurd speed; the "blinding" is a genuine defensive hole that gets
-- worse when there's no light to compensate for.
return {
    name = "Boots of Blinding Speed",
    thresholds = { min = 1, mid = 1, max = 1 },
    items = { "boots of blinding speed[unique]", "boots of blinding speed_x" },
    bonuses = {
        max = {
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 30 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 20 },
            { effect = "weaknesstoNormalWeapons", magnitude = 30 },
            -- Blind and in the dark: nothing to steer by.
            { effect = "weaknesstoNormalWeapons", magnitude = 20, condition = { kind = "sun", value = "down" } },
        },
    },
}
