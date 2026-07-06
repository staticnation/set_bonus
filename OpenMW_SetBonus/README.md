# Set Bonus — OpenMW Lua port

An OpenMW Lua conversion of the MWSE Set Bonus mod. Wearing several pieces of the
same armour set grants a scaling, constant-effect bonus (default tiers at 2 / 4 / 6+
pieces). Items can belong to multiple sets, so bonuses stack (magnitudes are tuned
for that). Applies to the player and NPCs.

**No content file (ESP/omwaddon) required** — the bonus ability spells are created
at runtime via `world.createRecord`.

## Requirements
OpenMW **0.51+** (or a recent dev build) — runtime spell-record creation is required.

## Install
1. Copy the `OpenMW_SetBonus` folder somewhere and add it as a data directory.
   In `openmw.cfg`:
   ```
   data="/path/to/OpenMW_SetBonus"
   content=setbonus.omwscripts
   ```
   (or add the folder + enable `setbonus.omwscripts` via the OpenMW launcher's
   Data Files tab).
2. Launch. Bonuses apply automatically as you equip set pieces.

## Files
- `setbonus.omwscripts` — registers the scripts (GLOBAL + per-actor).
- `scripts/SetBonus/data.lua` — all 136 sets: thresholds, tier bonus effects, and
  item IDs (base game + TR/OAAB/NOD/AATL items merged in). Auto-generated.
- `scripts/SetBonus/global.lua` — builds the tier spells at runtime and applies the
  correct tier to each actor based on equipped pieces.
- `scripts/SetBonus/actor.lua` — local script on each actor; watches equipment and
  asks the global script to recompute.
- `scripts/SetBonus/player.lua` — registers the settings page and shows tier-change messages.
- `SetBonus_Interop_OpenMW.md` — framework guide for mod authors (see below).

## How it works
- On load, `global.lua` creates one ability spell per set per tier (≈408 spells).
- `actor.lua` polls equipment (every 0.5s) and on change sends `SetBonus_recompute`.
- `global.lua` counts equipped pieces per set, picks the tier, and adds/removes the
  matching ability via `Actor.spells():add/remove`. State is reconciled each time and
  cleaned once per actor after a load, so spells never get stuck.

## Notes
- Items/effects use OpenMW IDs (lowercase). Magnitudes are low and flat (resists
  10/15/20, magic-resist 5/8/12, attributes 3/5/8, etc.) and most sets carry a mild
  thematic Weakness at mid/max (metal -> shock, fur/hide -> fire, chitin/glass ->
  frost, Altmer -> magicka). The Shield effect is replaced with no-VFX equivalents
  (resist normal weapons / elemental resists) so armoured actors don't all shimmer.
  Identical magnitudes to the MWSE version.
- External-mod armour (Tamriel Rebuilt, OAAB, NOD, AATL) is already folded into the
  relevant sets' item lists; items simply never match if that mod isn't installed.
- **Optional Conditional Rebalance** — prefer condition-driven bonuses over flat
  stats? Add the `OpenMW_SetBonusRebalance` data directory and enable
  `setbonus_rebalance.omwscripts` (after `setbonus.omwscripts`). It replaces every
  set's effects with the alternative balance described in
  `SetBonus_Rebalance_Reference.md`; disable it to return to the default balance.
- **Settings page:** open *Options > Scripts > Set Bonus* in-game for three toggles:
  - *Tier-change notifications* (player) — show a message when your bonus tier changes.
  - *Set info on item tooltips* (player) — show the set, your progress, and the
    tier effects on a set piece's tooltip. Requires the **Inventory Extender**
    mod, which provides the tooltip hook (`I.InventoryExtender.registerTooltipModifier`);
    without it OpenMW has no way to edit item tooltips from Lua, so this does nothing.
  - *Tooltip detail* (player) — compact (default: the active tier's effects,
    or a greyed first-tier preview when the set isn't active), full (every
    tier with thresholds), or minimal (bare set names).
  - *Apply bonuses to NPCs* (global) — toggling off immediately clears NPC bonuses.
  - *Match enchanted/copied items by icon* (global) — on by default; also matches
    set pieces by inventory icon so a player-enchanted or copied item (new record
    ID, same icon) still counts. Turn off for strict ID-only matching.
  - *Benefit magnitude scale* (global) — multiplier for the helpful effects
    (0.25–3.0, default 1.0). Magnitudes stay whole numbers and never round to 0,
    so over-time effects keep ticking. Rebuilds and re-applies immediately.
  - *Weakness (drawback) scale* (global) — separate multiplier for the thematic
    Weakness drawbacks (0–3.0, default 1.0). Set to 0 to remove drawbacks entirely.
  - *Debug logging* (global) — print `[SetBonus]` diagnostics (spell creation counts,
    tier changes, and any spell-build failures) to the log/console for troubleshooting.
  These persist in your OpenMW config (permanent storage). Changing either scale
  rebuilds the ability records and reconciles every active actor, so no stale
  magnitudes linger.
- If a spell fails to build on your engine version, it's logged as `[SetBonus] ...`
  and skipped (the effect/spell record fields are dev-API and may shift).

## For mod authors (framework)

Other mods can register their own armour sets and let Set Bonus build and manage
the spells for them — the same idea as the MWSE interop, adapted to OpenMW. Two
entry points:

- **Interface** `I.SetBonus` (from a global script): `registerSet`,
  `registerSets` (batch, v2+ — one rebuild/recompute for many sets), `addItems`,
  `registerSetLink`, `getSet`/`getSets`/`getSetsForItem`/`isItemInSet`,
  `benefitScale()`/`drawbackScale()`, `version` (now 2).
- **Global events** for mods without a global script:
  `SetBonus_registerSet` / `SetBonus_registerSets` (`{ sets = {...} }`) /
  `SetBonus_addItems` / `SetBonus_registerSetLink`
  (payload is the same data table).

Registered sets obey the player's magnitude sliders automatically. See
`SetBonus_Interop_OpenMW.md` for the full API and a copy-paste example, and the
**`OpenMW_SetBonus_Example`** folder for a working drop-in add-on.

## Troubleshooting
- **"failed loading setbonus.omwscripts: the content file does not exist".**
  The `data=` directory must point at the `OpenMW_SetBonus` folder *itself* — the one
  that directly contains `setbonus.omwscripts` (with `scripts/` beside it) — **not** a
  parent folder. A `.omwscripts` file is only found at the top level of a registered
  data directory. Fix the `data=` path, then enable `setbonus.omwscripts` in the
  content list.
- **No bonuses or notifications when equipping.** Enable *Debug logging* and reload a
  save; the log should read `[SetBonus] initialised: 408 spells built, 0 failed, 136 sets`.
  If it shows failures, the line names the set/tier and the error — paste it. (Most
  likely cause is being below 0.51, where runtime spell creation isn't available.)
- **Spells created once per load.** The 408 ability records are built when the global
  script starts. If you changed the scripts mid-session, load a save again so they
  rebuild; the per-actor cleanup reconciles anything stale.
