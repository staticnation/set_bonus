-- =========================================================================
--  Set Bonus -- Conditional Rebalance data (MWSE; canonical source).
--
--  One entry per set: { name = <registered set name>, bonuses = {min/mid/max} }.
--  Items and thresholds are NOT listed here -- the loader keeps whatever the
--  base mod / add-ons registered and swaps only the bonus definitions.
--
--  The OpenMW variant (OpenMW_SetBonusRebalance/scripts/SetBonusRebalance/
--  data.lua) and SetBonus_Rebalance_Reference.md are GENERATED from this file
--  by gen_rebalance.py -- edit here, then regenerate.
--
--  Design language ("situational spikes"):
--    * Always-on effects keep the restrained base-mod bands and carry each
--      set's identity.
--    * Conditional effects hit ~1.5-2x harder but only while their state
--      holds. Every condition used here evaluates natively on BOTH engines
--      (no combat/weather/flag conditions, which OpenMW 0.51 cannot read).
--    * Set kinds get distinct moods: heavy materials react to being hurt,
--      light materials to darkness and open sky, cultural sets favour their
--      own race and homeland hours, faction sets mirror their trade, class
--      sets (Light/Medium/Heavy/Cloth) stay reactive so they complement --
--      rather than double up on -- the material sets that share their items.
--    * Weakness drawbacks stay, and a few are themselves conditional.
-- =========================================================================

-- Shared condition blocks (data-only; identical semantics on MWSE & OpenMW).
local BLOODIED   = { kind = "health",  op = "<", value = 0.50, fraction = true }  -- hurt
local LAST_STAND = { kind = "health",  op = "<", value = 0.25, fraction = true }  -- nearly dead
local FRESH      = { kind = "health",  op = ">", value = 0.75, fraction = true }  -- barely scratched
local WINDED     = { kind = "fatigue", op = "<", value = 0.50, fraction = true }  -- tired
local RESTED     = { kind = "fatigue", op = ">", value = 0.75, fraction = true }  -- fresh legs
local CHARGED    = { kind = "magicka", op = ">", value = 0.50, fraction = true }  -- reserves high
local DRAINED    = { kind = "magicka", op = "<", value = 0.25, fraction = true }  -- reserves spent
local NIGHT      = { kind = "time", value = "night" }
local DAY        = { kind = "time", value = "day" }
local SUN_UP     = { kind = "sun",  value = "up" }    -- daytime AND outdoors
local SUN_DOWN   = { kind = "sun",  value = "down" }  -- night, or under a roof
local OUTSIDE    = { kind = "location", value = "exterior" }
local INSIDE     = { kind = "location", value = "interior" }
local HEIST      = { NIGHT, INSIDE }                          -- AND-array
local UNDER_STARS= { NIGHT, OUTSIDE }                         -- AND-array
local SHADE      = { any = { INSIDE, NIGHT } }                -- OR
local DESPERATE  = { any = { LAST_STAND, WINDED } }           -- OR
local VETERAN    = { kind = "level", op = ">=", value = 20 }
local MASTER_AT_ARMS = { kind = "level", op = ">=", value = 25 }
local GREEN      = { kind = "level", op = "<",  value = 10 }
local function race(id) return { kind = "race", value = id } end
local function skillAtLeast(id, v) return { kind = "skill", id = id, op = ">=", value = v } end
local function attrAtLeast(id, v) return { kind = "attribute", id = id, op = ">=", value = v } end

-- Stacking lanes: items often belong to several sets at once (a Chuzei helm is
-- also Bonemold, Dunmer, and Native), so overlapping sets are given distinct
-- ROLES rather than copies of the same stats. Broad "umbrella" sets (Dunmer,
-- Native, Nordic, Colovian, Imperial, Orsimer, class sets) carry only echo-
-- strength flats (~10 resist) plus cultural conditionals, while the specific
-- sets keep the full-strength identity. gen_rebalance.py enforces this: two
-- sets that can reach max tier from shared items may not both carry the same
-- full-strength flat effect or the same conditional effect+state.

