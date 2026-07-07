# Set Bonus — Mod Author Interop (OpenMW)

The OpenMW port is a framework too: other mods can register their own armour
"set bonuses" and have the base mod build and manage the spells for them. This
mirrors the MWSE interop API, adapted to OpenMW's Lua.

There are two ways to hook in. Use whichever fits your mod:

1. **Interface** — `I.SetBonus`, from a **global** script. Cleanest, and gives you
   query functions and return values.
2. **Global events** — `core.sendGlobalEvent('SetBonus_registerSet', {...})`, from
   **any** script type. Use this if your mod only ships local/player scripts. The
   payload is the same data table you'd pass to the interface.

Spell records can only be created by a global script, so the framework itself is
global — that's why the interface lives in the global context.

## Requirements

OpenMW **0.51+** and the Set Bonus mod (`setbonus.omwscripts`) enabled.

## Quick start (interface)

```lua
-- your global script, e.g. scripts/MyMod/setbonus.lua
local I = require('openmw.interfaces')
local done = false

return {
    engineHandlers = {
        onUpdate = function()
            if done then return end
            if not (I.SetBonus and I.SetBonus.registerSet) then return end  -- load-order safe
            I.SetBonus.registerSet{
                name  = 'My Dwarven Set',
                items = { 'my_dwrv_helm', 'my_dwrv_cuirass', 'my_dwrv_greaves',
                          'my_dwrv_boots', 'my_dwrv_pauldron_l', 'my_dwrv_pauldron_r' },
                bonuses = {
                    min = { { effect = 'resistshock', mag = 10 } },
                    mid = { { effect = 'resistshock', mag = 15 }, { effect = 'reflect', mag = 5 } },
                    max = {
                        { effect = 'resistshock',    mag = 20 },
                        { effect = 'reflect',        mag = 8  },
                        { effect = 'fortifyskill',   skill = 'armorer', mag = 12 },
                        { effect = 'restorefatigue', mag = 2, dur = 1 },
                    },
                },
                -- thresholds = { min = 2, mid = 4, max = 6 },  -- optional (defaults shown)
            }
            done = true
        end,
    },
}
```

Register it in your `.omwscripts`:

```
GLOBAL: scripts/MyMod/setbonus.lua
```

A complete, drop-in copy of this lives in the **`OpenMW_SetBonus_Example`** folder.

## Set data format

`registerSet(setData)` where `setData` has:

| Field        | Required | Description |
|--------------|----------|-------------|
| `name`       | yes      | Unique set name (also the lookup key, case-insensitive). |
| `items`      | yes      | Array of item record ids (lowercased internally, deduped). |
| `bonuses`    | yes      | `{ min = {...}, mid = {...}, max = {...} }` — arrays of effect entries. |
| `thresholds` | no       | `{ min = 2, mid = 4, max = 6 }`. Missing tiers default to 2/4/6. |

Each effect entry:

| Field       | Required | Description |
|-------------|----------|-------------|
| `effect`    | yes      | OpenMW MagicEffectId, **lowercase** (e.g. `"resistfire"`, `"weaknesstoshock"`, `"fortifyattack"`). |
| `mag`       | yes      | Magnitude (whole number). |
| `skill`     | no       | Lowercase skill id, for Fortify/Damage/Drain **Skill** effects (e.g. `"armorer"`). |
| `attribute` | no       | Lowercase attribute id, for Fortify/Damage/Drain **Attribute** effects (e.g. `"strength"`). |
| `dur`       | no       | `1` for over-time effects (`restorehealth`/`restoremagicka`/`restorefatigue`); omit/`0` otherwise. |

Notes:

- Effect ids are the OpenMW lowercase forms. A few differ from the MWSE camelCase
  names — e.g. `fortifyAttackBonus` → `fortifyattack`, weaknesses are
  `weaknesstofire` / `weaknesstoshock` / `weaknesstomagicka` / etc.
- Up to 8 effects per tier.

## Other interface functions

