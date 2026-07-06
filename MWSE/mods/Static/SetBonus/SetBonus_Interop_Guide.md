# Static Set Bonus — Mod Author Interop Guide

This framework grants armour "set bonuses": constant-effect abilities that turn on
while a character wears several pieces of the same set, scaling up as more pieces
are equipped. Other mods can register their own sets through a small, stable API.

The base mod is **fully Lua-defined and needs no ESP** — every ability spell is
built at runtime. External-mod armour lives in optional, self-detecting companion
add-ons (`SetBonusTR`, `SetBonusOAAB`, `SetBonusNOD`, `SetBonusAATL`) that re-link
their items onto the base sets only when that mod is installed. You can write the
same kind of add-on for your own mod — see *Load order & event priority* below.

> **This guide is for the MWSE version.** The OpenMW port is a framework too, but
> uses OpenMW's mechanisms (the `I.SetBonus` interface or global events) instead
> of `require`. See `SetBonus_Interop_OpenMW.md` for that one.

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
| `spellPrefix` | no       | Prefix for generated spell IDs (Lua-defined sets only). Defaults to `_sb_<name>`. Long names are safe: ids that would exceed the engine's 31-character record-id cap are shortened deterministically (1.7+). |

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
setBonus.amendSet("My Dwarven Set", {                                     -- additively amend a set
    items      = { "patch_pauldron" },
    bonuses    = { max = { { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 } } },
    thresholds = { max = 5 },
})
setBonus.getSet("My Dwarven Set")        -- the registered set table, or nil
setBonus.getSets()                        -- array of all registered sets
setBonus.getSetsForItem("my_dwarven_helm")-- table of set names this item belongs to, or nil
setBonus.isItemInSet("my_dwarven_helm", "My Dwarven Set")  -- boolean
```

## Amend vs replace

You choose whether to add to a set or redefine it:

- **`registerSet{ name = "Iron", ... }`** with a name that already exists **fully
  replaces** that set (items, bonuses, thresholds). Registering it with empty
  `items` and `bonuses` cleanly **disables** a set — including the base mod's own:

  ```lua
  setBonus.registerSet{ name = "Iron", items = {}, bonuses = {} }  -- turn Iron off
  ```

  On replace the set keeps its generated spell IDs, so a bonus the player is
  already wearing updates in place (no stale spell left behind).

- **`setBonus.amendSet(name, patch)`** is **additive** — it appends items and
  bonus effects (per tier, capped at 8) and overrides only the thresholds you
  name, leaving everything else intact.

Both rebuild the affected set's spells and refresh worn bonuses live (they fire
the same internal refresh the magnitude sliders use), so changes apply without a
reload. Amending bonuses is intended for **Lua-defined** sets; it has no effect on
sets that point at ESP spell IDs.

## Load order & event priority

Set registration and runtime spell-building both happen on the `initialized`
event. This matters when your mod **adds items to a set that a *different* mod
registers** — e.g. a compatibility add-on that links its armour onto sets owned
by another plugin.

MWSE fires `initialized` handlers in **priority order (higher runs first, default
`0`)**, and plugins load alphabetically by folder — so you can't assume another
mod's sets already exist when your handler runs.

The fix: register your re-link / `addItems` handler at a **lower priority** so it
runs *after* everyone has registered their sets:

```lua
local function linkMyItems()
    -- guard so it no-ops when the target set / mod isn't installed
    if setBonus.getSet("Some Other Mod's Set") then
        setBonus.addItems("Some Other Mod's Set", { "my_item_01", "my_item_02" })
    end