return {

-- =========================================================================
-- Base mod -- materials, heavy
-- =========================================================================

{ name = "Iron", -- first metal: stubborn, hits back when hurt
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifyAttack", magnitude = 8, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifyAttack", magnitude = 12, condition = BLOODIED },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Steel", -- soldier's standard: tempered edge holds when dented
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifyAttack", magnitude = 5 },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "resistNormalWeapons", magnitude = 12, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Ebony", -- elite heavy: unyielding under punishment
  bonuses = {
    min = { { effect = "resistFire", magnitude = 10 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "resistFire", magnitude = 15 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 8, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistFire", magnitude = 20 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 12, condition = BLOODIED },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Daedric", -- dread plate: most terrible at the brink of death
  bonuses = {
    min = { { effect = "spellAbsorption", magnitude = 3 } },
    mid = { { effect = "spellAbsorption", magnitude = 5 },
            { effect = "resistMagicka", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = LAST_STAND },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "spellAbsorption", magnitude = 8 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "fortifyAttack", magnitude = 16, condition = LAST_STAND },
            { effect = "sanctuary", magnitude = 12, condition = LAST_STAND },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Dwemer", -- animunculi plate: strongest in the deep halls it was made for
  bonuses = {
    min = { { effect = "resistShock", magnitude = 10 } },
    mid = { { effect = "resistShock", magnitude = 15 },
            { effect = "reflect", magnitude = 8, condition = INSIDE } },
    max = { { effect = "resistShock", magnitude = 20 },
            { effect = "reflect", magnitude = 12, condition = INSIDE },
            { effect = "sanctuary", magnitude = 12, condition = INSIDE },
            { effect = "resistMagicka", magnitude = 8 } },
  } },

{ name = "Adamantium", -- rare anti-magic alloy: sheds spells when blood flows
  bonuses = {
    min = { { effect = "resistMagicka", magnitude = 5 } },
    mid = { { effect = "resistMagicka", magnitude = 8 },
            { effect = "reflect", magnitude = 8, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistMagicka", magnitude = 12 },
            { effect = "reflect", magnitude = 12, condition = BLOODIED },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Orcish", -- brute plate: too angry to die; the forge honours the strong
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
            { effect = "restoreHealth", magnitude = 2, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
            { effect = "restoreHealth", magnitude = 3, condition = BLOODIED },
            { effect = "fortifyAttack", magnitude = 12, condition = attrAtLeast("strength", 60) },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Bronze", -- antique soldiery: gleams and rallies under the open sun
  bonuses = {
    min = { { effect = "resistShock", magnitude = 10 },
            { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "resistShock", magnitude = 15 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = SUN_UP } },
    max = { { effect = "resistShock", magnitude = 20 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = SUN_UP },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 } },
  } },

{ name = "Plate", -- full harness: encased and immovable
  bonuses = {
    min = { { effect = "resistNormalWeapons", magnitude = 3 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 12, condition = BLOODIED },
            { effect = "resistParalysis", magnitude = 20 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Splint", -- articulated bands: braced to block through pain
  bonuses = {
    min = { { effect = "resistNormalWeapons", magnitude = 3 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifySkill", skill = "block", magnitude = 12, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifySkill", skill = "block", magnitude = 18, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Silver", -- blessed metal: keenest in the haunted hours
  bonuses = {
    min = { { effect = "resistMagicka", magnitude = 5 } },
    mid = { { effect = "resistMagicka", magnitude = 8 },
            { effect = "turnUndead", magnitude = 15 },
            { effect = "spellAbsorption", magnitude = 8, condition = NIGHT },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistMagicka", magnitude = 12 },
            { effect = "turnUndead", magnitude = 20 },
            { effect = "spellAbsorption", magnitude = 12, condition = NIGHT },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Stalhrim", -- enchanted ice: wakes when the sun is gone
  bonuses = {
    min = { { effect = "resistFrost", magnitude = 10 } },
    mid = { { effect = "resistFrost", magnitude = 15 },
            { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 8, condition = SUN_DOWN },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistFrost", magnitude = 20 },
            { effect = "restoreMagicka", magnitude = 2 },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 12, condition = SUN_DOWN },
            { effect = "resistMagicka", magnitude = 12, condition = SUN_DOWN },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Dragonbone", -- relic of dragonfire: fury when wounded
  bonuses = {
    min = { { effect = "resistFire", magnitude = 10 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "resistFire", magnitude = 15 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistFire", magnitude = 20 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = BLOODIED },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

-- =========================================================================
-- Base mod -- materials, medium
-- =========================================================================

{ name = "Chain Mail", -- workhorse mail: rings hold when the wearer falters
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "resistNormalWeapons", magnitude = 8, condition = WINDED },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistNormalWeapons", magnitude = 12, condition = WINDED },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Bonemold", -- Dunmer resin-bone: the tank lane of the Dunmer cluster
  -- (blight resist is Native's lane; Bonemold keeps only an echo of it)
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistBlightDisease", magnitude = 10 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistBlightDisease", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8, condition = BLOODIED },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistBlightDisease", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 12, condition = BLOODIED },
            { effect = "resistNormalWeapons", magnitude = 12, condition = BLOODIED },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Gah-Julan", -- prestige bonemold: the duellist lane (health/blight
  -- belong to Bonemold, which its items also count toward)
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifyAttack", magnitude = 8, condition = FRESH } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyAttack", magnitude = 12, condition = FRESH },
            { effect = "sanctuary", magnitude = 8 } },
  } },

{ name = "Armun-An", -- ashland bonemold: baked hard under open sky
  bonuses = {
    min = { { effect = "resistFire", magnitude = 10 } },
    mid = { { effect = "resistFire", magnitude = 15 },
            { effect = "fortifyHealth", magnitude = 15, condition = OUTSIDE },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistFire", magnitude = 20 },
            { effect = "fortifyHealth", magnitude = 22, condition = OUTSIDE },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Dreugh", -- sea-monster carapace: storm shell hardens when cracked
  bonuses = {
    min = { { effect = "resistShock", magnitude = 10 },
            { effect = "waterBreathing", magnitude = 1 } },
    mid = { { effect = "resistShock", magnitude = 15 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 30 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistShock", magnitude = 20 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 40 },
            { effect = "reflect", magnitude = 12, condition = BLOODIED },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Ring Mail", -- light rings: quick while they're still intact
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "resistNormalWeapons", magnitude = 8, condition = FRESH },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "resistNormalWeapons", magnitude = 12, condition = FRESH },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Scale Mail", -- cheap scales: they buy you time when it matters
  bonuses = {
    min = { { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyHealth", magnitude = 15, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Goblin", -- scavenged war-gear: fights hardest when exhausted
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "strength", magnitude = 3 },
            { effect = "resistCommonDisease", magnitude = 10 } },
    mid = { { effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
            { effect = "resistCommonDisease", magnitude = 15 },
            { effect = "fortifyAttack", magnitude = 8, condition = WINDED } },
    max = { { effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
            { effect = "resistCommonDisease", magnitude = 20 },
            { effect = "fortifyAttack", magnitude = 12, condition = WINDED },
            { effect = "fortifyFatigue", magnitude = 28 } },
  } },

{ name = "Trollbone", -- troll remains: the flesh remembers how to knit
  bonuses = {
    min = { { effect = "restoreHealth", magnitude = 1 } },
    mid = { { effect = "restoreHealth", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
            { effect = "restoreHealth", magnitude = 2, condition = BLOODIED },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "restoreHealth", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "restoreHealth", magnitude = 3, condition = BLOODIED },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "weaknesstoFire", magnitude = 10 },
            { effect = "weaknesstoFire", magnitude = 15, condition = BLOODIED } },
  } },

-- =========================================================================
-- Base mod -- materials, light
-- =========================================================================

{ name = "Leather", -- footpad's second skin: at home in the dark
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 },
            { effect = "fortifySkill", skill = "acrobatics", magnitude = 5 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifySkill", skill = "acrobatics", magnitude = 8 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 12, condition = NIGHT },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifySkill", skill = "acrobatics", magnitude = 12 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 18, condition = NIGHT },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Netch Leather", -- netch-hide: jelly wards poison, floats a falling
  -- wearer (fatigue is Leather's lane where the items overlap)
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "slowFall", magnitude = 10 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "slowFall", magnitude = 15 },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "slowFall", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 8, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Hide", -- trail hide: made for the long trek
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 12, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 18, condition = OUTSIDE },
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 12, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Fur", -- winter pelts: warm blood under an open sky
  bonuses = {
    min = { { effect = "resistFrost", magnitude = 10 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "resistFrost", magnitude = 15 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "restoreFatigue", magnitude = 2, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistFrost", magnitude = 20 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "restoreFatigue", magnitude = 3, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Bear Fur", -- hunter's trophy: the wild lends its endurance
  bonuses = {
    min = { { effect = "resistFrost", magnitude = 10 } },
    mid = { { effect = "resistFrost", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistFrost", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 12, condition = OUTSIDE },
            { effect = "fortifyHealth", magnitude = 22, condition = BLOODIED },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Bearskin", -- berserker's mantle: the bear wakes when blood is drawn
  bonuses = {
    min = { { effect = "resistFrost", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 3 } },
    mid = { { effect = "resistFrost", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 12, condition = BLOODIED },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistFrost", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 16, condition = BLOODIED },
            { effect = "fortifyHealth", magnitude = 22, condition = BLOODIED },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Wolf Fur", -- pack pelts: a night hunter's senses
  bonuses = {
    min = { { effect = "resistFrost", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 3 } },
    mid = { { effect = "resistFrost", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
            { effect = "nightEye", magnitude = 40, condition = NIGHT },
            { effect = "fortifyAttack", magnitude = 8, condition = UNDER_STARS },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistFrost", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 8 },
            { effect = "nightEye", magnitude = 50, condition = NIGHT },
            { effect = "fortifyAttack", magnitude = 12, condition = UNDER_STARS },
            { effect = "fortifySkill", skill = "athletics", magnitude = 12 },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Chitin", -- Dunmer shell: an ambush predator's casing
  bonuses = {
    min = { { effect = "resistBlightDisease", magnitude = 10 },
            { effect = "resistPoison", magnitude = 10 } },
    mid = { { effect = "resistBlightDisease", magnitude = 15 },
            { effect = "resistPoison", magnitude = 15 },
            { effect = "resistParalysis", magnitude = 15 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistBlightDisease", magnitude = 20 },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "resistParalysis", magnitude = 20 },
            { effect = "chameleon", magnitude = 12, condition = NIGHT },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Glass", -- volcanic glass: flawless while unscratched
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
            { effect = "resistFire", magnitude = 10 } },
    mid = { { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "resistFire", magnitude = 15 },
            { effect = "sanctuary", magnitude = 12, condition = FRESH },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "resistFire", magnitude = 20 },
            { effect = "sanctuary", magnitude = 16, condition = FRESH },
            { effect = "chameleon", magnitude = 10 },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Padded", -- quilted layers: comfort by the hearth
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "resistFrost", magnitude = 15 },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistFrost", magnitude = 20 },
            { effect = "restoreFatigue", magnitude = 2, condition = INSIDE },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Studded", -- riveted leather: a night watchman's compromise
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 8, condition = NIGHT },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 12, condition = NIGHT },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Cephalopod", -- squid-shell: ink and escape
  bonuses = {
    min = { { effect = "swiftSwim", magnitude = 20 },
            { effect = "waterBreathing", magnitude = 1 } },
    mid = { { effect = "swiftSwim", magnitude = 30 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "sanctuary", magnitude = 7 } },
    max = { { effect = "swiftSwim", magnitude = 40 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "sanctuary", magnitude = 10 },
            { effect = "chameleon", magnitude = 16, condition = BLOODIED },
            { effect = "resistFrost", magnitude = 20 } },
  } },

{ name = "Newtscale", -- amphibian scale: slick when the pressure is on
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "swiftSwim", magnitude = 20 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "swiftSwim", magnitude = 30 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "swiftSwim", magnitude = 40 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "sanctuary", magnitude = 12, condition = DESPERATE },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Resin Molded", -- sun-cured resin: hardens in the heat of day
  bonuses = {
    min = { { effect = "resistBlightDisease", magnitude = 10 } },
    mid = { { effect = "resistBlightDisease", magnitude = 15 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "resistFire", magnitude = 15, condition = SUN_UP },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistBlightDisease", magnitude = 20 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistFire", magnitude = 22, condition = SUN_UP },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Scrap", -- junk plates: held together by luck and desperation
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "luck", magnitude = 3 } },
    mid = { { effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 8, condition = DESPERATE } },
    max = { { effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 12, condition = DESPERATE },
            { effect = "resistNormalWeapons", magnitude = 8, condition = DESPERATE } },
  } },

-- =========================================================================
-- Base mod -- class sets (reactive, so they complement the material sets
-- that share their items instead of doubling the same stats)
-- =========================================================================

{ name = "Heavy Armor", -- discipline of iron: answers pain with resolve
  bonuses = {
    min = { { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyHealth", magnitude = 15, condition = BLOODIED } },
    max = { { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 22, condition = BLOODIED },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 12, condition = BLOODIED } },
  } },

{ name = "Medium Armor", -- soldier's pace: a second wind when it counts
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "restoreFatigue", magnitude = 2, condition = WINDED } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "restoreFatigue", magnitude = 3, condition = WINDED },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 } },
  } },

{ name = "Light Armor", -- dancer's discipline: untouchable on fresh legs
  -- (purely reactive -- fatigue belongs to the leather/hide material sets)
  bonuses = {
    min = { { effect = "fortifySkill", skill = "lightArmor", magnitude = 5 } },
    mid = { { effect = "fortifySkill", skill = "lightArmor", magnitude = 8 },
            { effect = "sanctuary", magnitude = 8, condition = RESTED } },
    max = { { effect = "fortifySkill", skill = "lightArmor", magnitude = 12 },
            { effect = "sanctuary", magnitude = 12, condition = RESTED },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 } },
  } },

{ name = "Cloth", -- unarmoured: a clear mind is the only shield
  bonuses = {
    min = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "feather", magnitude = 5 } },
    mid = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "feather", magnitude = 10 },
            { effect = "fortifySkill", skill = "alteration", magnitude = 12, condition = CHARGED },
            { effect = "weaknesstoNormalWeapons", magnitude = 10 } },
    max = { { effect = "restoreMagicka", magnitude = 2 },
            { effect = "feather", magnitude = 15 },
            { effect = "fortifySkill", skill = "alteration", magnitude = 18, condition = CHARGED },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 12, condition = CHARGED },
            { effect = "weaknesstoNormalWeapons", magnitude = 20 } },
  } },

-- =========================================================================
-- Base mod -- cultural sets (racial kinship + homeland habits)
-- =========================================================================

{ name = "Nordic", -- the north-wind umbrella: Kyne's storms and kinship
  -- (worn over the fur/bone sets, which keep the frost and muscle lanes)
  bonuses = {
    min = { { effect = "resistShock", magnitude = 10 } },
    mid = { { effect = "resistShock", magnitude = 15 },
            { effect = "resistFrost", magnitude = 10 } },
    max = { { effect = "resistShock", magnitude = 20 },
            { effect = "resistFrost", magnitude = 10 },
            { effect = "fortifyAttack", magnitude = 10, condition = race("Nord") } },
  } },

{ name = "Imperial", -- legion umbrella: citizenship and diplomacy (martial
  -- lanes belong to Templar/Guard and the metal sets sharing these items)
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 },
            { effect = "fortifySkill", skill = "speechcraft", magnitude = 5 } },
    mid = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "fortifySkill", skill = "speechcraft", magnitude = 8 } },
    max = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "fortifySkill", skill = "speechcraft", magnitude = 12 },
            { effect = "fortifyAttack", magnitude = 10, condition = race("Imperial") } },
  } },

{ name = "Colovian", -- western umbrella: highland discipline (worn over the
  -- Steel/Iron/Fur sets, which keep the health, metal, and frost lanes)
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "endurance", magnitude = 3 } },
    mid = { { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = RESTED },
            { effect = "resistFrost", magnitude = 10 } },
    max = { { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = RESTED },
            { effect = "resistFrost", magnitude = 10 } },
  } },

{ name = "Bosmer", -- Green Pact hunters: the forest steadies the bow
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "fortifySkill", skill = "marksman", magnitude = 12, condition = OUTSIDE } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "fortifySkill", skill = "marksman", magnitude = 18, condition = OUTSIDE },
            { effect = "fortifyAttack", magnitude = 10, condition = race("Wood Elf") } },
  } },