```lua
I.SetBonus.amendSet('Iron', {                                        -- additively amend an existing set
    items      = { 'my_iron_helm' },
    bonuses    = { max = { { effect = 'fortifyattribute', attribute = 'endurance', mag = 5 } } },
    thresholds = { max = 5 },
})
I.SetBonus.addItems('Iron', { 'my_iron_helm', 'my_iron_cuirass' })  -- add items to an existing set
I.SetBonus.registerSetLink{ item = 'my_iron_shield', set = 'Iron' }  -- link one item to a set
I.SetBonus.getSet('Iron')             -- the set table, or nil
I.SetBonus.getSets()                  -- array of all registered sets
I.SetBonus.getSetsForItem('my_iron_helm')  -- array of set names for an item, or nil
I.SetBonus.isItemInSet('my_iron_helm', 'Iron')  -- boolean
I.SetBonus.benefitScale()             -- current benefit multiplier (1.0 = default)
I.SetBonus.drawbackScale()            -- current weakness multiplier (0 = drawbacks off)
I.SetBonus.version                    -- interface version (2)
```

### Batch registration (interface v2+)

`registerSets(list)` registers or replaces **many** sets in one call — one
spell-build pass and a single actor recompute at the end, instead of one full
recompute per `registerSet`. Use it whenever you touch more than a handful of
sets at once (the Conditional Rebalance submodule re-registers all 136 this
way). The payload is simply an array of the same tables `registerSet` takes;
invalid entries are skipped with a log line and the rest still apply. Returns
the number of sets applied.

```lua
if I.SetBonus.version >= 2 then
    I.SetBonus.registerSets{ setA, setB, setC }
else
    for _, s in ipairs({ setA, setB, setC }) do I.SetBonus.registerSet(s) end
end
```

## Event equivalents (any script type)

```lua
local core = require('openmw.core')
core.sendGlobalEvent('SetBonus_registerSet', { name = 'My Set', items = {...}, bonuses = {...} })
core.sendGlobalEvent('SetBonus_registerSets', { sets = { {...}, {...} } })  -- batch (v2+)
core.sendGlobalEvent('SetBonus_addItems', { name = 'Iron', items = { 'my_iron_helm' } })
core.sendGlobalEvent('SetBonus_registerSetLink', { item = 'my_iron_shield', set = 'Iron' })
```

Events carry plain data only (no functions), so they serialize fine.

Sets you register or modify through the interop are automatically pushed to
player scripts (`SetBonus_syncSets`), so the Inventory Extender tooltip shows
your definitions too — you don't need to do anything for that.

## Timing & load order

- The framework builds its own sets on the first frame (`onUpdate`). Sets you
  register **before** that are picked up in the same build pass; sets you register
  **after** are built and applied to active actors immediately.
- Because you can't know whether the framework's global script has loaded yet,
  guard interface calls with `if I.SetBonus and I.SetBonus.registerSet then ...`
  and register from `onUpdate` (as in the example). The event API is inherently
  safe here — events queue until the handler exists.
- Registering a set whose `name` already exists **replaces** that definition —
  see *Amend vs replace* below.

## Amend vs replace

You get to decide whether to add to a set or redefine it:

- **`registerSet{ name = 'Iron', ... }`** with an existing name **fully replaces**
  that set (items, bonuses, thresholds). Registering it with empty `items` and
  `bonuses` is a clean way to **disable** a set you don't want — including the
  base mod's own sets:
  ```lua
  I.SetBonus.registerSet{ name = 'Iron', items = {}, bonuses = {} }  -- turn Iron off
  ```
- **`amendSet('Iron', patch)`** is **additive** — it appends items and bonus
  effects (per tier, capped at 8) and overrides only the thresholds you name,
  leaving everything else intact:
  ```lua
  I.SetBonus.amendSet('Iron', {
      bonuses = { max = { { effect = 'shield', mag = 0 } } },  -- (example) add an effect to the max tier
      items   = { 'my_extra_iron_piece' },
      thresholds = { min = 3 },
  })
  ```

Both rebuild just that set's spells and reconcile active actors immediately, so
changes take effect live (no reload needed). Event equivalents:
`SetBonus_registerSet` and `SetBonus_amendSet` (`{ name = ..., patch = {...} }`).

## Conditional effects (1.6+)

Any effect can carry a `condition` so it only applies while the wearer meets some
runtime state (below 50% health, at night, above a skill level, and so on). Each
conditional effect is built as its own sub-spell and toggled on/off as the
condition flips, while the actor is at that tier. A player setting, **Conditional
bonuses** (Options > Scripts > Set Bonus), gates the whole feature; when off,
condition-gated effects are not applied.

Conditions are **plain data**, identical to the MWSE version, so sets are portable
across both engines and travel fine over the OpenMW event layer.

