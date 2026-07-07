# Set Bonus — Changelog

## 1.7.1 — Fully populated Armor-class sets (in progress)

**Added**

- **Heavy / Medium / Light Armor class sets, fully populated by weight class.**
  Every armour piece across the base game and all supported add-ons (Tamriel
  Rebuilt, OAAB, NOD, AATL — shields included) is now bucketed into its
  Heavy/Medium/Light Armor set from the armour dumps by its engine weight tag,
  instead of the previous hand-picked rosters. Base game 160 Heavy / 112 Medium
  / 136 Light; combined with add-ons the OpenMW class sets carry 728 / 707 /
  1105 items. Rosters are generated (and re-generatable) with
  `gen_class_sets.py`, which de-dupes add-on ids against the base game and
  writes the MWSE base set files, the managed `addItems` blocks in each add-on,
  and the OpenMW `data.lua` arrays.
- **Rebalance class sets re-tuned as echo umbrellas.** Because the class sets
  now overlap nearly every material set, the Conditional Rebalance keeps them as
  echo-strength umbrellas (echo-capped shared flats plus a class-*skill*
  conditional that no material set carries — `fortifySkill heavyArmor` /
  `mediumArmor` / `lightArmor`), so a full material outfit layers with its class
  set instead of doubling it. `gen_rebalance.py` stacking validation stays clean.