{ name = "Khajiit", -- moon-blessed: claws and grace after dark
  bonuses = {
    min = { { effect = "nightEye", magnitude = 25 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 } },
    mid = { { effect = "nightEye", magnitude = 40 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "fortifySkill", skill = "acrobatics", magnitude = 12, condition = NIGHT } },
    max = { { effect = "nightEye", magnitude = 50 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "fortifySkill", skill = "acrobatics", magnitude = 18, condition = NIGHT },
            { effect = "fortifySkill", skill = "handToHand", magnitude = 18, condition = NIGHT },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 8, condition = race("Khajiit") } },
  } },

{ name = "Orsimer", -- Orc cultural umbrella: stronghold pride (muscle and
  -- health are Orcish's lane, which shares most of these items)
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "endurance", magnitude = 3 } },
    mid = { { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
            { effect = "resistMagicka", magnitude = 8 } },
    max = { { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 12, condition = race("Orc") } },
  } },

{ name = "Native", -- Ashlander wastes-craft: the land provides
  bonuses = {
    min = { { effect = "resistBlightDisease", magnitude = 10 },
            { effect = "resistPoison", magnitude = 10 } },
    mid = { { effect = "resistBlightDisease", magnitude = 15 },
            { effect = "resistPoison", magnitude = 15 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 12, condition = OUTSIDE },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistBlightDisease", magnitude = 20 },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 18, condition = OUTSIDE },
            { effect = "restoreFatigue", magnitude = 2, condition = OUTSIDE },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Falmer", -- snow elf relics: they shun the sun that betrayed them
  bonuses = {
    min = { { effect = "resistFrost", magnitude = 10 },
            { effect = "chameleon", magnitude = 5 } },
    mid = { { effect = "resistFrost", magnitude = 15 },
            { effect = "chameleon", magnitude = 12, condition = SUN_DOWN },
            { effect = "nightEye", magnitude = 40, condition = SUN_DOWN } },
    max = { { effect = "resistFrost", magnitude = 20 },
            { effect = "chameleon", magnitude = 16, condition = SUN_DOWN },
            { effect = "nightEye", magnitude = 50, condition = SUN_DOWN },
            { effect = "sanctuary", magnitude = 10 } },
  } },

-- =========================================================================
-- Base mod -- faction sets
-- =========================================================================

{ name = "Fighters Guild", -- contract muscle: seasoned brawlers dig deep
  bonuses = {
    min = { { effect = "fortifyAttack", magnitude = 3 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "fortifyAttack", magnitude = 5 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 8, condition = BLOODIED } },
    max = { { effect = "fortifyAttack", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 12, condition = BLOODIED } },
  } },

{ name = "Mages Guild", -- guild robes: knowledge is kept power
  bonuses = {
    min = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifySkill", skill = "destruction", magnitude = 5 } },
    mid = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifySkill", skill = "destruction", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 8, condition = CHARGED } },
    max = { { effect = "restoreMagicka", magnitude = 2 },
            { effect = "fortifySkill", skill = "destruction", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 12, condition = CHARGED },
            { effect = "fortifyMagicka", magnitude = 12, condition = skillAtLeast("destruction", 50) },
            { effect = "resistMagicka", magnitude = 12 } },
  } },

{ name = "Thieves Guild", -- the job is on: night, indoors, gone by dawn
  bonuses = {
    min = { { effect = "fortifySkill", skill = "sneak", magnitude = 5 },
            { effect = "fortifySkill", skill = "security", magnitude = 5 } },
    mid = { { effect = "fortifySkill", skill = "sneak", magnitude = 8 },
            { effect = "fortifySkill", skill = "security", magnitude = 8 },
            { effect = "chameleon", magnitude = 12, condition = HEIST } },
    max = { { effect = "fortifySkill", skill = "sneak", magnitude = 12 },
            { effect = "fortifySkill", skill = "security", magnitude = 12 },
            { effect = "chameleon", magnitude = 16, condition = HEIST },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 } },
  } },

{ name = "Dark Brotherhood", -- night's blades: Sithis walks after dark
  bonuses = {
    min = { { effect = "fortifySkill", skill = "sneak", magnitude = 5 },
            { effect = "resistPoison", magnitude = 10 } },
    mid = { { effect = "fortifySkill", skill = "sneak", magnitude = 8 },
            { effect = "resistPoison", magnitude = 15 },
            { effect = "chameleon", magnitude = 12, condition = NIGHT } },
    max = { { effect = "fortifySkill", skill = "sneak", magnitude = 12 },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "chameleon", magnitude = 16, condition = NIGHT },
            { effect = "fortifyAttack", magnitude = 12, condition = NIGHT } },
  } },