```lua
I.SetBonus.registerSet{
    name  = 'Bloodmoon Reaver',
    items = { ... },
    bonuses = {
        max = {
            { effect = 'resistfrost', mag = 20 },                       -- always on
            { effect = 'fortifyattack', mag = 12,
              condition = { kind = 'health', op = '<', value = 0.5, fraction = true } },
            { effect = 'chameleon', mag = 20,
              condition = { { kind = 'time', value = 'night' }, { kind = 'location', value = 'exterior' } } },
        },
    },
}
```

A `condition` is one descriptor, an array (all must hold = AND), `{ any = {...} }`
(OR), or `{ all = {...} }` (AND).

Thresholds (`op` is `<  <=  >  >=  ==  ~=`): `health` / `magicka` / `fatigue`
(`value`, `fraction=true` for 0-1 of max), `encumbrance` (`value`, `fraction=true`
for 0-1 of carry capacity), `attribute` (`id`), `skill` (`id`), `level`, `bounty`
(`value`; player-only), `faction` (`id` plus `op`+`value` for rank, 1-indexed with
0 = not a member, and/or `expelled = true`/`false`; player-only). State (equality;
`value` may be a list = any-of): `time` (`day`/`night`), `sun` (`up`/`down`),
`location` (`interior`/`exterior`), `region` (region id), `race`, `class`, `sex`
(`male`/`female`), `birthsign` (id, e.g. `'The Warrior'`; player-only), `werewolf`
(`true`/`false`), `stance` (`weapon`/`spell`/`none`), `weather`, `combat`.

OpenMW notes:

- Skill/attribute `id`s are lowercased before lookup, so the MWSE spellings work
  too (`"longBlade"` -> `longblade`, `"strength"` -> `strength`).
- Supported directly on OpenMW (0.51+): health/magicka/fatigue, encumbrance,
  attribute, skill, level, bounty, faction, location, region, race, class, sex,
  birthsign, werewolf, stance, time, sun (time/sun read the in-world `GameHour`;
  faction/rank via `types.NPC.getFactionRank`/`isExpelled`, region via
  `cell.region`, werewolf via `types.NPC.isWerewolf`, stance via
  `types.Actor.getStance`). `faction`, `bounty`, and `birthsign` are player-scoped.
- `combat`, `weather`, and any custom `flag` are **fed in by another script**,
  since OpenMW's Lua exposes neither current weather nor an actor's combat state.
  Push state with the `SetBonus_setFlag` global event and the matching condition
  reads it:

  ```lua
  local core = require('openmw.core')
  -- wherever you detect combat (combat music, hit sounds, a combat overhaul, ...):
  core.sendGlobalEvent('SetBonus_setFlag', { actor = someActor, id = 'combat', value = true })
  -- feed current weather as a name:
  core.sendGlobalEvent('SetBonus_setFlag', { actor = someActor, id = 'weather', value = 'rain' })
  -- any custom flag, read by { kind = 'flag', id = 'myflag' }:
  core.sendGlobalEvent('SetBonus_setFlag', { actor = someActor, id = 'myflag', value = true })
  ```

  Then `{ kind = 'combat', value = true }`, `{ kind = 'weather', value = 'rain' }`,
  and `{ kind = 'flag', id = 'myflag' }` all evaluate against the pushed state.
  Setting a flag re-evaluates that actor immediately.
- Conditions are re-checked on a rolling schedule — the global script walks a
  small slice of the active actors each frame, covering everyone about once per
  second (capped per frame so crowded cells can't spike) — plus immediately on
  tier change and on `SetBonus_setFlag`. Each condition is evaluated safely (a
  bad condition reads as false, never an error).
- **Cross-engine parity tip:** if your mod ships for both engines, prefer the
  kinds that evaluate natively on both — health/magicka/fatigue, encumbrance,
  attribute, skill, level, bounty, faction, time, sun, location, region, race,
  class, sex, birthsign, werewolf, stance — and treat `combat` / `weather` /
  `flag` as OpenMW-optional extras (they read false until another script, or the
  optional Flag Companion, pushes state). The bundled Conditional Rebalance
  follows this rule.
- Conditional effects are labelled on Inventory Extender item tooltips
  automatically, e.g. `Fortify Attack 12 (when HP < 50%)`.

## Magnitude scaling (automatic)

Your sets obey the player's two magnitude sliders just like the base sets:
a benefit scale and a separate weakness/drawback scale (Options › Scripts ›
Set Bonus). The framework rounds to whole numbers, never scales a real effect
down to 0 (so `restore*` ticks survive), and never scales flag effects
(water breathing/walking, levitate, jump, telekinesis). You don't need to do
anything to opt in.
