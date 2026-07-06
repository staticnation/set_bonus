-- Set Bonus -- Conditional Rebalance data for OpenMW.
-- AUTO-GENERATED from MWSE/mods/Static/SetBonusRebalance/data.lua by
-- gen_rebalance.py -- edit the MWSE file and regenerate; don't edit here.
-- Effect ids are OpenMW MagicEffectId strings; conditions are identical
-- on both engines (cross-engine kinds only).
return {
  { name = "Iron",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Steel",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "fortifyattack", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyattack", mag = 5 },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyattack", mag = 8 },
        { effect = "resistnormalweapons", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Ebony",
    bonuses = {
      min = {
        { effect = "resistfire", mag = 10 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "resistfire", mag = 15 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 8, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistfire", mag = 20 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "resistmagicka", mag = 12 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Daedric",
    bonuses = {
      min = {
        { effect = "spellabsorption", mag = 3 },
      },
      mid = {
        { effect = "spellabsorption", mag = 5 },
        { effect = "resistmagicka", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "spellabsorption", mag = 8 },
        { effect = "resistmagicka", mag = 12 },
        { effect = "fortifyattack", mag = 16, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        { effect = "sanctuary", mag = 12, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Dwemer",
    bonuses = {
      min = {
        { effect = "resistshock", mag = 10 },
      },
      mid = {
        { effect = "resistshock", mag = 15 },
        { effect = "reflect", mag = 8, condition = { kind = "location", value = "interior" } },
      },
      max = {
        { effect = "resistshock", mag = 20 },
        { effect = "reflect", mag = 12, condition = { kind = "location", value = "interior" } },
        { effect = "sanctuary", mag = 12, condition = { kind = "location", value = "interior" } },
        { effect = "resistmagicka", mag = 8 },
      },
    },
  },
  { name = "Adamantium",
    bonuses = {
      min = {
        { effect = "resistmagicka", mag = 5 },
      },
      mid = {
        { effect = "resistmagicka", mag = 8 },
        { effect = "reflect", mag = 8, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistmagicka", mag = 12 },
        { effect = "reflect", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Orcish",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "fortifyattribute", attribute = "strength", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyattribute", attribute = "strength", mag = 5 },
        { effect = "restorehealth", mag = 2, dur = 1, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyattribute", attribute = "strength", mag = 8 },
        { effect = "restorehealth", mag = 3, dur = 1, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyattack", mag = 12, condition = { kind = "attribute", op = ">=", id = "strength", value = 60 } },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Bronze",
    bonuses = {
      min = {
        { effect = "resistshock", mag = 10 },
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "resistshock", mag = 15 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "sun", value = "up" } },
      },
      max = {
        { effect = "resistshock", mag = 20 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "sun", value = "up" } },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
      },
    },
  },
  { name = "Plate",
    bonuses = {
      min = {
        { effect = "resistnormalweapons", mag = 3 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "resistparalysis", mag = 20 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Splint",
    bonuses = {
      min = {
        { effect = "resistnormalweapons", mag = 3 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyskill", skill = "block", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyskill", skill = "block", mag = 18, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Silver",
    bonuses = {
      min = {
        { effect = "resistmagicka", mag = 5 },
      },
      mid = {
        { effect = "resistmagicka", mag = 8 },
        { effect = "turnundead", mag = 15 },
        { effect = "spellabsorption", mag = 8, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistmagicka", mag = 12 },
        { effect = "turnundead", mag = 20 },
        { effect = "spellabsorption", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Stalhrim",
    bonuses = {
      min = {
        { effect = "resistfrost", mag = 10 },
      },
      mid = {
        { effect = "resistfrost", mag = 15 },
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyattribute", attribute = "willpower", mag = 8, condition = { kind = "sun", value = "down" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistfrost", mag = 20 },
        { effect = "restoremagicka", mag = 2, dur = 1 },
        { effect = "fortifyattribute", attribute = "willpower", mag = 12, condition = { kind = "sun", value = "down" } },
        { effect = "resistmagicka", mag = 12, condition = { kind = "sun", value = "down" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Dragonbone",
    bonuses = {
      min = {
        { effect = "resistfire", mag = 10 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "resistfire", mag = 15 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistfire", mag = 20 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "resistmagicka", mag = 12 },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Chain Mail",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "resistnormalweapons", mag = 8, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistnormalweapons", mag = 12, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Bonemold",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistblightdisease", mag = 10 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistblightdisease", mag = 10 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistblightdisease", mag = 10 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "resistnormalweapons", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Gah-Julan",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
        { effect = "sanctuary", mag = 8 },
      },
    },
  },
  { name = "Armun-An",
    bonuses = {
      min = {
        { effect = "resistfire", mag = 10 },
      },
      mid = {
        { effect = "resistfire", mag = 15 },
        { effect = "fortifyhealth", mag = 15, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistfire", mag = 20 },
        { effect = "fortifyhealth", mag = 22, condition = { kind = "location", value = "exterior" } },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Dreugh",
    bonuses = {
      min = {
        { effect = "resistshock", mag = 10 },
        { effect = "waterbreathing", mag = 1 },
      },
      mid = {
        { effect = "resistshock", mag = 15 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 30 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistshock", mag = 20 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 40 },
        { effect = "reflect", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Ring Mail",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "resistnormalweapons", mag = 8, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "resistnormalweapons", mag = 12, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Scale Mail",
    bonuses = {
      min = {
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyhealth", mag = 15, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Goblin",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "strength", mag = 3 },
        { effect = "resistcommondisease", mag = 10 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "strength", mag = 5 },
        { effect = "resistcommondisease", mag = 15 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
      },
      max = {
        { effect = "fortifyattribute", attribute = "strength", mag = 8 },
        { effect = "resistcommondisease", mag = 20 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyfatigue", mag = 28 },
      },
    },
  },
  { name = "Trollbone",
    bonuses = {
      min = {
        { effect = "restorehealth", mag = 1, dur = 1 },
      },
      mid = {
        { effect = "restorehealth", mag = 1, dur = 1 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 5 },
        { effect = "restorehealth", mag = 2, dur = 1, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "restorehealth", mag = 1, dur = 1 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "restorehealth", mag = 3, dur = 1, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "weaknesstofire", mag = 10 },
        { effect = "weaknesstofire", mag = 15, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "Leather",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
        { effect = "fortifyskill", skill = "acrobatics", mag = 5 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyskill", skill = "acrobatics", mag = 8 },
        { effect = "fortifyskill", skill = "sneak", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyskill", skill = "acrobatics", mag = 12 },
        { effect = "fortifyskill", skill = "sneak", mag = 18, condition = { kind = "time", value = "night" } },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Netch Leather",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "slowfall", mag = 10 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "slowfall", mag = 15 },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "slowfall", mag = 20 },
        { effect = "fortifyattribute", attribute = "speed", mag = 8, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Hide",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyskill", skill = "athletics", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyskill", skill = "athletics", mag = 18, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyattribute", attribute = "speed", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Fur",
    bonuses = {
      min = {
        { effect = "resistfrost", mag = 10 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "resistfrost", mag = 15 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistfrost", mag = 20 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "restorefatigue", mag = 3, dur = 1, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Bear Fur",
    bonuses = {
      min = {
        { effect = "resistfrost", mag = 10 },
      },
      mid = {
        { effect = "resistfrost", mag = 15 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistfrost", mag = 20 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyhealth", mag = 22, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Bearskin",
    bonuses = {
      min = {
        { effect = "resistfrost", mag = 10 },
        { effect = "fortifyattribute", attribute = "strength", mag = 3 },
      },
      mid = {
        { effect = "resistfrost", mag = 15 },
        { effect = "fortifyattribute", attribute = "strength", mag = 5 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistfrost", mag = 20 },
        { effect = "fortifyattribute", attribute = "strength", mag = 8 },
        { effect = "fortifyattack", mag = 16, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyhealth", mag = 22, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Wolf Fur",
    bonuses = {
      min = {
        { effect = "resistfrost", mag = 10 },
        { effect = "fortifyattribute", attribute = "speed", mag = 3 },
      },
      mid = {
        { effect = "resistfrost", mag = 15 },
        { effect = "fortifyattribute", attribute = "speed", mag = 5 },
        { effect = "nighteye", mag = 40, condition = { kind = "time", value = "night" } },
        { effect = "fortifyattack", mag = 8, condition = { { kind = "time", value = "night" }, { kind = "location", value = "exterior" } } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistfrost", mag = 20 },
        { effect = "fortifyattribute", attribute = "speed", mag = 8 },
        { effect = "nighteye", mag = 50, condition = { kind = "time", value = "night" } },
        { effect = "fortifyattack", mag = 12, condition = { { kind = "time", value = "night" }, { kind = "location", value = "exterior" } } },
        { effect = "fortifyskill", skill = "athletics", mag = 12 },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Chitin",
    bonuses = {
      min = {
        { effect = "resistblightdisease", mag = 10 },
        { effect = "resistpoison", mag = 10 },
      },
      mid = {
        { effect = "resistblightdisease", mag = 15 },
        { effect = "resistpoison", mag = 15 },
        { effect = "resistparalysis", mag = 15 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistblightdisease", mag = 20 },
        { effect = "resistpoison", mag = 20 },
        { effect = "resistparalysis", mag = 20 },
        { effect = "chameleon", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Glass",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
        { effect = "resistfire", mag = 10 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "resistfire", mag = 15 },
        { effect = "sanctuary", mag = 12, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "resistfire", mag = 20 },
        { effect = "sanctuary", mag = 16, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
        { effect = "chameleon", mag = 10 },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Padded",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "resistfrost", mag = 15 },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistfrost", mag = 20 },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "location", value = "interior" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Studded",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyskill", skill = "sneak", mag = 8, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyskill", skill = "sneak", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Cephalopod",
    bonuses = {
      min = {
        { effect = "swiftswim", mag = 20 },
        { effect = "waterbreathing", mag = 1 },
      },
      mid = {
        { effect = "swiftswim", mag = 30 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "sanctuary", mag = 7 },
      },
      max = {
        { effect = "swiftswim", mag = 40 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "sanctuary", mag = 10 },
        { effect = "chameleon", mag = 16, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "resistfrost", mag = 20 },
      },
    },
  },
  { name = "Newtscale",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "swiftswim", mag = 20 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "swiftswim", mag = 30 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "swiftswim", mag = 40 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "sanctuary", mag = 12, condition = { any = { { kind = "health", op = "<", value = 0.25, fraction = true }, { kind = "fatigue", op = "<", value = 0.5, fraction = true } } } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Resin Molded",
    bonuses = {
      min = {
        { effect = "resistblightdisease", mag = 10 },
      },
      mid = {
        { effect = "resistblightdisease", mag = 15 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "resistfire", mag = 15, condition = { kind = "sun", value = "up" } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistblightdisease", mag = 20 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistfire", mag = 22, condition = { kind = "sun", value = "up" } },
        { effect = "resistpoison", mag = 20 },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Scrap",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "luck", mag = 3 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "luck", mag = 5 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyattribute", attribute = "luck", mag = 8, condition = { any = { { kind = "health", op = "<", value = 0.25, fraction = true }, { kind = "fatigue", op = "<", value = 0.5, fraction = true } } } },
      },
      max = {
        { effect = "fortifyattribute", attribute = "luck", mag = 8 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyattribute", attribute = "luck", mag = 12, condition = { any = { { kind = "health", op = "<", value = 0.25, fraction = true }, { kind = "fatigue", op = "<", value = 0.5, fraction = true } } } },
        { effect = "resistnormalweapons", mag = 8, condition = { any = { { kind = "health", op = "<", value = 0.25, fraction = true }, { kind = "fatigue", op = "<", value = 0.5, fraction = true } } } },
      },
    },
  },
  { name = "Heavy Armor",
    bonuses = {
      min = {
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyhealth", mag = 15, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
      max = {
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyhealth", mag = 22, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyattribute", attribute = "endurance", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "Medium Armor",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "restorefatigue", mag = 3, dur = 1, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
      },
    },
  },
  { name = "Light Armor",
    bonuses = {
      min = {
        { effect = "fortifyskill", skill = "lightarmor", mag = 5 },
      },
      mid = {
        { effect = "fortifyskill", skill = "lightarmor", mag = 8 },
        { effect = "sanctuary", mag = 8, condition = { kind = "fatigue", op = ">", value = 0.75, fraction = true } },
      },
      max = {
        { effect = "fortifyskill", skill = "lightarmor", mag = 12 },
        { effect = "sanctuary", mag = 12, condition = { kind = "fatigue", op = ">", value = 0.75, fraction = true } },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
      },
    },
  },
  { name = "Cloth",
    bonuses = {
      min = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "feather", mag = 5 },
      },
      mid = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "feather", mag = 10 },
        { effect = "fortifyskill", skill = "alteration", mag = 12, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
        { effect = "weaknesstonormalweapons", mag = 10 },
      },
      max = {
        { effect = "restoremagicka", mag = 2, dur = 1 },
        { effect = "feather", mag = 15 },
        { effect = "fortifyskill", skill = "alteration", mag = 18, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
        { effect = "fortifyattribute", attribute = "willpower", mag = 12, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
        { effect = "weaknesstonormalweapons", mag = 20 },
      },
    },
  },
  { name = "Nordic",
    bonuses = {
      min = {
        { effect = "resistshock", mag = 10 },
      },
      mid = {
        { effect = "resistshock", mag = 15 },
        { effect = "resistfrost", mag = 10 },
      },
      max = {
        { effect = "resistshock", mag = 20 },
        { effect = "resistfrost", mag = 10 },
        { effect = "fortifyattack", mag = 10, condition = { kind = "race", value = "Nord" } },
      },
    },
  },
  { name = "Imperial",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "personality", mag = 3 },
        { effect = "fortifyskill", skill = "speechcraft", mag = 5 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "fortifyskill", skill = "speechcraft", mag = 8 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "fortifyskill", skill = "speechcraft", mag = 12 },
        { effect = "fortifyattack", mag = 10, condition = { kind = "race", value = "Imperial" } },
      },
    },
  },
  { name = "Colovian",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "endurance", mag = 3 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "endurance", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "fatigue", op = ">", value = 0.75, fraction = true } },
        { effect = "resistfrost", mag = 10 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "fatigue", op = ">", value = 0.75, fraction = true } },
        { effect = "resistfrost", mag = 10 },
      },
    },
  },
  { name = "Bosmer",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "fortifyskill", skill = "marksman", mag = 12, condition = { kind = "location", value = "exterior" } },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "fortifyskill", skill = "marksman", mag = 18, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyattack", mag = 10, condition = { kind = "race", value = "Wood Elf" } },
      },
    },
  },
  { name = "Khajiit",
    bonuses = {
      min = {
        { effect = "nighteye", mag = 25 },
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
      },
      mid = {
        { effect = "nighteye", mag = 40 },
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "fortifyskill", skill = "acrobatics", mag = 12, condition = { kind = "time", value = "night" } },
      },
      max = {
        { effect = "nighteye", mag = 50 },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "fortifyskill", skill = "acrobatics", mag = 18, condition = { kind = "time", value = "night" } },
        { effect = "fortifyskill", skill = "handtohand", mag = 18, condition = { kind = "time", value = "night" } },
        { effect = "fortifyattribute", attribute = "luck", mag = 8, condition = { kind = "race", value = "Khajiit" } },
      },
    },
  },
  { name = "Orsimer",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "endurance", mag = 3 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "endurance", mag = 5 },
        { effect = "resistmagicka", mag = 8 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "resistmagicka", mag = 12 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 12, condition = { kind = "race", value = "Orc" } },
      },
    },
  },
  { name = "Native",
    bonuses = {
      min = {
        { effect = "resistblightdisease", mag = 10 },
        { effect = "resistpoison", mag = 10 },
      },
      mid = {
        { effect = "resistblightdisease", mag = 15 },
        { effect = "resistpoison", mag = 15 },
        { effect = "fortifyskill", skill = "athletics", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistblightdisease", mag = 20 },
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyskill", skill = "athletics", mag = 18, condition = { kind = "location", value = "exterior" } },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Falmer",
    bonuses = {
      min = {
        { effect = "resistfrost", mag = 10 },
        { effect = "chameleon", mag = 5 },
      },
      mid = {
        { effect = "resistfrost", mag = 15 },
        { effect = "chameleon", mag = 12, condition = { kind = "sun", value = "down" } },
        { effect = "nighteye", mag = 40, condition = { kind = "sun", value = "down" } },
      },
      max = {
        { effect = "resistfrost", mag = 20 },
        { effect = "chameleon", mag = 16, condition = { kind = "sun", value = "down" } },
        { effect = "nighteye", mag = 50, condition = { kind = "sun", value = "down" } },
        { effect = "sanctuary", mag = 10 },
      },
    },
  },
  { name = "Fighters Guild",
    bonuses = {
      min = {
        { effect = "fortifyattack", mag = 3 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "fortifyattack", mag = 5 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyattribute", attribute = "strength", mag = 8, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
      max = {
        { effect = "fortifyattack", mag = 8 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyattribute", attribute = "strength", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "Mages Guild",
    bonuses = {
      min = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyskill", skill = "destruction", mag = 5 },
      },
      mid = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyskill", skill = "destruction", mag = 8 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 8, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
      },
      max = {
        { effect = "restoremagicka", mag = 2, dur = 1 },
        { effect = "fortifyskill", skill = "destruction", mag = 12 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 12, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
        { effect = "fortifymagicka", mag = 12, condition = { kind = "skill", op = ">=", id = "destruction", value = 50 } },
        { effect = "resistmagicka", mag = 12 },
      },
    },
  },
  { name = "Thieves Guild",
    bonuses = {
      min = {
        { effect = "fortifyskill", skill = "sneak", mag = 5 },
        { effect = "fortifyskill", skill = "security", mag = 5 },
      },
      mid = {
        { effect = "fortifyskill", skill = "sneak", mag = 8 },
        { effect = "fortifyskill", skill = "security", mag = 8 },
        { effect = "chameleon", mag = 12, condition = { { kind = "time", value = "night" }, { kind = "location", value = "interior" } } },
      },
      max = {
        { effect = "fortifyskill", skill = "sneak", mag = 12 },
        { effect = "fortifyskill", skill = "security", mag = 12 },
        { effect = "chameleon", mag = 16, condition = { { kind = "time", value = "night" }, { kind = "location", value = "interior" } } },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
      },
    },
  },
  { name = "Dark Brotherhood",
    bonuses = {
      min = {
        { effect = "fortifyskill", skill = "sneak", mag = 5 },
        { effect = "resistpoison", mag = 10 },
      },
      mid = {
        { effect = "fortifyskill", skill = "sneak", mag = 8 },
        { effect = "resistpoison", mag = 15 },
        { effect = "chameleon", mag = 12, condition = { kind = "time", value = "night" } },
      },
      max = {
        { effect = "fortifyskill", skill = "sneak", mag = 12 },
        { effect = "resistpoison", mag = 20 },
        { effect = "chameleon", mag = 16, condition = { kind = "time", value = "night" } },
        { effect = "fortifyattack", mag = 12, condition = { kind = "time", value = "night" } },
      },
    },
  },
  { name = "Morag Tong",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "fortifyskill", skill = "shortblade", mag = 5 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "fortifyskill", skill = "shortblade", mag = 8 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "location", value = "interior" } },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyskill", skill = "shortblade", mag = 12 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "location", value = "interior" } },
        { effect = "chameleon", mag = 12, condition = { kind = "location", value = "interior" } },
      },
    },
  },
  { name = "House Hlaalu",
    bonuses = {
      min = {
        { effect = "fortifyskill", skill = "mercantile", mag = 5 },
        { effect = "fortifyattribute", attribute = "personality", mag = 3 },
      },
      mid = {
        { effect = "fortifyskill", skill = "mercantile", mag = 8 },
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "fortifyskill", skill = "speechcraft", mag = 12, condition = { kind = "location", value = "interior" } },
      },
      max = {
        { effect = "fortifyskill", skill = "mercantile", mag = 12 },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "fortifyskill", skill = "speechcraft", mag = 18, condition = { kind = "location", value = "interior" } },
        { effect = "fortifyattribute", attribute = "luck", mag = 8 },
      },
    },
  },
  { name = "House Indoril",
    bonuses = {
      min = {
        { effect = "resistmagicka", mag = 5 },
        { effect = "fortifymagicka", mag = 8 },
      },
      mid = {
        { effect = "resistmagicka", mag = 8 },
        { effect = "fortifymagicka", mag = 12 },
        { effect = "turnundead", mag = 30, condition = { kind = "time", value = "night" } },
      },
      max = {
        { effect = "resistmagicka", mag = 12 },
        { effect = "fortifymagicka", mag = 18 },
        { effect = "turnundead", mag = 50, condition = { kind = "time", value = "night" } },
      },
    },
  },
  { name = "House Dres",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "fortifyskill", skill = "longblade", mag = 12, condition = { kind = "location", value = "exterior" } },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyskill", skill = "longblade", mag = 18, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
      },
    },
  },
  { name = "House Telvanni",
    bonuses = {
      min = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 3 },
      },
      mid = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 5 },
        { effect = "fortifyskill", skill = "mysticism", mag = 8 },
        { effect = "spellabsorption", mag = 8, condition = { kind = "magicka", op = "<", value = 0.25, fraction = true } },
      },
      max = {
        { effect = "restoremagicka", mag = 2, dur = 1 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 8 },
        { effect = "fortifyskill", skill = "mysticism", mag = 12 },
        { effect = "spellabsorption", mag = 12, condition = { kind = "magicka", op = "<", value = 0.25, fraction = true } },
        { effect = "fortifyskill", skill = "destruction", mag = 12, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "Templar",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "turnundead", mag = 10 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "turnundead", mag = 15 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "time", value = "day" } },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "turnundead", mag = 20 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "time", value = "day" } },
        { effect = "resistmagicka", mag = 12 },
      },
    },
  },
  { name = "Guard",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "time", value = "day" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "time", value = "day" } },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Royal Guard",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "resistmagicka", mag = 8 },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "resistmagicka", mag = 12 },
        { effect = "reflect", mag = 12, condition = { kind = "location", value = "interior" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Her Hand",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "fortifyattribute", attribute = "willpower", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyattribute", attribute = "willpower", mag = 5 },
        { effect = "restorehealth", mag = 2, dur = 1, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyattribute", attribute = "willpower", mag = 8 },
        { effect = "restorehealth", mag = 3, dur = 1, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        { effect = "sanctuary", mag = 12, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
      },
    },
  },
  { name = "Tribunal Temple",
    bonuses = {
      min = {
        { effect = "fortifyskill", skill = "restoration", mag = 5 },
        { effect = "fortifyattribute", attribute = "personality", mag = 3 },
      },
      mid = {
        { effect = "fortifyskill", skill = "restoration", mag = 8 },
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "restorehealth", mag = 2, dur = 1, condition = { kind = "location", value = "interior" } },
      },
      max = {
        { effect = "fortifyskill", skill = "restoration", mag = 12 },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "restorehealth", mag = 2, dur = 1, condition = { kind = "location", value = "interior" } },
        { effect = "turnundead", mag = 20 },
      },
    },
  },
  { name = "Artifacts",
    bonuses = {
      min = {
        { effect = "resistmagicka", mag = 5 },
        { effect = "fortifyattribute", attribute = "luck", mag = 3 },
      },
      mid = {
        { effect = "resistmagicka", mag = 8 },
        { effect = "fortifyattribute", attribute = "luck", mag = 5 },
        { effect = "spellabsorption", mag = 8, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
      },
      max = {
        { effect = "resistmagicka", mag = 12 },
        { effect = "fortifyattribute", attribute = "luck", mag = 8 },
        { effect = "spellabsorption", mag = 12, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        { effect = "reflect", mag = 12, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        { effect = "fortifymagicka", mag = 12, condition = { kind = "level", op = ">=", value = 20 } },
      },
    },
  },
  { name = "Master",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "luck", mag = 3 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "luck", mag = 5 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "sanctuary", mag = 12, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
      },
      max = {
        { effect = "fortifyattribute", attribute = "luck", mag = 8 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "sanctuary", mag = 16, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        { effect = "fortifyattack", mag = 12, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        { effect = "fortifyattack", mag = 8, condition = { kind = "level", op = ">=", value = 25 } },
      },
    },
  },
  { name = "Dragonscale",
    bonuses = {
      min = {
        { effect = "resistfire", mag = 10 },
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
      },
      mid = {
        { effect = "resistfire", mag = 15 },
        { effect = "resistmagicka", mag = 8 },
        { effect = "sanctuary", mag = 8, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistfire", mag = 20 },
        { effect = "resistmagicka", mag = 12 },
        { effect = "sanctuary", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Embossed",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "personality", mag = 3 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "fortifyskill", skill = "speechcraft", mag = 12, condition = { kind = "location", value = "interior" } },
      },
      max = {
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "fortifyskill", skill = "speechcraft", mag = 18, condition = { kind = "location", value = "interior" } },
        { effect = "fortifyattribute", attribute = "luck", mag = 8 },
      },
    },
  },
  { name = "Engraved",
    bonuses = {
      min = {
        { effect = "resistmagicka", mag = 5 },
      },
      mid = {
        { effect = "resistmagicka", mag = 8 },
        { effect = "spellabsorption", mag = 8, condition = { kind = "magicka", op = "<", value = 0.25, fraction = true } },
      },
      max = {
        { effect = "resistmagicka", mag = 12 },
        { effect = "spellabsorption", mag = 12, condition = { kind = "magicka", op = "<", value = 0.25, fraction = true } },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
      },
    },
  },
  { name = "Kynareth",
    bonuses = {
      min = {
        { effect = "slowfall", mag = 10 },
        { effect = "resistshock", mag = 10 },
      },
      mid = {
        { effect = "slowfall", mag = 15 },
        { effect = "resistshock", mag = 15 },
        { effect = "fortifyattribute", attribute = "speed", mag = 8, condition = { kind = "location", value = "exterior" } },
      },
      max = {
        { effect = "slowfall", mag = 20 },
        { effect = "resistshock", mag = 20 },
        { effect = "fortifyattribute", attribute = "speed", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "location", value = "exterior" } },
      },
    },
  },
  { name = "Alessian Bronze",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistmagicka", mag = 5 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistmagicka", mag = 8 },
        { effect = "turnundead", mag = 30, condition = { kind = "sun", value = "up" } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistmagicka", mag = 12 },
        { effect = "turnundead", mag = 50, condition = { kind = "sun", value = "up" } },
        { effect = "fortifyattack", mag = 8 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Alit Hide",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
        { effect = "resistpoison", mag = 10 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "resistpoison", mag = 15 },
        { effect = "fortifyattribute", attribute = "speed", mag = 8, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyattribute", attribute = "speed", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyattack", mag = 8, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Altmer",
    bonuses = {
      min = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 3 },
      },
      mid = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 5 },
        { effect = "fortifyskill", skill = "destruction", mag = 12, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
        { effect = "weaknesstomagicka", mag = 10 },
      },
      max = {
        { effect = "restoremagicka", mag = 2, dur = 1 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 8 },
        { effect = "fortifyskill", skill = "destruction", mag = 18, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
        { effect = "fortifyattribute", attribute = "willpower", mag = 12, condition = { kind = "race", value = "High Elf" } },
        { effect = "weaknesstomagicka", mag = 20 },
      },
    },
  },
  { name = "Ancient Nordic",
    bonuses = {
      min = {
        { effect = "resistfrost", mag = 10 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "resistfrost", mag = 15 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "turnundead", mag = 30, condition = { kind = "time", value = "night" } },
      },
      max = {
        { effect = "resistfrost", mag = 20 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "turnundead", mag = 50, condition = { kind = "time", value = "night" } },
      },
    },
  },
  { name = "Anvil",
    bonuses = {
      min = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 20 },
      },
      mid = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 30 },
        { effect = "resistfrost", mag = 15 },
      },
      max = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 40 },
        { effect = "resistfrost", mag = 20 },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "location", value = "exterior" } },
      },
    },
  },
  { name = "Argonian",
    bonuses = {
      min = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "resistpoison", mag = 10 },
      },
      mid = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "resistpoison", mag = 15 },
        { effect = "resistcommondisease", mag = 15 },
        { effect = "swiftswim", mag = 30 },
      },
      max = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "resistpoison", mag = 20 },
        { effect = "resistcommondisease", mag = 20 },
        { effect = "swiftswim", mag = 40 },
        { effect = "restorehealth", mag = 2, dur = 1, condition = { kind = "race", value = "Argonian" } },
      },
    },
  },
  { name = "Ayleid",
    bonuses = {
      min = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "light", mag = 8 },
      },
      mid = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "spellabsorption", mag = 8, condition = { { kind = "time", value = "night" }, { kind = "location", value = "exterior" } } },
      },
      max = {
        { effect = "restoremagicka", mag = 2, dur = 1 },
        { effect = "spellabsorption", mag = 12, condition = { { kind = "time", value = "night" }, { kind = "location", value = "exterior" } } },
        { effect = "resistmagicka", mag = 12 },
      },
    },
  },
  { name = "Bal-Darum",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "strength", mag = 3 },
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "strength", mag = 5 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyskill", skill = "armorer", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
      max = {
        { effect = "fortifyattribute", attribute = "strength", mag = 8 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyskill", skill = "armorer", mag = 18, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "Breton",
    bonuses = {
      min = {
        { effect = "resistmagicka", mag = 5 },
      },
      mid = {
        { effect = "resistmagicka", mag = 8 },
        { effect = "spellabsorption", mag = 5 },
      },
      max = {
        { effect = "resistmagicka", mag = 12 },
        { effect = "spellabsorption", mag = 8 },
        { effect = "fortifyskill", skill = "conjuration", mag = 12, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
        { effect = "fortifyattribute", attribute = "willpower", mag = 8, condition = { kind = "race", value = "Breton" } },
      },
    },
  },
  { name = "Cataphract",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "fortifyattack", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyattack", mag = 5 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyattack", mag = 8 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "fatigue", op = ">", value = 0.75, fraction = true } },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Chap-thil",
    bonuses = {
      min = {
        { effect = "resistfire", mag = 10 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "resistfire", mag = 15 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "resistparalysis", mag = 15 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistfire", mag = 20 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistparalysis", mag = 20 },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "sun", value = "up" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Chev-Aram",
    bonuses = {
      min = {
        { effect = "fortifyattack", mag = 3 },
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
      },
      mid = {
        { effect = "fortifyattack", mag = 5 },
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "sanctuary", mag = 8, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
      },
      max = {
        { effect = "fortifyattack", mag = 8 },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "sanctuary", mag = 12, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
        { effect = "fortifyhealth", mag = 18 },
      },
    },
  },
  { name = "Chuzei",
    bonuses = {
      min = {
        { effect = "fortifyattack", mag = 3 },
        { effect = "fortifyattribute", attribute = "personality", mag = 3 },
      },
      mid = {
        { effect = "fortifyattack", mag = 5 },
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "fortifyattack", mag = 8 },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Colovian Leather",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "fortifyskill", skill = "sneak", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "fortifyskill", skill = "sneak", mag = 18, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyskill", skill = "acrobatics", mag = 12 },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Companions",
    bonuses = {
      min = {
        { effect = "fortifyattack", mag = 3 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "fortifyattack", mag = 5 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyhealth", mag = 15, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
      max = {
        { effect = "fortifyattack", mag = 8 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyhealth", mag = 22, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
      },
    },
  },
  { name = "Crown Guard",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "location", value = "interior" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "location", value = "interior" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Daedric Hide",
    bonuses = {
      min = {
        { effect = "spellabsorption", mag = 3 },
      },
      mid = {
        { effect = "spellabsorption", mag = 3 },
        { effect = "sanctuary", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "spellabsorption", mag = 3 },
        { effect = "sanctuary", mag = 16, condition = { kind = "time", value = "night" } },
        { effect = "restoremagicka", mag = 2, dur = 1, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Domina",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "personality", mag = 3 },
        { effect = "fortifyattack", mag = 3 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "fortifyattack", mag = 5 },
        { effect = "fortifyhealth", mag = 12 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "fortifyattack", mag = 8 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "sanctuary", mag = 12, condition = { kind = "attribute", op = ">=", id = "personality", value = 60 } },
      },
    },
  },
  { name = "Dunmer",
    bonuses = {
      min = {
        { effect = "resistfire", mag = 10 },
      },
      mid = {
        { effect = "resistfire", mag = 10 },
        { effect = "fortifyattribute", attribute = "willpower", mag = 3 },
      },
      max = {
        { effect = "resistfire", mag = 10 },
        { effect = "fortifyattribute", attribute = "willpower", mag = 3 },
        { effect = "fortifyattack", mag = 10, condition = { kind = "race", value = "Dark Elf" } },
      },
    },
  },
  { name = "Ebonweave",
    bonuses = {
      min = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "resistmagicka", mag = 8 },
        { effect = "spellabsorption", mag = 8, condition = { kind = "magicka", op = "<", value = 0.25, fraction = true } },
      },
      max = {
        { effect = "restoremagicka", mag = 2, dur = 1 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistmagicka", mag = 12 },
        { effect = "spellabsorption", mag = 12, condition = { kind = "magicka", op = "<", value = 0.25, fraction = true } },
      },
    },
  },
  { name = "Falkreath Guard",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistfrost", mag = 10 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistfrost", mag = 15 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "time", value = "day" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistfrost", mag = 20 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "time", value = "day" } },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Gah'Kogo",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
      },
      mid = {
        { effect = "resistpoison", mag = 10 },
        { effect = "resistparalysis", mag = 15 },
        { effect = "fortifyattribute", attribute = "agility", mag = 8, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistpoison", mag = 10 },
        { effect = "resistparalysis", mag = 20 },
        { effect = "fortifyattribute", attribute = "agility", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "fortifyskill", skill = "sneak", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Gilded Glass",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
        { effect = "fortifyattribute", attribute = "personality", mag = 3 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "resistfire", mag = 15 },
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "sanctuary", mag = 8, condition = { kind = "location", value = "interior" } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "resistfire", mag = 20 },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "sanctuary", mag = 12, condition = { kind = "location", value = "interior" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Gold",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "personality", mag = 3 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "fortifyskill", skill = "mercantile", mag = 12, condition = { kind = "location", value = "interior" } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "fortifyskill", skill = "mercantile", mag = 18, condition = { kind = "location", value = "interior" } },
        { effect = "resistmagicka", mag = 12 },
        { effect = "fortifyattribute", attribute = "luck", mag = 8 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Golden Saint",
    bonuses = {
      min = {
        { effect = "resistmagicka", mag = 5 },
        { effect = "spellabsorption", mag = 3 },
      },
      mid = {
        { effect = "resistmagicka", mag = 8 },
        { effect = "spellabsorption", mag = 5 },
        { effect = "reflect", mag = 8, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistmagicka", mag = 12 },
        { effect = "spellabsorption", mag = 8 },
        { effect = "reflect", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyattack", mag = 8 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Guar Hide",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
        { effect = "resistblightdisease", mag = 10 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "resistblightdisease", mag = 15 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 5 },
        { effect = "feather", mag = 10, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistblightdisease", mag = 20 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "feather", mag = 15, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyskill", skill = "athletics", mag = 12 },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "House Direnni",
    bonuses = {
      min = {
        { effect = "resistmagicka", mag = 5 },
        { effect = "restoremagicka", mag = 1, dur = 1 },
      },
      mid = {
        { effect = "resistmagicka", mag = 8 },
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "spellabsorption", mag = 5 },
      },
      max = {
        { effect = "resistmagicka", mag = 12 },
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "spellabsorption", mag = 8 },
        { effect = "reflect", mag = 8, condition = { kind = "magicka", op = ">", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "House Redoran",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistblightdisease", mag = 10 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistblightdisease", mag = 10 },
        { effect = "fortifyskill", skill = "spear", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistblightdisease", mag = 10 },
        { effect = "fortifyskill", skill = "spear", mag = 18, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
      },
    },
  },
  { name = "Kagouti Hide",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "speed", mag = 3 },
        { effect = "fortifyskill", skill = "athletics", mag = 5 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "speed", mag = 5 },
        { effect = "fortifyskill", skill = "athletics", mag = 8 },
        { effect = "resistpoison", mag = 15 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "speed", mag = 8 },
        { effect = "fortifyskill", skill = "athletics", mag = 12 },
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Kalantar",
    bonuses = {
      min = {
        { effect = "resistfire", mag = 10 },
        { effect = "fortifyattack", mag = 3 },
      },
      mid = {
        { effect = "resistfire", mag = 15 },
        { effect = "fortifyattack", mag = 5 },
        { effect = "fortifyattribute", attribute = "strength", mag = 5 },
      },
      max = {
        { effect = "resistfire", mag = 20 },
        { effect = "fortifyattack", mag = 8 },
        { effect = "fortifyattribute", attribute = "strength", mag = 8 },
        { effect = "fortifyhealth", mag = 15, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "Klibanion",
    bonuses = {
      min = {
        { effect = "resistnormalweapons", mag = 3 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 3 },
      },
      mid = {
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 5 },
        { effect = "fortifyhealth", mag = 15, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "fortifyhealth", mag = 22, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Kragen",
    bonuses = {
      min = {
        { effect = "fortifyskill", skill = "mercantile", mag = 5 },
        { effect = "fortifyattribute", attribute = "luck", mag = 3 },
      },
      mid = {
        { effect = "fortifyskill", skill = "mercantile", mag = 8 },
        { effect = "fortifyattribute", attribute = "luck", mag = 5 },
        { effect = "fortifyskill", skill = "mercantile", mag = 12, condition = { kind = "location", value = "interior" } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "fortifyskill", skill = "mercantile", mag = 12 },
        { effect = "fortifyattribute", attribute = "luck", mag = 8 },
        { effect = "fortifyskill", skill = "mercantile", mag = 18, condition = { kind = "location", value = "interior" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Kvetchi",
    bonuses = {
      min = {
        { effect = "resistblightdisease", mag = 10 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "resistblightdisease", mag = 15 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "resistpoison", mag = 15 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistblightdisease", mag = 20 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistpoison", mag = 20 },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Lamellar",
    bonuses = {
      min = {
        { effect = "resistnormalweapons", mag = 3 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyhealth", mag = 15, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Mananaut",
    bonuses = {
      min = {
        { effect = "resistshock", mag = 10 },
        { effect = "waterbreathing", mag = 1 },
      },
      mid = {
        { effect = "resistshock", mag = 15 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 5 },
        { effect = "slowfall", mag = 15 },
      },
      max = {
        { effect = "resistshock", mag = 20 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "fortifyattribute", attribute = "intelligence", mag = 8 },
        { effect = "slowfall", mag = 20 },
        { effect = "reflect", mag = 12, condition = { kind = "sun", value = "down" } },
      },
    },
  },
  { name = "Manatee Leather",
    bonuses = {
      min = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 20 },
      },
      mid = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 30 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 40 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistfrost", mag = 20 },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Maormer",
    bonuses = {
      min = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 20 },
      },
      mid = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 30 },
        { effect = "resistshock", mag = 15 },
      },
      max = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "swiftswim", mag = 40 },
        { effect = "resistshock", mag = 20 },
        { effect = "chameleon", mag = 16, condition = { kind = "time", value = "night" } },
      },
    },
  },
  { name = "Maradlai",
    bonuses = {
      min = {
        { effect = "fortifyattribute", attribute = "speed", mag = 3 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "fortifyattribute", attribute = "speed", mag = 5 },
        { effect = "fortifyfatigue", mag = 20 },
      },
      max = {
        { effect = "fortifyattribute", attribute = "speed", mag = 8 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "sanctuary", mag = 12, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "Militia",
    bonuses = {
      min = {
        { effect = "fortifyfatigue", mag = 12 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "time", value = "day" } },
        { effect = "restorehealth", mag = 1, dur = 1, condition = { kind = "level", op = "<", value = 10 } },
      },
      max = {
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "time", value = "day" } },
        { effect = "restorehealth", mag = 1, dur = 1, condition = { kind = "level", op = "<", value = 10 } },
      },
    },
  },
  { name = "Molecrab",
    bonuses = {
      min = {
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "sanctuary", mag = 8, condition = { any = { { kind = "location", value = "interior" }, { kind = "time", value = "night" } } } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "sanctuary", mag = 12, condition = { any = { { kind = "location", value = "interior" }, { kind = "time", value = "night" } } } },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Narsis Watch",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "time", value = "day" } },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "time", value = "day" } },
        { effect = "fortifyskill", skill = "mercantile", mag = 12 },
      },
    },
  },
  { name = "Navy",
    bonuses = {
      min = {
        { effect = "swiftswim", mag = 20 },
        { effect = "waterbreathing", mag = 1 },
      },
      mid = {
        { effect = "swiftswim", mag = 30 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "resistfrost", mag = 15 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "location", value = "exterior" } },
      },
      max = {
        { effect = "swiftswim", mag = 40 },
        { effect = "waterbreathing", mag = 1 },
        { effect = "resistfrost", mag = 20 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyfatigue", mag = 28 },
      },
    },
  },
  { name = "Necrom Guard",
    bonuses = {
      min = {
        { effect = "turnundead", mag = 10 },
        { effect = "resistmagicka", mag = 5 },
      },
      mid = {
        { effect = "turnundead", mag = 15 },
        { effect = "resistmagicka", mag = 8 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "turnundead", mag = 20, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "turnundead", mag = 20 },
        { effect = "resistmagicka", mag = 12 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "turnundead", mag = 30, condition = { kind = "time", value = "night" } },
        { effect = "fortifyskill", skill = "restoration", mag = 12 },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Nibenese",
    bonuses = {
      min = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyskill", skill = "mercantile", mag = 5 },
      },
      mid = {
        { effect = "restoremagicka", mag = 1, dur = 1 },
        { effect = "fortifyskill", skill = "mercantile", mag = 8 },
        { effect = "resistmagicka", mag = 8 },
      },
      max = {
        { effect = "restoremagicka", mag = 2, dur = 1 },
        { effect = "fortifyskill", skill = "mercantile", mag = 12 },
        { effect = "resistmagicka", mag = 12 },
        { effect = "fortifyattribute", attribute = "personality", mag = 8, condition = { kind = "race", value = "Imperial" } },
      },
    },
  },
  { name = "Oloman",
    bonuses = {
      min = {
        { effect = "resistfire", mag = 10 },
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "resistfire", mag = 15 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
      max = {
        { effect = "resistfire", mag = 20 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "Quey Chitin",
    bonuses = {
      min = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "resistpoison", mag = 10 },
      },
      mid = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "resistpoison", mag = 15 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "resistpoison", mag = 20 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "swiftswim", mag = 60, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Reach",
    bonuses = {
      min = {
        { effect = "resistfrost", mag = 10 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 3 },
      },
      mid = {
        { effect = "resistfrost", mag = 15 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 5 },
        { effect = "fortifyattack", mag = 5 },
        { effect = "spellabsorption", mag = 8, condition = { kind = "time", value = "night" } },
      },
      max = {
        { effect = "resistfrost", mag = 20 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "fortifyattack", mag = 8 },
        { effect = "spellabsorption", mag = 12, condition = { kind = "time", value = "night" } },
      },
    },
  },
  { name = "Reach Royal Guard",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistfrost", mag = 10 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistfrost", mag = 15 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistfrost", mag = 20 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Red Dome Templar",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistmagicka", mag = 5 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistmagicka", mag = 8 },
        { effect = "turnundead", mag = 15 },
        { effect = "restorehealth", mag = 2, dur = 1, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistmagicka", mag = 12 },
        { effect = "turnundead", mag = 20 },
        { effect = "restorehealth", mag = 3, dur = 1, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
        { effect = "fortifyskill", skill = "restoration", mag = 12 },
      },
    },
  },
  { name = "Redguard",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 3 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyattribute", attribute = "agility", mag = 8, condition = { kind = "race", value = "Redguard" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Redguard Iron Lamellar",
    bonuses = {
      min = {
        { effect = "resistnormalweapons", mag = 3 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyattack", mag = 5 },
        { effect = "weaknesstoshock", mag = 10 },
      },
      max = {
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyattack", mag = 8 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "weaknesstoshock", mag = 20 },
      },
    },
  },
  { name = "Reman",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "fortifyattack", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyattack", mag = 5 },
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyattack", mag = 8 },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattack", mag = 16, condition = { kind = "health", op = "<", value = 0.25, fraction = true } },
      },
    },
  },
  { name = "Rihad Guard",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "sun", value = "up" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "sun", value = "up" } },
        { effect = "fortifyattribute", attribute = "endurance", mag = 8 },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Riverwatch",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "waterwalking", mag = 1 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "waterwalking", mag = 1 },
        { effect = "resistnormalweapons", mag = 5 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "waterwalking", mag = 1 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "resistblightdisease", mag = 20 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "location", value = "exterior" } },
      },
    },
  },
  { name = "Rourken",
    bonuses = {
      min = {
        { effect = "resistshock", mag = 10 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "resistshock", mag = 15 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "reflect", mag = 8, condition = { kind = "location", value = "interior" } },
      },
      max = {
        { effect = "resistshock", mag = 20 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "reflect", mag = 12, condition = { kind = "location", value = "interior" } },
      },
    },
  },
  { name = "Sacred Lands",
    bonuses = {
      min = {
        { effect = "resistmagicka", mag = 5 },
        { effect = "fortifyhealth", mag = 8 },
      },
      mid = {
        { effect = "resistmagicka", mag = 8 },
        { effect = "fortifyhealth", mag = 12 },
        { effect = "fortifyskill", skill = "restoration", mag = 8 },
        { effect = "restorehealth", mag = 2, dur = 1, condition = { kind = "location", value = "exterior" } },
      },
      max = {
        { effect = "resistmagicka", mag = 12 },
        { effect = "fortifyhealth", mag = 18 },
        { effect = "fortifyskill", skill = "restoration", mag = 12 },
        { effect = "restorehealth", mag = 2, dur = 1, condition = { kind = "location", value = "exterior" } },
        { effect = "turnundead", mag = 20 },
      },
    },
  },
  { name = "Saliache",
    bonuses = {
      min = {
        { effect = "resistblightdisease", mag = 10 },
        { effect = "fortifyskill", skill = "athletics", mag = 5 },
      },
      mid = {
        { effect = "resistblightdisease", mag = 15 },
        { effect = "fortifyskill", skill = "athletics", mag = 8 },
        { effect = "resistpoison", mag = 15 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistblightdisease", mag = 20 },
        { effect = "fortifyskill", skill = "athletics", mag = 12 },
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyattribute", attribute = "agility", mag = 12, condition = { kind = "health", op = ">", value = 0.75, fraction = true } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Shellmold",
    bonuses = {
      min = {
        { effect = "resistnormalweapons", mag = 3 },
        { effect = "resistshock", mag = 10 },
      },
      mid = {
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "resistshock", mag = 15 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "resistshock", mag = 20 },
        { effect = "fortifyhealth", mag = 15, condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Shinathi Chitin",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "resistblightdisease", mag = 10 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "resistblightdisease", mag = 15 },
        { effect = "resistparalysis", mag = 15 },
        { effect = "fortifyskill", skill = "sneak", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "resistblightdisease", mag = 20 },
        { effect = "resistparalysis", mag = 20 },
        { effect = "fortifyskill", skill = "sneak", mag = 18, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Shipal-Arai",
    bonuses = {
      min = {
        { effect = "fortifyskill", skill = "spear", mag = 5 },
        { effect = "fortifyattribute", attribute = "agility", mag = 3 },
      },
      mid = {
        { effect = "fortifyskill", skill = "spear", mag = 8 },
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "resistparalysis", mag = 15 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "fortifyskill", skill = "spear", mag = 12 },
        { effect = "fortifyattribute", attribute = "agility", mag = 8 },
        { effect = "resistparalysis", mag = 20 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Skingrad",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "resistcommondisease", mag = 10 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "resistcommondisease", mag = 15 },
        { effect = "fortifyattribute", attribute = "personality", mag = 5 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "time", value = "night" } },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "resistcommondisease", mag = 20 },
        { effect = "fortifyattribute", attribute = "personality", mag = 8 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "resistmagicka", mag = 12 },
      },
    },
  },
  { name = "Sutch Mail",
    bonuses = {
      min = {
        { effect = "fortifyhealth", mag = 8 },
        { effect = "resistnormalweapons", mag = 3 },
      },
      mid = {
        { effect = "fortifyhealth", mag = 12 },
        { effect = "resistnormalweapons", mag = 5 },
        { effect = "fortifyattack", mag = 5 },
      },
      max = {
        { effect = "fortifyhealth", mag = 18 },
        { effect = "resistnormalweapons", mag = 8 },
        { effect = "fortifyattack", mag = 8 },
        { effect = "restorefatigue", mag = 2, dur = 1, condition = { kind = "fatigue", op = "<", value = 0.5, fraction = true } },
      },
    },
  },
  { name = "Thirr",
    bonuses = {
      min = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "fortifyattribute", attribute = "strength", mag = 3 },
      },
      mid = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "fortifyattribute", attribute = "strength", mag = 5 },
        { effect = "swiftswim", mag = 30 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "waterbreathing", mag = 1 },
        { effect = "fortifyattribute", attribute = "strength", mag = 8 },
        { effect = "swiftswim", mag = 40 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "time", value = "day" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
  { name = "Toadscale",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "resistfrost", mag = 10 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "resistfrost", mag = 15 },
        { effect = "resistcommondisease", mag = 15 },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "resistfrost", mag = 20 },
        { effect = "resistcommondisease", mag = 20 },
        { effect = "sanctuary", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Watchman",
    bonuses = {
      min = {
        { effect = "nighteye", mag = 25 },
        { effect = "fortifyfatigue", mag = 12 },
      },
      mid = {
        { effect = "nighteye", mag = 40 },
        { effect = "fortifyfatigue", mag = 20 },
        { effect = "fortifyattack", mag = 8, condition = { kind = "time", value = "night" } },
      },
      max = {
        { effect = "nighteye", mag = 50 },
        { effect = "fortifyfatigue", mag = 28 },
        { effect = "fortifyattack", mag = 12, condition = { kind = "time", value = "night" } },
        { effect = "detectanimal", mag = 50 },
      },
    },
  },
  { name = "Wenbone",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
        { effect = "fortifyskill", skill = "marksman", mag = 5 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "fortifyskill", skill = "marksman", mag = 8 },
        { effect = "fortifyattribute", attribute = "agility", mag = 5 },
        { effect = "fortifyskill", skill = "sneak", mag = 12, condition = { kind = "location", value = "exterior" } },
        { effect = "weaknesstofire", mag = 10 },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "fortifyskill", skill = "marksman", mag = 12 },
        { effect = "fortifyskill", skill = "sneak", mag = 18, condition = { kind = "location", value = "exterior" } },
        { effect = "fortifyattack", mag = 8, condition = { kind = "skill", op = ">=", id = "marksman", value = 50 } },
        { effect = "weaknesstofire", mag = 20 },
      },
    },
  },
  { name = "Wormmouth",
    bonuses = {
      min = {
        { effect = "resistpoison", mag = 10 },
      },
      mid = {
        { effect = "resistpoison", mag = 15 },
        { effect = "resistblightdisease", mag = 15 },
        { effect = "weaknesstofrost", mag = 10 },
      },
      max = {
        { effect = "resistpoison", mag = 20 },
        { effect = "resistblightdisease", mag = 20 },
        { effect = "resistparalysis", mag = 20 },
        { effect = "fortifyattribute", attribute = "agility", mag = 8, condition = { kind = "time", value = "night" } },
        { effect = "weaknesstofrost", mag = 20 },
      },
    },
  },
}