{ name = "Morag Tong", -- lawful writs: executions are indoor work
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "fortifySkill", skill = "shortBlade", magnitude = 5 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "fortifySkill", skill = "shortBlade", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 8, condition = INSIDE } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifySkill", skill = "shortBlade", magnitude = 12 },
            { effect = "fortifyAttack", magnitude = 12, condition = INSIDE },
            { effect = "chameleon", magnitude = 12, condition = INSIDE } },
  } },

{ name = "House Hlaalu", -- the deal-makers: business happens indoors
  bonuses = {
    min = { { effect = "fortifySkill", skill = "mercantile", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 } },
    mid = { { effect = "fortifySkill", skill = "mercantile", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "fortifySkill", skill = "speechcraft", magnitude = 12, condition = INSIDE } },
    max = { { effect = "fortifySkill", skill = "mercantile", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "fortifySkill", skill = "speechcraft", magnitude = 18, condition = INSIDE },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 8 } },
  } },

{ name = "House Indoril", -- the faithful: the ward lane of the Temple
  -- cluster (restoration is Tribunal Temple's lane, melee grace Her Hand's)
  bonuses = {
    min = { { effect = "resistMagicka", magnitude = 5 },
            { effect = "fortifyMagicka", magnitude = 8 } },
    mid = { { effect = "resistMagicka", magnitude = 8 },
            { effect = "fortifyMagicka", magnitude = 12 },
            { effect = "turnUndead", magnitude = 30, condition = NIGHT } },
    max = { { effect = "resistMagicka", magnitude = 12 },
            { effect = "fortifyMagicka", magnitude = 18 },
            { effect = "turnUndead", magnitude = 50, condition = NIGHT } },
  } },

{ name = "House Dres", -- plantation lords: masters of the open fields
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "fortifySkill", skill = "longBlade", magnitude = 12, condition = OUTSIDE } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifySkill", skill = "longBlade", magnitude = 18, condition = OUTSIDE },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 } },
  } },

{ name = "House Telvanni", -- wizard-lords: power flows both full and empty
  bonuses = {
    min = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 3 } },
    mid = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 5 },
            { effect = "fortifySkill", skill = "mysticism", magnitude = 8 },
            { effect = "spellAbsorption", magnitude = 8, condition = DRAINED } },
    max = { { effect = "restoreMagicka", magnitude = 2 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 8 },
            { effect = "fortifySkill", skill = "mysticism", magnitude = 12 },
            { effect = "spellAbsorption", magnitude = 12, condition = DRAINED },
            { effect = "fortifySkill", skill = "destruction", magnitude = 12, condition = CHARGED } },
  } },

{ name = "Templar", -- legion templar: parade discipline, dawn to dusk
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "turnUndead", magnitude = 10 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "turnUndead", magnitude = 15 },
            { effect = "fortifyAttack", magnitude = 8, condition = DAY } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "turnUndead", magnitude = 20 },
            { effect = "fortifyAttack", magnitude = 12, condition = DAY },
            { effect = "resistMagicka", magnitude = 12 } },
  } },

{ name = "Guard", -- town watch: sharpest on the day shift
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = DAY },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = DAY },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Royal Guard", -- Helseth's own: the palace is their fortress
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "resistMagicka", magnitude = 8 },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "reflect", magnitude = 12, condition = INSIDE },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Her Hand", -- Almalexia's chosen: the champion lane -- her grace
  -- finds the fallen (wards are Indoril's lane, healing arts the Temple's)
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 5 },
            { effect = "restoreHealth", magnitude = 2, condition = LAST_STAND } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 8 },
            { effect = "restoreHealth", magnitude = 3, condition = LAST_STAND },
            { effect = "sanctuary", magnitude = 12, condition = LAST_STAND } },
  } },

{ name = "Tribunal Temple", -- pilgrim vestments: the healer lane -- rest
  -- under a roof (wards are Indoril's lane where the items overlap)
  bonuses = {
    min = { { effect = "fortifySkill", skill = "restoration", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 } },
    mid = { { effect = "fortifySkill", skill = "restoration", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "restoreHealth", magnitude = 2, condition = INSIDE } },
    max = { { effect = "fortifySkill", skill = "restoration", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "restoreHealth", magnitude = 2, condition = INSIDE },
            { effect = "turnUndead", magnitude = 20 } },
  } },

-- =========================================================================
-- Base mod -- special sets
-- =========================================================================

{ name = "Artifacts", -- mismatched relics: they wake when their bearer falls
  bonuses = {
    min = { { effect = "resistMagicka", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 3 } },
    mid = { { effect = "resistMagicka", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
            { effect = "spellAbsorption", magnitude = 8, condition = LAST_STAND } },
    max = { { effect = "resistMagicka", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
            { effect = "spellAbsorption", magnitude = 12, condition = LAST_STAND },
            { effect = "reflect", magnitude = 12, condition = LAST_STAND },
            { effect = "fortifyMagicka", magnitude = 12, condition = VETERAN } },
  } },

{ name = "Master", -- master-at-arms: instinct honed at death's door
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "luck", magnitude = 3 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "sanctuary", magnitude = 12, condition = LAST_STAND } },
    max = { { effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "sanctuary", magnitude = 16, condition = LAST_STAND },
            { effect = "fortifyAttack", magnitude = 12, condition = LAST_STAND },
            { effect = "fortifyAttack", magnitude = 8, condition = MASTER_AT_ARMS } },
  } },

