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
I.SetBonus.version                    -- interface version (1)
```

## Event equivalents (any script type)

```lua
local core = require('openmw.core')
core.sendGlobalEvent('SetBonus_registerSet', { name = 'My Set', items = {...}, bonuses = {...} })
core.sendGlobalEvent('SetBonus_addItems', { name = 'Iron', items = { 'my_iron_helm' } })
core.sendGlobalEvent('SetBonus_registerSetLink', { item = 'my_iron_shield', set = 'Iron' })
```

Events carry plain data only (no functions), so they serialize fine.

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

## Magnitude scaling (automatic)

Your sets obey the player's two magnitude sliders just like the base sets:
a benefit scale and a separate weakness/drawback scale (Options › Scripts ›
Set Bonus). The framework rounds to whole numbers, never scales a real effect
down to 0 (so `restore*` ticks survive), and never scales flag effects
(water breathing/walking, levitate, jump, telekinesis). You don't need to do
anything to opt in.
