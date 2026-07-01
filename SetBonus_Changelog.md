# Set Bonus — Changelog

## 1.5.1 — Optional integrations: Consistent Enchanting & Inventory Extender

**Added**

- **Consistent Enchanting support** (MWSE, optional). If Consistent Enchanting is
  installed with "store base object" on, player-enchanted set pieces are matched
  by their exact base item — no false positives, and it works even with icon
  matching turned off. Automatic when present.
- **Item tooltips on OpenMW** via the **Inventory Extender** mod (optional).
  Inventory Extender provides a tooltip hook OpenMW otherwise lacks; when it's
  installed, set pieces show the same tooltip the MWSE version has (set name,
  progress, per-tier effects, active tier highlighted, multi-set aware). Toggle in
  Options › Scripts › Set Bonus. Without Inventory Extender, OpenMW shows no
  tooltip (unchanged). The integration is fully guarded so it can never interfere
  with Inventory Extender's own tooltips.

## 1.5 — Enchant matching & item tooltips (MWSE & OpenMW)

**Added**

- **Set pieces are now matched by inventory icon as well as item ID** (MWSE &
  OpenMW), so a player-enchanted (or otherwise copied) set item — which gets a new
  internal ID but keeps the same icon — still counts toward its set. This restores
  the original beta behaviour. Toggle **"Match enchanted/copied items by icon"**
  (MWSE: MCM; OpenMW: Options › Scripts › Set Bonus), on by default. Turn it off
  for strict ID-only matching if a rare item that merely reuses an icon shouldn't
  count.
- **Set info on item tooltips** (MWSE). Hovering an armour/clothing/weapon that
  belongs to a set shows the set name, your current progress, and every tier's
  effects (with magic-effect icons); the active tier is highlighted and Weakness
  drawbacks are flagged in red. Multi-set items list each set they belong to
  ("1 of 2"). Toggle in the MCM.

## 1.4.1 — Amend / replace / disable sets (MWSE & OpenMW)

**Added**

- **Amend, replace, or disable any set** — including the base mod's own.
  `amendSet(name, patch)` additively appends items and bonus effects (per tier,
  capped at 8) and overrides only the thresholds you name, keeping the rest.
  `registerSet` with an existing name fully **replaces** that set, and an empty
  definition (`items = {}, bonuses = {}`) **disables** it. Available on the MWSE
  `require` API, the OpenMW `I.SetBonus` interface, and as the `SetBonus_amendSet`
  event. See both interop guides and the `OpenMW_SetBonus_Example` add-on.

**Changed**

- Registering a set now rebuilds just that set's spells and refreshes worn
  bonuses live (no reload). On replace, item links from the old definition are
  purged and the set keeps its generated spell IDs, so a worn bonus updates in
  place instead of leaving a stale spell behind.

**Fixed**

- `registerSet` on an existing name no longer leaves a duplicate entry in the
  internal set list.

## 1.4 — Framework parity & scaling refinements (MWSE & OpenMW)

**Added**

- **OpenMW is now a framework too.** Other mods can register their own armour
  sets and let Set Bonus build and manage the spells for them — the same idea as
  the MWSE interop. Register from a global script via the `I.SetBonus` interface
  (`registerSet`, `addItems`, `registerSetLink`, `getSet`/`getSets`/
  `getSetsForItem`/`isItemInSet`, `benefitScale()`/`drawbackScale()`, `version`),
  or over global events (`SetBonus_registerSet`, `SetBonus_addItems`,
  `SetBonus_registerSetLink`) from any script type. Registered sets obey the
  magnitude sliders automatically.
  See `SetBonus_Interop_OpenMW.md` and the `OpenMW_SetBonus_Example` add-on.

**Changed**

- **Two independent magnitude scales.** The single scale is now split into a
  **benefit** scale and a separate **weakness/drawback** scale (MWSE: two MCM
  sliders; OpenMW: two Script Settings fields). Set the weakness scale to **0**
  to disable drawbacks entirely while keeping the benefits.
- **Whole numbers, always.** Scaled magnitudes round cleanly (round half up,
  e.g. `5 × 0.5 → 3`) instead of leaving fractional values.
- **No dead ticks.** Over-time effects (Restore Health/Magicka/Fatigue) never
  scale down to 0 — they keep at least 1 point so they always tick. Flag effects
  (Water Breathing/Walking, Levitate, Jump, Telekinesis) are never scaled.

**Fixed**

- Corrected the Weakness effect ids (`weaknessto…`) so drawbacks build reliably
  on MWSE.

## 1.3 — Rebalance (MWSE & OpenMW)

- Full rebalance: nerfed and flattened the tier curve so a full set enhances
  rather than trivialises, and added mild thematic Weakness drawbacks.
- Replaced the Shield effect with no-VFX equivalents (Resist Normal Weapons /
  elemental resists) so armoured characters no longer shimmer.
- Added a magnitude scaling control (MWSE MCM slider / OpenMW Script Settings
  field) to shift bonus magnitudes dynamically (.25–300%).
- OpenMW: fixed set bonuses re-applying (stacking) after loading a save.

## Earlier

- 130+ armour sets across vanilla Morrowind, Tribunal and Bloodmoon, plus
  self-detecting companion modules for Tamriel Rebuilt, OAAB, NOD and AATL.
- ESP-free: every bonus ability spell is built at runtime in Lua.
- Native OpenMW Lua port (player + NPCs) alongside the MWSE version.
- MWSE modder interop; in-game options (notifications, NPC bonuses, logging).