{ name = "Dragonscale", -- scaled hide: reads the wind under open sky
  bonuses = {
    min = { { effect = "resistFire", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 } },
    mid = { { effect = "resistFire", magnitude = 15 },
            { effect = "resistMagicka", magnitude = 8 },
            { effect = "sanctuary", magnitude = 8, condition = OUTSIDE },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistFire", magnitude = 20 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "sanctuary", magnitude = 12, condition = OUTSIDE },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Embossed", -- parade plate: made for halls and audiences
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 } },
    mid = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "fortifySkill", skill = "speechcraft", magnitude = 12, condition = INSIDE } },
    max = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "fortifySkill", skill = "speechcraft", magnitude = 18, condition = INSIDE },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 8 } },
  } },

{ name = "Engraved", -- rune-cut plate: the runes feed a spent caster
  bonuses = {
    min = { { effect = "resistMagicka", magnitude = 5 } },
    mid = { { effect = "resistMagicka", magnitude = 8 },
            { effect = "spellAbsorption", magnitude = 8, condition = DRAINED } },
    max = { { effect = "resistMagicka", magnitude = 12 },
            { effect = "spellAbsorption", magnitude = 12, condition = DRAINED },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 } },
  } },

{ name = "Kynareth", -- the sky goddess: her favour falls outdoors
  bonuses = {
    min = { { effect = "slowFall", magnitude = 10 },
            { effect = "resistShock", magnitude = 10 } },
    mid = { { effect = "slowFall", magnitude = 15 },
            { effect = "resistShock", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 8, condition = OUTSIDE } },
    max = { { effect = "slowFall", magnitude = 20 },
            { effect = "resistShock", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 12, condition = OUTSIDE },
            { effect = "restoreFatigue", magnitude = 2, condition = OUTSIDE } },
  } },

-- =========================================================================
-- Tamriel Rebuilt add-on sets (applied only when the TR add-on registered
-- them; skipped otherwise)
-- =========================================================================

{ name = "Alessian Bronze", -- crusader bronze: old oaths burn under the sun
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistMagicka", magnitude = 5 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistMagicka", magnitude = 8 },
            { effect = "turnUndead", magnitude = 30, condition = SUN_UP },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "turnUndead", magnitude = 50, condition = SUN_UP },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Alit Hide", -- loping predator: born to run down prey
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
            { effect = "resistPoison", magnitude = 10 } },
    mid = { { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "resistPoison", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 8, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "speed", magnitude = 12, condition = OUTSIDE },
            { effect = "fortifyAttack", magnitude = 8, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Altmer", -- Summerset finery: brilliance while reserves run high
  bonuses = {
    min = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 3 } },
    mid = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 5 },
            { effect = "fortifySkill", skill = "destruction", magnitude = 12, condition = CHARGED },
            { effect = "weaknesstoMagicka", magnitude = 10 } },
    max = { { effect = "restoreMagicka", magnitude = 2 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 8 },
            { effect = "fortifySkill", skill = "destruction", magnitude = 18, condition = CHARGED },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 12, condition = race("High Elf") },
            { effect = "weaknesstoMagicka", magnitude = 20 } },
  } },

{ name = "Ancient Nordic", -- barrow-plate: it remembers the draugr hours
  bonuses = {
    min = { { effect = "resistFrost", magnitude = 10 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "resistFrost", magnitude = 15 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "turnUndead", magnitude = 30, condition = NIGHT } },
    max = { { effect = "resistFrost", magnitude = 20 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "turnUndead", magnitude = 50, condition = NIGHT } },
  } },

{ name = "Anvil", -- gold coast harbour watch: sea air in the lungs
  bonuses = {
    min = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 20 } },
    mid = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 30 },
            { effect = "resistFrost", magnitude = 15 } },
    max = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 40 },
            { effect = "resistFrost", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "restoreFatigue", magnitude = 2, condition = OUTSIDE } },
  } },

{ name = "Argonian", -- marsh-craft: the Hist looks after its own
  bonuses = {
    min = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "resistPoison", magnitude = 10 } },
    mid = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "resistPoison", magnitude = 15 },
            { effect = "resistCommonDisease", magnitude = 15 },
            { effect = "swiftSwim", magnitude = 30 } },
    max = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "resistCommonDisease", magnitude = 20 },
            { effect = "swiftSwim", magnitude = 40 },
            { effect = "restoreHealth", magnitude = 2, condition = race("Argonian") } },
  } },

{ name = "Ayleid", -- wild elf relics: star-magic under the open night sky
  bonuses = {
    min = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "light", magnitude = 8 } },
    mid = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "spellAbsorption", magnitude = 8, condition = UNDER_STARS } },
    max = { { effect = "restoreMagicka", magnitude = 2 },
            { effect = "spellAbsorption", magnitude = 12, condition = UNDER_STARS },
            { effect = "resistMagicka", magnitude = 12 } },
  } },

{ name = "Bal-Darum", -- quarry plate: the labourer lane -- field repairs
  -- when battered (its items also count toward Bonemold/Dunmer/Native)
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "strength", magnitude = 3 },
            { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifySkill", skill = "armorer", magnitude = 12, condition = BLOODIED } },
    max = { { effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifySkill", skill = "armorer", magnitude = 18, condition = BLOODIED } },
  } },

{ name = "Breton", -- mage-knight: born spell-shielded
  bonuses = {
    min = { { effect = "resistMagicka", magnitude = 5 } },
    mid = { { effect = "resistMagicka", magnitude = 8 },
            { effect = "spellAbsorption", magnitude = 5 } },
    max = { { effect = "resistMagicka", magnitude = 12 },
            { effect = "spellAbsorption", magnitude = 8 },
            { effect = "fortifySkill", skill = "conjuration", magnitude = 12, condition = CHARGED },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 8, condition = race("Breton") } },
  } },

