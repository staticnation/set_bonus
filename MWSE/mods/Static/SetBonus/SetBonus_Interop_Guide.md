# Static Set Bonus — Mod Author Interop Guide

This framework grants armour "set bonuses": constant-effect abilities that turn on
while a character wears several pieces of the same set, scaling up as more pieces
are equipped. Other mods can register their own sets through a small, stable API.

## Accessing the API

Because all MWSE mods share the same Lua package path, just `require` the interop
module from anywhere in your mod:

```lua
local setBonus = require("Static.SetBonus.interop")
```

It is safe to call at file scope (mod load). You can guard on the version:

```lua
if setBonus and setBonus.version >= 2 then
    -- register your sets
end
```

## Tiers

Each set has three tiers, chosen by how many pieces are equipped:

| Tier | Default pieces |
|------|----------------|
| min  | 2–3            |
| mid  | 4–5            |
| max  | 6+             |

Thresholds default to `2 / 4 / 6` and can be overridden per set (see below).

## Registering a set

`setBonus.registerSet(setData)` — `setData` is a table with:

| Field         | Required | Description |
|---------------|----------|-------------|
| `name`        | yes      | Unique set name (used as the lookup key, case-insensitive). |
| `items`       | yes      | Array of equippable item IDs (armor / clothing / weapons). Case-insensitive. |
| `bonuses`     | one of these two | Lua-defined effects, `{ min = {...}, mid = {...}, max = {...} }`. The framework builds the tier spells at runtime. |
| `minBonus` / `midBonus` / `maxBonus` | one of these two | IDs of ability spells you defined in your own ESP. |
| `thresholds`  | no       | `{ min = 2, mid = 4, max = 6 }`. Any omitted tier uses the default. |
| `displayName` | no       | Pretty name for notifications / generated spell names. Defaults to `name`. |
| `spellPrefix` | no       | Prefix for generated spell IDs (Lua-defined sets only). Defaults to `_sb_<name>`. |

You must provide **either** a `bonuses` table **or** the `min/mid/maxBonus` spell IDs.

### Option A — Lua-defined bonuses (no ESP needed)

Each tier is an array of effect definitions:

| Effect field | Required | Description |
|--------------|----------|-------------|
| `effect`     | yes      | `tes3.effect` constant or camelCase name, e.g. `"resistFire"`. |
| `min`        | no*      | Minimum magnitude. |
| `max`        | no*      | Maximum magnitude (defaults to `min`). |
| `magnitude`  | no*      | Shorthand: sets both `min` and `max`. |
| `duration`   | no       | Use `1` for over-time effects (Restore Health/Magicka/Fatigue); `0` otherwise. |
| `skill`      | no       | For Fortify/Damage/Drain Skill effects: `tes3.skill` constant or name (`"longBlade"`). |
| `attribute`  | no       | For Fortify/Damage/Drain Attribute effects: `tes3.attribute` constant or name (`"strength"`). |
| `range`      | no       | `"self"` (default), `"touch"`, or `"target"`. |
| `radius`     | no       | Area radius in feet (default 0). |

\* Provide either `magnitude`, or `min`/`max`.

```lua
setBonus.registerSet{
    name = "My Dwarven Set",
    items = { "my_dwarven_helm", "my_dwarven_cuirass", "my_dwarven_greaves",
              "my_dwarven_boots", "my_dwarven_pauldron_l", "my_dwarven_pauldron_r" },
    bonuses = {
        min = {
            { effect = "resistShock", magnitude = 15 },
        },
        mid = {
            { effect = "resistShock", magnitude = 30 },
            { effect = "reflect",     magnitude = 8  },
        },
        max = {
            { effect = "resistShock", magnitude = 50 },
            { effect = "reflect",     magnitude = 12 },
            { effect = "fortifySkill", skill = "armorer", magnitude = 20 },
            { effect = "restoreFatigue", magnitude = 2, duration = 1 },
        },
    },
    -- optional:
    thresholds = { min = 3, mid = 5, max = 7 },
}
```

### Option B — ESP-defined spells

Define three ability spells in your plugin and point the set at them:

```lua
setBonus.registerSet{
    name = "My Dwarven Set",
    items = { "my_dwarven_helm", "my_dwarven_cuirass", --[[ ... ]] },
    minBonus = "my_dwarven_min",
    midBonus = "my_dwarven_mid",
    maxBonus = "my_dwarven_max",
}
```

### Loading a folder of set files

If you keep each set in its own `.lua` file (each `return`ing a setData table),
load them all at once:

```lua
local setBonus = require("Static.SetBonus.interop")
setBonus.initAll("Data Files/MWSE/mods/MyName/MyMod/sets")
```

## Other functions

```lua
setBonus.registerSetLink{ item = "extra_helm", set = "My Dwarven Set" }  -- link one extra item
setBonus.addItems("My Dwarven Set", { "patch_helm", "patch_boots" })     -- link several items
setBonus.getSet("My Dwarven Set")        -- the registered set table, or nil
setBonus.getSets()                        -- array of all registered sets
setBonus.getSetsForItem("my_dwarven_helm")-- table of set names this item belongs to, or nil
setBonus.isItemInSet("my_dwarven_helm", "My Dwarven Set")  -- boolean
```

## Reacting to tier changes

Whenever an actor's tier for a set changes, the framework triggers an event:

```lua
event.register("Static:SetBonusChanged", function(e)
    -- e.reference : the actor whose set bonus changed
    -- e.set       : the set table
    -- e.setName   : the lowercase set name
    -- e.oldTier   : previous tier ("min"/"mid"/"max") or nil
    -- e.newTier   : new tier ("min"/"mid"/"max") or nil
    -- e.count     : number of pieces currently equipped
    if e.reference == tes3.player and e.newTier == "max" then
        -- e.g. play a sound, show custom UI, grant an extra effect, ...
    end
end)
```

## Notes & gotchas

- **Item IDs and set names are case-insensitive** (stored lowercased internally).
- **Timing:** Lua-defined spells are created on the `initialized` event. Register
  your sets at mod load (file scope) or any time before then; sets registered after
  the game is running are built immediately.
- **Effect maximum:** an ability can hold at most 8 effects per tier.
- **Over-time effects** (Restore Health/Magicka/Fatigue) need `duration = 1` to tick;
  state effects (Resist/Fortify/Shield/etc.) use `duration = 0`.
- Effect / skill / attribute names follow MWSE's tables:
  [tes3.effect](https://mwse.github.io/MWSE/references/magic-effects/),
  [tes3.skill](https://mwse.github.io/MWSE/references/skills/),
  [tes3.attribute](https://mwse.github.io/MWSE/references/attributes/).