- **Eight new cross-engine condition kinds** — the conditional framework now
  exposes every player/actor state both MWSE and OpenMW 0.51 can read natively in
  the evaluation context, roughly tripling the vocabulary authors can build sets
  on. All evaluate identically on both engines (no external driver), so set data
  stays portable:
    - `encumbrance` — carried weight as a fraction of capacity (or absolute).
    - `faction` — rank (1-indexed; 0 = not a member) and/or `expelled` standing.
    - `bounty` — the player's crime level.
    - `region` — the wearer's current region id (e.g. Sheogorad, Solstheim).
    - `birthsign` — the player's birthsign id.
    - `sex` — male / female.
    - `werewolf` — whether the actor is currently in werewolf form.
    - `stance` — weapon drawn / spell readied / sheathed.
  `faction`, `bounty`, and `birthsign` are player-scoped (evaluate false for
  NPCs). `gen_rebalance.py` validates every new kind. Weather/combat/movement
  remain external-flag-only (OpenMW can't read them in the global context) and
  are still kept out of core data to preserve engine parity.
- **Conditional Rebalance: situational drawbacks + a deeper conditional pass on
  every set.** All weakness drawbacks across the submodule (base materials,
  cultures, factions, and all Tamriel Rebuilt sets) are now **situational** rather
  than flat — each one bites only in its thematic bad moment, at a slightly
  steeper magnitude to offset the reduced uptime: heavy metals can't shed a bolt
  under a full pack, leathers and furs catch fire near a hearth, resin/chitin go
  brittle in the cold dark, Daedric punishes cowards who dodge the fight, Falmer
  and vampiric gear suffer in daylight, and lawful/holy armour spurns a wanted
  wearer. New ESO- and lore-inspired situational *spikes* thread the new kinds
  through the sets: rank-scaling faction gear (Fighters/Mages/Thieves Guild,
  Morag Tong, Hlaalu, Telvanni, Redoran, and the Temple lines reward standing),
  werewolf-blood on Nordic/Orsimer/Companions, an unburdened-archer bonus on
  Bosmer, homeland regions, stance-gated first strikes, and birthsign resonance.
  The submodule now carries 460 conditional effects across all 137 sets;
  `gen_rebalance.py` reports stacking rules clean.
- **Snow Prince / Falmer split.** The Snow Prince's Ice Armour is now its own
  **Snow Prince** set — the pre-fall Snow Elves: sighted, proud, and strongest
  under open sky (no daylight penalty) — the deliberate mirror of the post-fall
  **Falmer** set (the blind, sun-shunning Betrayed, which keeps its daylight
  weakness). Fixes the lore mismatch of noble Snow Elf gear inheriting the
  Betrayed's sun aversion. The Ice Armour still counts toward Nordic/Stalhrim/its
  weight-class sets too (overlap intended). 137 sets total.
- **Optional Flag Companion** (`SetBonusFlags`, both engines) — bridges runtime
  state the core framework can't read cross-engine (combat, weather, movement,
  swimming, sneaking) into Set Bonus's external flag hook, so author-defined sets
  can use `{ kind = "flag", id = "..." }` conditions. MWSE provides all five;
  OpenMW provides `swimming`/`moving` (its Lua API can't read weather or combat),
  leaving the hook open for other mods to feed the rest. Purely opt-in — nothing
  in the base mod or the Rebalance depends on it, and flag/combat/weather kinds
  stay barred from the shipped rebalance data to preserve parity. See
  `SetBonus_Flags_Companion.md`.

**Fixed**

- **Icon-only enchant/copy matching could cross-match unrelated items.** The
  optional fallback that matches player-enchanted or copied set pieces (which
  get a new internal ID but keep their source item's inventory icon) matched on
  icon alone. An icon-replacer or compilation add-on that points an unrelated
  armour record at the same icon as a set piece — e.g. a NOD helm reusing the
  vanilla Indoril helmet icon — could therefore be wrongly counted toward that
  set. The fallback now also requires the item's **mesh** to match: an
  enchanted/copied item always inherits both its source's icon and mesh, while
  two genuinely different armour pieces essentially never share a mesh even
  when a texture pack points them at the same icon. Closes the false-positive
  without weakening enchant/copy matching itself. Both engines; no setting
  changes needed ("Match enchanted/copied items by icon" still covers it).

**Planned (see `BRIEFING_SetBonus_1.7.1_Roadmap.md`)**

- Per-set region conditionals for the Tamriel Rebuilt mainland (pending
  confirmation of TR region record ids).

## 1.7 — Conditional Rebalance (optional submodule, MWSE & OpenMW)

**Added**

- **Conditional Rebalance submodule** — an optional add-on that replaces every
  set's bonuses with an alternative balance built on the 1.6 conditional-effects
  framework. Each set keeps a lean always-on identity and gains **situational
  spikes** (~1.5–2× stronger, active only while a state holds), themed to the
  kind of set: heavy materials answer pain (*bloodied* / *last stand*), light
  materials favour darkness and open sky, cultural sets are strongest for their
  own race and homeland habits, faction sets mirror their trade, and the class
  sets (Light/Medium/Heavy Armor, Cloth) turn purely reactive so they complement
  rather than double the material sets that share their items. Weakness
  drawbacks remain (a few are conditional now) and both magnitude sliders still
  apply. Covers all 136 sets (69 base + 67 Tamriel Rebuilt); entries for sets
  that aren't registered are skipped, so it's safe with any add-on combination.
- **Stacking lanes for overlapping sets.** Items commonly belong to several
  sets (a Chuzei helm is also Bonemold, Dunmer, and Native), so one outfit can
  hold max tier in three or four sets at once. The rebalance splits every
  co-activating cluster into distinct roles: the specific set keeps the
  full-strength identity while broad umbrella sets (Dunmer, Native, Nordic,
  Colovian, Imperial, Orsimer, and the class sets) carry only echo-strength
  flats (~10 resist) plus cultural conditionals. Themed outfits now layer
  complementary bonuses — tank + officer + kinship — instead of doubling the
  same stat. `gen_rebalance.py` computes the item-overlap matrix from the set
  data and enforces two rules: no full-strength always-on effect duplicated
  across a co-maxable pair, and no same effect spiking on the same state.
- **Wider condition vocabulary, on every set.** All 136 sets now carry at
  least one conditional (271 total). Beyond the health/time/location motifs:
  level gates (Artifacts wake for veterans, the Militia shelters recruits
  below level 10, the Master's kit answers level 25), skill mastery
  (Wenbone above Marksman 50, Mages Guild above Destruction 50), attribute
  gates (Orcish above Strength 60, Domina above Personality 60), and AND/OR
  states (Thieves Guild's night-time-indoors heists, Ayleid star-magic under
  the open night sky, Scrap's desperation luck, Molecrab's shade-sanctuary).
- Ships for both engines, applied through the public framework API only —
  `MWSE/mods/Static/SetBonusRebalance/` (MWSE) and `OpenMW_SetBonusRebalance/`
  (OpenMW). Item lists, thresholds, and generated spell IDs are untouched;
  uninstall the submodule to return to the default balance.
- For engine parity, the rebalance uses only conditions that evaluate natively
  on both engines (health/magicka/fatigue thresholds, time, sun,
  interior/exterior, race) — no `combat`/`weather`/`flag` conditions.
- New docs: `SetBonus_Rebalance_Reference.md` (design notes + full per-set spell
  list) and `gen_rebalance.py` (generates the OpenMW data file and the reference
  from the canonical MWSE data, with schema validation).

- **OpenMW batch registration** — the `I.SetBonus` interface is now **v2**
  with `registerSets(list)` (and the `SetBonus_registerSets` global event):
  register or replace many sets with one spell-build pass and a single actor
  recompute, instead of a full recompute per `registerSet` call. The
  Conditional Rebalance uses it to apply all 136 sets in one batch (falling
  back to per-set calls on v1). `registerSet` behaviour is unchanged.
- **OpenMW l10n** — added `l10n/SetBonus/en.yaml` so Script Settings option
  values render as readable labels (the Tooltip detail choices); other mods'
  translations can drop in alongside it.

**Fixed**

- **MWSE: generated spell ids no longer overflow the engine's 31-character
  limit.** Long set names with conditional effects ("Redguard Iron Lamellar",
  "Sacred Lands Bonemold") produced sub-spell ids like
  `_sb_redguard_iron_lamellar_max_c1` (33 chars) and crashed the spell build.
  Over-long ids are now shortened deterministically with a small hash, so the
  same set always regenerates the same id (save-safe; short ids unchanged).
- **MWSE: three TR sets (Dunmer, House Redoran, Watchman) silently failed to
  register** because they were all gated on a single item id
  (`T_A_DeChitinHelmOpen01_Hrpen`) that no longer exists in current
  Tamriel_Data — which also silently skipped the umbrella↔vanilla union, so
  vanilla chitin got no Dunmer bonus on MWSE (found in Static's playtest via
  a trace log). Those sets now gate on any of several ids, and the TR add-on
  logs a warning for every expected set it could not register, so TR id drift
  can never be silent again.

- **Cultural umbrellas now cover vanilla gear of the same craft.** TR's
  cultural sets only listed TR-made items, so a vanilla chitin gauntlet gave
  no Dunmer kinship while TR's identically-named mainland pauldron did. The
  TR add-on now unions the matching vanilla sets into the umbrellas at
  registration — **Dunmer** ← Chitin, Bonemold, Netch Leather, Dreugh,
  Cephalopod, House Indoril; **Altmer** ← Glass; **Orsimer** ← Orcish — and
  inherits anything other add-ons fold into those sets. The OpenMW data
  carries the same union statically. (Dunmer's Willpower in the rebalance
  dropped to echo strength since Her Hand now co-maxes with it and owns that
  lane.)

- **OpenMW tooltips now reflect interop changes.** The Inventory Extender
  tooltip runs in the player VM with its own copy of `data.lua`, so sets
  registered, replaced, or amended through the interop (including the
  Conditional Rebalance) displayed with their original effects even though the
  applied abilities were correct. The global script now pushes every
  interop-touched set definition to player scripts (`SetBonus_syncSets`, on
  change and on player join), and the tooltip merges them over its local data.

**Changed**

- **OpenMW: lighter equipment polling in busy cells** (community report on
  1.6: visible Lua cost from `actor.lua` in large cities). NPCs and creatures
  now poll their equipment every 2s instead of 0.5s (the player keeps 0.5s for
  snappy feedback), each actor polls at a random phase so a whole cell no
  longer checks on the same frame, and the per-poll signature reuses its
  buffers instead of allocating. Behaviour is unchanged — recomputes still
  only fire when equipment actually changes.
- **OpenMW: the conditional-effects evaluation is sliced across frames.** The
  1.6 loop reconciled every active actor's condition-gated sub-spells in one
  frame each second — another spike that grew with city size. Each frame now
  handles a small rolling slice (capped at 8 actors/frame, sized to still
  cover the whole roster about once per second), so the cost is flat and
  per-actor refresh latency stays ~1s. External flag pushes
  (`SetBonus_setFlag`) still trigger an immediate full refresh.
- **Compact item tooltips by default.** Community feedback: listing every
  tier's effects (now with condition labels) made tooltips a wall of text —
  and with the cultural umbrellas covering vanilla gear, items in 3-4 sets
  became common (an Indoril Helmet is Dunmer, House Hlaalu, House Indoril,
  and Tribunal Temple) while Morrowind tooltips don't scroll. A new **Tooltip
  detail** option (MWSE MCM / OpenMW Script Settings) picks how much to show,
  and set blocks are ordered by relevance (active first, then progress, then
  name) on both engines:
  - **Compact** (default): the active tier's effects, or a greyed first-tier
    preview whenever the set isn't active — the set name itself turns green
    while its bonus is active, so there are no status lines and no threshold
    text ("need 2", "6+ pieces << active") at all.
  - **Full**: every tier with thresholds and progress lines (the old
    behaviour).
  - **Minimal**: bare set names, green while active.

## 1.6 — Conditional Effects Framework

**Added**
- **Conditional bonuses (MWSE & OpenMW):** Modders can now attach dynamic 
evaluation states to specific effects within a set. The framework splits tier 
abilities into an "always-on" base spell and small sub-spells that are smoothly 
toggled on/off by a lightweight evaluation engine (~1s loop and event hooks) 
as your state  changes. 
- **Comprehensive Condition Vocabulary:** Declarative evaluations support 
absolute and fractional thresholds (`<`, `>`, `==`, etc.) across `health`, 
`magicka`, `fatigue`, `attribute`, `skill`, `level`, `time` (day/night), `sun`, 
`location` (interior/exterior), `race`, and `class`. Includes array support for 
`AND` and `any` (`OR`) structures.
- **Custom Flag hooks:** For states the game engine doesn't expose globally 
(such as OpenMW 0.51's combat or weather state), mods can push state directly 
into the evaluator via `SetBonus_setFlag` (OpenMW) or `Static:SetBonusFlag` (MWSE).
- **Settings Toggle:** "Conditional bonuses" can be toggled on or off in the 
MWSE MCM / OpenMW Script Settings (defaults to ON). When off, the evaluation 
loop rests and sub-spells are not applied. 
- **Tooltip Labels:** Tooltips automatically parse condition blocks to label
context-aware effects, e.g., `Fortify Attack 12 (when HP < 50%)`.

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