{ name = "Cataphract", -- shock cavalry: the charge starts on fresh legs
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifyAttack", magnitude = 5 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 8, condition = RESTED },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Chap-thil", -- ashland chitin: the ash sun feeds it
  bonuses = {
    min = { { effect = "resistFire", magnitude = 10 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "resistFire", magnitude = 15 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "resistParalysis", magnitude = 15 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistFire", magnitude = 20 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistParalysis", magnitude = 20 },
            { effect = "restoreFatigue", magnitude = 2, condition = SUN_UP },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Chev-Aram", -- duelling harness: poise while untouched
  bonuses = {
    min = { { effect = "fortifyAttack", magnitude = 3 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 } },
    mid = { { effect = "fortifyAttack", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "sanctuary", magnitude = 8, condition = FRESH } },
    max = { { effect = "fortifyAttack", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "sanctuary", magnitude = 12, condition = FRESH },
            { effect = "fortifyHealth", magnitude = 18 } },
  } },

{ name = "Chuzei", -- bonemold officer: the command lane (worn over Bonemold,
  -- which supplies the tank stats -- this adds the officer's edge)
  bonuses = {
    min = { { effect = "fortifyAttack", magnitude = 3 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 } },
    mid = { { effect = "fortifyAttack", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = FRESH },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "fortifyAttack", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = FRESH },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Colovian Leather", -- western scout: quiet work in open country
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 12, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 18, condition = OUTSIDE },
            { effect = "fortifySkill", skill = "acrobatics", magnitude = 12 },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Companions", -- sworn mercenaries: shield-brothers stand fast
  bonuses = {
    min = { { effect = "fortifyAttack", magnitude = 3 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "fortifyAttack", magnitude = 5 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifyHealth", magnitude = 15, condition = BLOODIED } },
    max = { { effect = "fortifyAttack", magnitude = 8 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyHealth", magnitude = 22, condition = BLOODIED },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 } },
  } },

{ name = "Crown Guard", -- palace posting: sworn to the throne room
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = INSIDE },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = INSIDE },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Daedric Hide", -- dread leather: the dark drapes it closer (wards
  -- are Daedric plate's lane -- this keeps only an echo of the absorption)
  bonuses = {
    min = { { effect = "spellAbsorption", magnitude = 3 } },
    mid = { { effect = "spellAbsorption", magnitude = 3 },
            { effect = "sanctuary", magnitude = 12, condition = NIGHT },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "spellAbsorption", magnitude = 3 },
            { effect = "sanctuary", magnitude = 16, condition = NIGHT },
            { effect = "restoreMagicka", magnitude = 2, condition = NIGHT },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Domina", -- commander's panoply: presence while unbloodied
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 },
            { effect = "fortifyAttack", magnitude = 3 } },
    mid = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 5 },
            { effect = "fortifyHealth", magnitude = 12 } },
    max = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "sanctuary", magnitude = 12, condition = attrAtLeast("personality", 60) } },
  } },

{ name = "Dunmer", -- Velothi umbrella: echo ward + kinship (worn over most
  -- Dunmer-made sets, so it stays deliberately light -- lanes, not stacking)
  bonuses = {
    min = { { effect = "resistFire", magnitude = 10 } },
    mid = { { effect = "resistFire", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 3 } },
    max = { { effect = "resistFire", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "willpower", magnitude = 3 },
            { effect = "fortifyAttack", magnitude = 10, condition = race("Dark Elf") } },
  } },

{ name = "Ebonweave", -- spell-woven ebony: it drinks for a spent caster
  bonuses = {
    min = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "resistMagicka", magnitude = 8 },
            { effect = "spellAbsorption", magnitude = 8, condition = DRAINED } },
    max = { { effect = "restoreMagicka", magnitude = 2 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "spellAbsorption", magnitude = 12, condition = DRAINED } },
  } },

{ name = "Falkreath Guard", -- pine watch: day patrols in the cold
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistFrost", magnitude = 10 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistFrost", magnitude = 15 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = DAY },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistFrost", magnitude = 20 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = DAY },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Gah'Kogo", -- goblin-work chitin: the skulker lane (poison stays an
  -- echo -- House Dres owns it where these items overlap)
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 } },
    mid = { { effect = "resistPoison", magnitude = 10 },
            { effect = "resistParalysis", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8, condition = NIGHT },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistPoison", magnitude = 10 },
            { effect = "resistParalysis", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 12, condition = NIGHT },
            { effect = "fortifySkill", skill = "sneak", magnitude = 12, condition = NIGHT },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Gilded Glass", -- courtly glass: it sparkles under chandeliers
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 } },
    mid = { { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "resistFire", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "sanctuary", magnitude = 8, condition = INSIDE },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "resistFire", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "sanctuary", magnitude = 12, condition = INSIDE },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Gold", -- wealth worn openly: money talks indoors
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 } },
    mid = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "fortifySkill", skill = "mercantile", magnitude = 12, condition = INSIDE },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "fortifySkill", skill = "mercantile", magnitude = 18, condition = INSIDE },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Golden Saint", -- daedric radiance: wrath when the vessel cracks
  bonuses = {
    min = { { effect = "resistMagicka", magnitude = 5 },
            { effect = "spellAbsorption", magnitude = 3 } },
    mid = { { effect = "resistMagicka", magnitude = 8 },
            { effect = "spellAbsorption", magnitude = 5 },
            { effect = "reflect", magnitude = 8, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistMagicka", magnitude = 12 },
            { effect = "spellAbsorption", magnitude = 8 },
            { effect = "reflect", magnitude = 12, condition = BLOODIED },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Guar Hide", -- pack-beast leather: bred to carry loads outdoors
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 },
            { effect = "resistBlightDisease", magnitude = 10 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "resistBlightDisease", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
            { effect = "feather", magnitude = 10, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistBlightDisease", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "feather", magnitude = 15, condition = OUTSIDE },
            { effect = "fortifySkill", skill = "athletics", magnitude = 12 },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "House Direnni", -- hermetic clan-craft: studied wards (the deep
  -- magicka well is the Altmer set's lane where these items overlap)
  bonuses = {
    min = { { effect = "resistMagicka", magnitude = 5 },
            { effect = "restoreMagicka", magnitude = 1 } },
    mid = { { effect = "resistMagicka", magnitude = 8 },
            { effect = "restoreMagicka", magnitude = 1 },
            { effect = "spellAbsorption", magnitude = 5 } },
    max = { { effect = "resistMagicka", magnitude = 12 },
            { effect = "restoreMagicka", magnitude = 1 },
            { effect = "spellAbsorption", magnitude = 8 },
            { effect = "reflect", magnitude = 8, condition = CHARGED } },
  } },

{ name = "House Redoran", -- the duty-bound: the spear steadies in hard fights
  -- (blight resist stays an echo -- Chitin owns it where the items overlap)
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistBlightDisease", magnitude = 10 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistBlightDisease", magnitude = 10 },
            { effect = "fortifySkill", skill = "spear", magnitude = 12, condition = BLOODIED } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistBlightDisease", magnitude = 10 },
            { effect = "fortifySkill", skill = "spear", magnitude = 18, condition = BLOODIED },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 } },
  } },

{ name = "Kagouti Hide", -- territorial beast: it bristles in the open
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "speed", magnitude = 3 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 5 } },
    mid = { { effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 8 },
            { effect = "resistPoison", magnitude = 15 },
            { effect = "fortifyAttack", magnitude = 8, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyAttribute", attribute = "speed", magnitude = 8 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 12 },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifyAttack", magnitude = 12, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Kalantar", -- fire-forged: strength kept in reserve
  bonuses = {
    min = { { effect = "resistFire", magnitude = 10 },
            { effect = "fortifyAttack", magnitude = 3 } },
    mid = { { effect = "resistFire", magnitude = 15 },
            { effect = "fortifyAttack", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 5 } },
    max = { { effect = "resistFire", magnitude = 20 },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 15, condition = BLOODIED } },
  } },