end
-- priority -100 => runs after default-priority (0) set registrations
event.register(tes3.event.initialized, linkMyItems, { priority = -100 })
```

Rules of thumb:

- **Registering your own sets:** default priority (or at file scope) is fine — do it early.
- **Linking into another mod's sets:** use a negative priority so their registration is guaranteed to have run.
- **Always guard** cross-mod links with `setBonus.getSet(name)` (and/or `tes3.getObject(probeItem)`) so nothing errors when the other mod is absent.

This is exactly how the bundled TR / OAAB / NOD / AATL companion add-ons re-link
their armour onto the base sets.

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

## Magnitude scaling

The player can scale bonus magnitudes from the MCM with two independent sliders:
a **benefit** scale (helpful effects) and a **weakness/drawback** scale (any
`weaknessTo*` effect; 0 disables drawbacks). This applies to **all Lua-defined
sets, including yours** — the framework builds and rescales your tier spells with
the current multipliers, so you don't need to do anything to opt in.

Rules the framework enforces when scaling:

- Magnitudes are always **whole numbers** (round half up, e.g. `5 x 0.5 -> 3`).
- A real effect (base magnitude >= 1) **never rounds down to 0**, so over-time
  effects (Restore Health/Magicka/Fatigue) keep ticking even at low scales.
- **Flag effects** with a placeholder magnitude of 1 (Water Breathing/Walking,
  Levitate, Jump, Telekinesis) are **never scaled**.
- `weaknessTo*` effects are detected by name and use the drawback scale.

If you need the current values programmatically:

```lua
setBonus.benefitScale   -- current benefit multiplier (number, 1 = default)
setBonus.drawbackScale  -- current drawback multiplier (0 = drawbacks off)
setBonus.applyScale(benefitScale, drawbackScale)  -- rescale live (either arg may be nil)
```

`applyScale` edits the existing spell records in place, so actors need a
remove/re-add to pick up the change -- the base mod does this automatically when
the sliders move (via the `Static:RescaleBonuses` event).

## Conditional effects (1.6+)

Any effect in a tier can carry a `condition`, so it only applies while the wearer
meets some runtime state (below 50% health, at night, above a skill level, in
combat, and so on). The framework builds each conditional effect as its own small
sub-spell and toggles it on/off as the condition flips, while the set is at that
tier. Conditions are gated by the player's **Conditional bonuses** setting; when
off, condition-gated effects are simply not applied.

Conditions are **plain data** (not functions), so they behave identically on MWSE
and OpenMW and serialize across OpenMW's event layer.

Example -- a set that hits harder below half health, and turns you unseen at night:

```lua
max = {
    { effect = "resistFrost", magnitude = 20 },   -- always on at max
    { effect = "fortifyAttack", magnitude = 10,
      condition = { kind = "health", op = "<", value = 0.5, fraction = true } },
    { effect = "chameleon", magnitude = 15,
      condition = { kind = "time", value = "night" } },
}
```

### Condition descriptor

A `condition` is one descriptor, an array of them (all must hold = AND), or
`{ any = { ... } }` (OR) / `{ all = { ... } }` (AND).

Thresholds (`op` is one of `<  <=  >  >=  ==  ~=`):

| kind | fields | notes |
|------|--------|-------|
| `health` / `magicka` / `fatigue` | `op`, `value`, `fraction` | `fraction = true` compares 0-1 of max; otherwise absolute |
| `attribute` | `id` (e.g. `"strength"`), `op`, `value` | |
| `skill` | `id` (e.g. `"longBlade"`), `op`, `value` | |
| `level` | `op`, `value` | |

States (equality; `value` may be a single value or a list = any-of):

| kind | value |
|------|-------|
| `time` | `"day"` / `"night"` |
| `sun` | `"up"` / `"down"` (up = daytime and outdoors -- handy for vampires) |
| `location` | `"interior"` / `"exterior"` |
| `weather` | a weather name or list, e.g. `"rain"` or `{ "rain", "thunder" }` |
| `race` | race id/name, or a list |
| `class` | class id/name, or a list |
| `combat` | `true` / `false` |

Custom / external state: besides the built-in kinds, a `flag` condition reads
per-reference state pushed by any mod:

```lua
event.trigger("Static:SetBonusFlag", { reference = ref, id = "myflag", value = true })
-- read by: { kind = "flag", id = "myflag" }   (boolean, or compares `value` if given)
```

Notes: dynamic state (HP, time, weather, ...) is re-checked about once a second,
plus immediately on tier change. Conditional effects obey the magnitude sliders
like any other effect, and each condition is evaluated safely -- a malformed
condition just reads as false, never an error. Item tooltips label conditional
effects automatically, e.g. `Fortify Attack 12 (when HP < 50%)`.

**Cross-engine parity tip:** `combat` and `weather` evaluate natively on MWSE,
but OpenMW's Lua can't read either -- there they depend on another script
pushing state (see the OpenMW guide) and read false otherwise. If your mod
ships for both engines, prefer the kinds that work natively everywhere:
health/magicka/fatigue, attribute, skill, level, time, sun, location, race,
class. The bundled Conditional Rebalance follows this rule.

## Notes & gotchas

- **Item IDs and set names are case-insensitive** (stored lowercased internally).
- **Timing:** Lua-defined spells are created on the `initialized` event. Register
  your sets at mod load (file scope) or any time before then; sets registered after
  the game is running are built immediately. To link into *another* mod's sets, run
  on `initialized` at a lower priority — see *Load order & event priority*.
- **Effect maximum:** an ability can hold at most 8 effects per tier
  (unconditional effects; each conditional effect becomes its own sub-spell).
- **Spell ids are clamped (1.7+):** generated ids append tier and conditional
  suffixes (`_max_c2`); anything over the engine's 31-character cap is
  shortened with a deterministic hash, so long set names can't break the
  spell build and the same set always regenerates the same ids.
- **Over-time effects** (Restore Health/Magicka/Fatigue) need `duration = 1` to tick;
  state effects (Resist/Fortify/Shield/etc.) use `duration = 0`.
- Effect / skill / attribute names follow MWSE's tables:
  [tes3.effect](https://mwse.github.io/MWSE/references/magic-effects/),
  [tes3.skill](https://mwse.github.io/MWSE/references/skills/),
  [tes3.attribute](https://mwse.github.io/MWSE/references/attributes/).
