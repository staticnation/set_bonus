# Set Bonus — Flag Companion (optional)

The core Set Bonus framework only ships **conditions that read identically on
both MWSE and OpenMW 0.51**. A few desirable states — combat, weather, and
movement — can't meet that bar (OpenMW can't read them in the global context
where set bonuses are evaluated), so they're kept out of the shipped set data on
purpose.

This optional companion bridges that gap. On each engine it detects whatever
runtime state that engine *can* read and pushes it into Set Bonus's external
**flag hook**, so your own sets may use `flag` conditions. Install it only if you
want flag-driven sets; nothing in the base mod or the Conditional Rebalance
depends on it, and without it those `flag` conditions simply never fire.

## Flag vocabulary

The companion pushes these flags for the player. Read them in a set with
`{ kind = "flag", id = "<name>", value = <expected> }` (omit `value` to test for
`true`):

| flag       | type    | MWSE | OpenMW | meaning |
|------------|---------|------|--------|---------|
| `combat`   | bool    | ✅   | ⚠️     | player is in combat |
| `swimming` | bool    | ✅   | ✅     | player is in water |
| `sneaking` | bool    | ✅   | ⚠️     | player is sneaking |
| `moving`   | bool    | ✅   | ✅     | player is moving on foot |
| `weather`  | string  | ✅   | ⚠️     | `clear` `cloudy` `foggy` `overcast` `rain` `thunder` `ash` `blight` `snow` `blizzard` |

⚠️ **OpenMW limits:** OpenMW's Lua API exposes swimming and movement to a local
script but does **not** expose weather or combat at all. So on OpenMW the
companion provides only `swimming` and `moving`. `combat`, `sneaking`, and
`weather` must be fed by another mod that can detect them, via the same public
event (see below). On **MWSE** all five are provided.

> MWSE also reads `combat` and `weather` natively through the core `combat` and
> `weather` condition kinds — you don't need the companion for those on MWSE. Use
> the `flag` ids above when you want the *same* set to behave the same way on
> both engines (companion installed).

## Authoring a flag-driven set

Flag conditions go in **your own** set definitions (via the framework's
`registerSet` / data interop), never in the shipped `SetBonusRebalance` data —
`gen_rebalance.py` intentionally rejects `flag`/`combat`/`weather` kinds so the
shipped rebalance stays parity-guaranteed.

```lua
-- "Soaked" storm set: a spike only while it storms, a tax while dry.
bonuses = {
  max = {
    { effect = "fortifyAttribute", attribute = "speed", magnitude = 10,
      condition = { kind = "flag", id = "weather", value = { "rain", "thunder" } } },
    { effect = "weaknesstoShock", magnitude = 20,
      condition = { kind = "flag", id = "weather", value = "thunder" } },
  },
}

-- "Ambusher": chameleon while sneaking and out of combat.
condition = { all = {
  { kind = "flag", id = "sneaking" },
  { kind = "flag", id = "combat", value = false },
} }
```

## Feeding flags from another mod

The companion is just one producer. Any mod can push a flag using the same hook,
which is how a weather or combat mod can supply what OpenMW's core API can't:

- **MWSE:** `event.trigger("Static:SetBonusFlag", { reference = tes3.player, id = "combat", value = true })`
- **OpenMW:** `core.sendGlobalEvent('SetBonus_setFlag', { actor = player, id = 'combat', value = true })`

Set Bonus re-evaluates conditions immediately when a flag changes.

## Install

- **MWSE:** copy `MWSE/mods/Static/SetBonusFlags/` into your Data Files (auto-loaded).
- **OpenMW:** add `OpenMW_SetBonusFlags/` as a data path and enable
  `SetBonusFlags.omwscripts` in your load order (after Set Bonus).

Poll interval is 0.3 s; edit `INTERVAL` at the top of either script to taste.