{ name = "Klibanion", -- heavy lamellar: layered against the worst
  bonuses = {
    min = { { effect = "resistNormalWeapons", magnitude = 3 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 3 } },
    mid = { { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
            { effect = "fortifyHealth", magnitude = 15, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 22, condition = BLOODIED },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Kragen", -- merchant-clan mail: the trader lane (its items also
  -- count toward Bonemold, which supplies the armour stats)
  bonuses = {
    min = { { effect = "fortifySkill", skill = "mercantile", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 3 } },
    mid = { { effect = "fortifySkill", skill = "mercantile", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 5 },
            { effect = "fortifySkill", skill = "mercantile", magnitude = 12, condition = INSIDE },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "fortifySkill", skill = "mercantile", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "luck", magnitude = 8 },
            { effect = "fortifySkill", skill = "mercantile", magnitude = 18, condition = INSIDE },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Kvetchi", -- marchers' kit: it keeps you moving when spent
  bonuses = {
    min = { { effect = "resistBlightDisease", magnitude = 10 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "resistBlightDisease", magnitude = 15 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "resistPoison", magnitude = 15 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistBlightDisease", magnitude = 20 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "restoreFatigue", magnitude = 2, condition = WINDED },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Lamellar", -- laced plates: they take the hits you can't
  bonuses = {
    min = { { effect = "resistNormalWeapons", magnitude = 3 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyHealth", magnitude = 15, condition = WINDED },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Mananaut", -- void sailors: the stars are out past the sun
  bonuses = {
    min = { { effect = "resistShock", magnitude = 10 },
            { effect = "waterBreathing", magnitude = 1 } },
    mid = { { effect = "resistShock", magnitude = 15 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 5 },
            { effect = "slowFall", magnitude = 15 } },
    max = { { effect = "resistShock", magnitude = 20 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 8 },
            { effect = "slowFall", magnitude = 20 },
            { effect = "reflect", magnitude = 12, condition = SUN_DOWN } },
  } },

{ name = "Manatee Leather", -- placid swimmer: happiest in open water-country
  bonuses = {
    min = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 20 } },
    mid = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 30 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 40 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistFrost", magnitude = 20 },
            { effect = "restoreFatigue", magnitude = 2, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Maormer", -- sea elf raiders: they board by darkness
  bonuses = {
    min = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 20 } },
    mid = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 30 },
            { effect = "resistShock", magnitude = 15 } },
    max = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "swiftSwim", magnitude = 40 },
            { effect = "resistShock", magnitude = 20 },
            { effect = "chameleon", magnitude = 16, condition = NIGHT } },
  } },

{ name = "Maradlai", -- runner's kit: the courier lane -- it outruns death
  bonuses = {
    min = { { effect = "fortifyAttribute", attribute = "speed", magnitude = 3 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
            { effect = "fortifyFatigue", magnitude = 20 } },
    max = { { effect = "fortifyAttribute", attribute = "speed", magnitude = 8 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "sanctuary", magnitude = 12, condition = WINDED } },
  } },

{ name = "Militia", -- home guard: it musters by day and shelters its greenest
  bonuses = {
    min = { { effect = "fortifyFatigue", magnitude = 12 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = DAY },
            { effect = "restoreHealth", magnitude = 1, condition = GREEN } },
    max = { { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = DAY },
            { effect = "restoreHealth", magnitude = 1, condition = GREEN } },
  } },

{ name = "Molecrab", -- burrower's shell: safest under a roof of stone
  bonuses = {
    min = { { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "sanctuary", magnitude = 8, condition = SHADE },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "sanctuary", magnitude = 12, condition = SHADE },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Narsis Watch", -- Hlaalu watch: order is good for business
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = DAY } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = DAY },
            { effect = "fortifySkill", skill = "mercantile", magnitude = 12 } },
  } },

{ name = "Navy", -- fleet issue: all hands on deck
  bonuses = {
    min = { { effect = "swiftSwim", magnitude = 20 },
            { effect = "waterBreathing", magnitude = 1 } },
    mid = { { effect = "swiftSwim", magnitude = 30 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "resistFrost", magnitude = 15 },
            { effect = "fortifyAttack", magnitude = 8, condition = OUTSIDE } },
    max = { { effect = "swiftSwim", magnitude = 40 },
            { effect = "waterBreathing", magnitude = 1 },
            { effect = "resistFrost", magnitude = 20 },
            { effect = "fortifyAttack", magnitude = 12, condition = OUTSIDE },
            { effect = "fortifyFatigue", magnitude = 28 } },
  } },

{ name = "Necrom Guard", -- city of the dead: the night watch never blinks
  bonuses = {
    min = { { effect = "turnUndead", magnitude = 10 },
            { effect = "resistMagicka", magnitude = 5 } },
    mid = { { effect = "turnUndead", magnitude = 15 },
            { effect = "resistMagicka", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "turnUndead", magnitude = 20, condition = NIGHT },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "turnUndead", magnitude = 20 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "turnUndead", magnitude = 30, condition = NIGHT },
            { effect = "fortifySkill", skill = "restoration", magnitude = 12 },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Nibenese", -- eastern silk-and-scale: trade blessed by ancestors
  bonuses = {
    min = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifySkill", skill = "mercantile", magnitude = 5 } },
    mid = { { effect = "restoreMagicka", magnitude = 1 },
            { effect = "fortifySkill", skill = "mercantile", magnitude = 8 },
            { effect = "resistMagicka", magnitude = 8 } },
    max = { { effect = "restoreMagicka", magnitude = 2 },
            { effect = "fortifySkill", skill = "mercantile", magnitude = 12 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8, condition = race("Imperial") } },
  } },

{ name = "Oloman", -- foundry plate: it anneals under punishment (health is
  -- Steel's lane where these items overlap)
  bonuses = {
    min = { { effect = "resistFire", magnitude = 10 },
            { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "resistFire", magnitude = 15 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8, condition = BLOODIED } },
    max = { { effect = "resistFire", magnitude = 20 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 12, condition = BLOODIED } },
  } },

{ name = "Quey Chitin", -- jetting shell: it bolts when cracked
  bonuses = {
    min = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "resistPoison", magnitude = 10 } },
    mid = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "resistPoison", magnitude = 15 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "swiftSwim", magnitude = 60, condition = BLOODIED },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Reach", -- witch-warriors: old pacts stir after dark
  bonuses = {
    min = { { effect = "resistFrost", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 3 } },
    mid = { { effect = "resistFrost", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 5 },
            { effect = "spellAbsorption", magnitude = 8, condition = NIGHT } },
    max = { { effect = "resistFrost", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "spellAbsorption", magnitude = 12, condition = NIGHT } },
  } },

{ name = "Reach Royal Guard", -- king's men of the crags: grim when hurt
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistFrost", magnitude = 10 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistFrost", magnitude = 15 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistFrost", magnitude = 20 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = BLOODIED },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Red Dome Templar", -- warrior-priests: grace at death's door
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistMagicka", magnitude = 5 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistMagicka", magnitude = 8 },
            { effect = "turnUndead", magnitude = 15 },
            { effect = "restoreHealth", magnitude = 2, condition = LAST_STAND } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistMagicka", magnitude = 12 },
            { effect = "turnUndead", magnitude = 20 },
            { effect = "restoreHealth", magnitude = 3, condition = LAST_STAND },
            { effect = "fortifySkill", skill = "restoration", magnitude = 12 } },
  } },

{ name = "Redguard", -- Yokudan drill: adrenaline when the body empties
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 3 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = WINDED },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = WINDED },
            { effect = "restoreFatigue", magnitude = 2, condition = WINDED },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8, condition = race("Redguard") },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Redguard Iron Lamellar", -- desert lamellar: it outlasts the tired
  bonuses = {
    min = { { effect = "resistNormalWeapons", magnitude = 3 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifyAttack", magnitude = 5 },
            { effect = "weaknesstoShock", magnitude = 10 } },
    max = { { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 8, condition = WINDED },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "weaknesstoShock", magnitude = 20 } },
  } },

{ name = "Reman", -- the emperor's legacy: dragonblood at the brink
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifyAttack", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 16, condition = LAST_STAND } },
  } },

{ name = "Rihad Guard", -- desert watch: fiercest under the noon sun
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = SUN_UP },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = SUN_UP },
            { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Riverwatch", -- river patrol: they walk their beat on the water
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "waterWalking", magnitude = 1 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "waterWalking", magnitude = 1 },
            { effect = "resistNormalWeapons", magnitude = 5 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "waterWalking", magnitude = 1 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "resistBlightDisease", magnitude = 20 },
            { effect = "fortifyAttack", magnitude = 8, condition = OUTSIDE } },
  } },

{ name = "Rourken", -- exile clan dwemerwork: it hums in closed halls
  bonuses = {
    min = { { effect = "resistShock", magnitude = 10 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "resistShock", magnitude = 15 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "reflect", magnitude = 8, condition = INSIDE } },
    max = { { effect = "resistShock", magnitude = 20 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "reflect", magnitude = 12, condition = INSIDE } },
  } },

{ name = "Sacred Lands", -- Ashlander pilgrims: the wilds keep the faithful
  bonuses = {
    min = { { effect = "resistMagicka", magnitude = 5 },
            { effect = "fortifyHealth", magnitude = 8 } },
    mid = { { effect = "resistMagicka", magnitude = 8 },
            { effect = "fortifyHealth", magnitude = 12 },
            { effect = "fortifySkill", skill = "restoration", magnitude = 8 },
            { effect = "restoreHealth", magnitude = 2, condition = OUTSIDE } },
    max = { { effect = "resistMagicka", magnitude = 12 },
            { effect = "fortifyHealth", magnitude = 18 },
            { effect = "fortifySkill", skill = "restoration", magnitude = 12 },
            { effect = "restoreHealth", magnitude = 2, condition = OUTSIDE },
            { effect = "turnUndead", magnitude = 20 } },
  } },

{ name = "Saliache", -- elven antique: grace while unmarred
  bonuses = {
    min = { { effect = "resistBlightDisease", magnitude = 10 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 5 } },
    mid = { { effect = "resistBlightDisease", magnitude = 15 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 8 },
            { effect = "resistPoison", magnitude = 15 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistBlightDisease", magnitude = 20 },
            { effect = "fortifySkill", skill = "athletics", magnitude = 12 },
            { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 12, condition = FRESH },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Shellmold", -- shell-cast bonemold: it braces on impact
  bonuses = {
    min = { { effect = "resistNormalWeapons", magnitude = 3 },
            { effect = "resistShock", magnitude = 10 } },
    mid = { { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "resistShock", magnitude = 15 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "resistShock", magnitude = 20 },
            { effect = "fortifyHealth", magnitude = 15, condition = BLOODIED },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Shinathi Chitin", -- night-stalker chitin: quiet in the dark
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "resistBlightDisease", magnitude = 10 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "resistBlightDisease", magnitude = 15 },
            { effect = "resistParalysis", magnitude = 15 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 12, condition = NIGHT },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "resistBlightDisease", magnitude = 20 },
            { effect = "resistParalysis", magnitude = 20 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 18, condition = NIGHT },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Shipal-Arai", -- Ashlander war-kit: the spear lane (blight/poison
  -- belong to Native, which its items also count toward)
  bonuses = {
    min = { { effect = "fortifySkill", skill = "spear", magnitude = 5 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 } },
    mid = { { effect = "fortifySkill", skill = "spear", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "resistParalysis", magnitude = 15 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "fortifySkill", skill = "spear", magnitude = 12 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
            { effect = "resistParalysis", magnitude = 20 },
            { effect = "fortifyAttack", magnitude = 8, condition = OUTSIDE },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Skingrad", -- vine-county watch: they watch for vampires at night
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "resistCommonDisease", magnitude = 10 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "resistCommonDisease", magnitude = 15 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 8, condition = NIGHT } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "resistCommonDisease", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 12, condition = NIGHT },
            { effect = "resistMagicka", magnitude = 12 } },
  } },

{ name = "Sutch Mail", -- garrison mail: drilled to recover fast
  bonuses = {
    min = { { effect = "fortifyHealth", magnitude = 8 },
            { effect = "resistNormalWeapons", magnitude = 3 } },
    mid = { { effect = "fortifyHealth", magnitude = 12 },
            { effect = "resistNormalWeapons", magnitude = 5 },
            { effect = "fortifyAttack", magnitude = 5 } },
    max = { { effect = "fortifyHealth", magnitude = 18 },
            { effect = "resistNormalWeapons", magnitude = 8 },
            { effect = "fortifyAttack", magnitude = 8 },
            { effect = "restoreFatigue", magnitude = 2, condition = WINDED } },
  } },

{ name = "Thirr", -- river-plantation gear: the river-hand lane
  bonuses = {
    min = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 3 } },
    mid = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
            { effect = "swiftSwim", magnitude = 30 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "waterBreathing", magnitude = 1 },
            { effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
            { effect = "swiftSwim", magnitude = 40 },
            { effect = "fortifyAttack", magnitude = 8, condition = DAY },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

{ name = "Toadscale", -- swamp scale: a nocturnal skin
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "resistFrost", magnitude = 10 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "resistFrost", magnitude = 15 },
            { effect = "resistCommonDisease", magnitude = 15 },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "resistFrost", magnitude = 20 },
            { effect = "resistCommonDisease", magnitude = 20 },
            { effect = "sanctuary", magnitude = 12, condition = NIGHT },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Watchman", -- night watch: eyes that own the dark (health belongs
  -- to House Redoran where these items overlap)
  bonuses = {
    min = { { effect = "nightEye", magnitude = 25 },
            { effect = "fortifyFatigue", magnitude = 12 } },
    mid = { { effect = "nightEye", magnitude = 40 },
            { effect = "fortifyFatigue", magnitude = 20 },
            { effect = "fortifyAttack", magnitude = 8, condition = NIGHT } },
    max = { { effect = "nightEye", magnitude = 50 },
            { effect = "fortifyFatigue", magnitude = 28 },
            { effect = "fortifyAttack", magnitude = 12, condition = NIGHT },
            { effect = "detectAnimal", magnitude = 50 } },
  } },

{ name = "Wenbone", -- bone-bow hunter: patient shots from cover
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 },
            { effect = "fortifySkill", skill = "marksman", magnitude = 5 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "fortifySkill", skill = "marksman", magnitude = 8 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 12, condition = OUTSIDE },
            { effect = "weaknesstoFire", magnitude = 10 } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "fortifySkill", skill = "marksman", magnitude = 12 },
            { effect = "fortifySkill", skill = "sneak", magnitude = 18, condition = OUTSIDE },
            { effect = "fortifyAttack", magnitude = 8, condition = skillAtLeast("marksman", 50) },
            { effect = "weaknesstoFire", magnitude = 20 } },
  } },

{ name = "Wormmouth", -- wormmouth hide: numb to venom, quick in the dark
  bonuses = {
    min = { { effect = "resistPoison", magnitude = 10 } },
    mid = { { effect = "resistPoison", magnitude = 15 },
            { effect = "resistBlightDisease", magnitude = 15 },
            { effect = "weaknesstoFrost", magnitude = 10 } },
    max = { { effect = "resistPoison", magnitude = 20 },
            { effect = "resistBlightDisease", magnitude = 20 },
            { effect = "resistParalysis", magnitude = 20 },
            { effect = "fortifyAttribute", attribute = "agility", magnitude = 8, condition = NIGHT },
            { effect = "weaknesstoFrost", magnitude = 20 } },
  } },

}
