# Set Bonus

*Wear the whole set, reap the reward.*

A framework mod for **The Elder Scrolls III: Morrowind** that turns matched armour
into a reward. Equip several pieces of the same set and gain a constant,
lore-flavoured bonus that grows the more of the set you wear — Iron makes you
tough, Glass keeps you nimble, Daedric wards off magic, Dark Brotherhood sharpens
your sneak attacks. Over **130 sets** in all, each themed to its material,
culture, or faction (with a nod to ESO-style set design).

Because a single piece can belong to more than one set, bonuses **stack**, and
magnitudes are tuned with that in mind — committing to a theme is rewarding
without breaking the game.

- **Nexus Mods:** https://www.nexusmods.com/morrowind/mods/52911
- **Showcase video:** https://youtu.be/BHBtxWz5Xcg

Ships in two flavours from a single codebase — pick the one for your engine:

| Version | Engine | Requirement |
|---------|--------|-------------|
| **Set Bonus (MWSE)** | Original Morrowind + [MWSE](https://www.nexusmods.com/morrowind/mods/45468) | MWSE 2.1+ (run MWSE-Update) |
| **Set Bonus (OpenMW)** | [OpenMW](https://openmw.org/) | OpenMW 0.51+ (runtime spell creation) |

> Don't run both for the same game — they do the same thing.

## Features

- **130+ armour sets** across every vanilla material and culture, plus Tribunal
  and Bloodmoon.
- **Three tiers per set** — bonuses scale up at 2, 4, and 6+ equipped pieces
  (thresholds are per-set configurable).
- **Conditional bonuses (New in 1.6, widened in 1.7.1)** — dynamic effects that
  activate based on runtime states: health/magicka/fatigue thresholds, time of
  day, location, carry weight, faction rank & standing, bounty, region,
  birthsign, werewolf form, and weapon stance — singly or combined with AND/OR.
- **Restrained, flat balance** — modest bonuses that barely grow at the top tier,
  so they enhance rather than trivialise. Vanilla magic effects only.
- **Thematic drawbacks** — many sets carry a mild Weakness at mid/max (metal →
  shock, fur/hide → fire, chitin/glass → frost, Altmer → magicka).
- **Conditional Rebalance (New in 1.7, deepened in 1.7.1)** — an optional submodule
  (both engines) that replaces every set's bonuses with a spikier, condition-driven
  balance. As of 1.7.1 every set's Weakness drawback is situational rather than
  flat, and faction sets scale with your standing. Don't like the default sets'
  effects? Drop it in; remove it to go back.
- **Full Armor-class sets (New in 1.7.1)** — the Heavy / Medium / Light Armor sets
  now include every piece of their weight class across the base game and all
  supported add-ons, generated straight from the armour data.
- **Self-healing spell management (New in 1.7.2)** — The engine now automatically 
  purges orphaned "ghost" spells and corrects desynced conditional tracking on load, 
  ensuring consistent performance across save/reload cycles.
- **Optional Flag Companion (New in 1.7.1)** — a small opt-in add-on that feeds
  combat, weather, and movement state to the framework so author-made sets can
  react to them. Not needed for the base mod.
- **Players and NPCs** — fully-kitted NPCs benefit too (toggleable).
- **Two magnitude sliders** — scale the benefits and the weakness drawbacks
  independently; set drawbacks to 0 to turn them off entirely.
- **Enchant-friendly** — set pieces are matched by inventory icon and mesh, as
  well as by ID, so a player-enchanted or copied set item still counts
  (toggleable).
- **Informative tooltips** — hover a set piece to see the set, your progress,
  and its effects with the active tier highlighted. Compact by default (the
  active tier's effects, or a greyed preview when the set isn't active);
  switchable to full or minimal detail.
- **No plugin required** — every bonus spell is built at runtime in Lua. No ESP,
  nothing to clutter your load order, no record conflicts.
- **Mod-aware** — automatically extends to Tamriel Rebuilt, OAAB, NOD, and AATL
  armour when those are installed.
- **Modder framework** — a small, stable interop lets other mods register,
  amend, replace, or disable sets (both engines).

## Installation

### MWSE
Install with a mod manager, or extract into your Morrowind `Data Files` folder so
the scripts land in `Data Files/MWSE/mods/Static`. There is no ESP to tick — run
MWSE-Update to make sure your MWSE is current, then launch.

### OpenMW
Add the `OpenMW_SetBonus` folder as a data directory and enable its content file:

```
data="/path/to/OpenMW_SetBonus"
content=setbonus.omwscripts
```

Point the data path at the `OpenMW_SetBonus` folder **itself** — the one that
directly contains `setbonus.omwscripts`.

## How it works

While you wear a set you carry a constant-effect ability whose strength matches
how many pieces you have on; swap gear and it updates instantly. The bonus spells
are generated in Lua at load (`tes3.createObject` on MWSE, `world.createRecord`
on OpenMW), so there are no spell records in any plugin to conflict or leave
behind. Items are matched by ID and, optionally, by inventory icon+mesh so
enchanted copies keep working without cross-matching unrelated items that
merely reuse the same icon.

## In-game options

Toggle everything at runtime — **MWSE:** Mod Config Menu › Set Bonus.
**OpenMW:** Options › Scripts › Set Bonus.

- Tier-change notifications
- Apply bonuses to NPCs
- Match enchanted/copied items by icon
- Set info on item tooltips, with a detail level — compact (the default:
  active tier, or a greyed first-tier preview when not active), full (all
  tiers with thresholds), or minimal (bare set names)
- Benefit magnitude scale, and a separate Weakness (drawback) scale
- Debug logging

## Balance at a glance

Constant-effect bonuses at 2 / 4 / 6+ pieces, vanilla effects only. Values are
deliberately low and flat: elemental/disease resist 10 / 15 / 20, magic resist
5 / 8 / 12, Reflect & Spell Absorption 3 / 5 / 8, Sanctuary/Chameleon 5 / 7 / 10,
attributes 3 / 5 / 8, skills 5 / 8 / 12, health 8 / 12 / 18, fatigue 12 / 20 / 28,
attack 3 / 5 / 8. Most sets add a mild Weakness (~10 / 20) at mid/max. Both
engines round magnitudes to whole numbers and never scale over-time effects down
to zero. The full per-set breakdown is in `Set_Bonus_Spell_Reference.md`.

## Optional: Conditional Rebalance submodule

Prefer bonuses that react to the fight instead of flat stats? The **Conditional
Rebalance** is an optional add-on that re-registers every set's bonuses through
the framework's own interop: each set keeps a lean always-on identity and gains
**situational spikes** (~1.5–2× stronger, active only while a state holds),
themed to the kind of set —

- **Heavy materials** answer pain: Iron hits harder *bloodied* (HP < 50%),
  Daedric turns terrible on a *last stand* (HP < 25%), Dwemer plate reflects in
  the deep halls it was made for (indoors).
- **Light materials** favour darkness and open sky: Leather sneaks at night,
  Hide runs outdoors, Glass is untouchable while unscratched.
- **Cultural sets** reward their own: Nordic grants Nords extra Attack, Khajiit
  gear pounces at night, Redguard kit surges when fatigue runs low.
- **Faction sets** mirror their trade, and (new in 1.7.1) **scale with your
  standing**: guild and Great House gear grows once you make rank, the Temple
  heals at wayshrines, Thieves Guild peaks on a night-time indoor job — and
  lawful or holy armour spurns a wanted wearer.
- **Class sets** (Light/Medium/Heavy Armor, Cloth) turn purely reactive so they
  complement — not double — the material sets that share their items.

**New in 1.7.1 — every drawback is now situational.** Instead of a flat
penalty, each set's Weakness bites only in its thematic bad moment (at a
slightly steeper magnitude to offset the reduced uptime): metals can't shed a
bolt under a full pack, leathers and furs catch fire near a hearth, resin and
chitin go brittle in the cold dark, Daedric punishes cowards who dodge the
fight, Falmer still burns in daylight.

Because items commonly belong to several sets at once (a Chuzei helm is also
Bonemold, Dunmer, and Native), co-activating clusters are split into **lanes**:
the specific set keeps the full-strength identity, umbrella sets add only
echo-strength flats plus cultural conditionals, and the build script rejects
any two co-maxable sets that duplicate a full-strength effect or spike the same
effect on the same state. Conditions range from health/fatigue/magicka
thresholds through time, sun, location, and (new in 1.7.1) carry weight,
faction rank & standing, bounty, region, birthsign, werewolf form, and weapon
stance, to race, level, skill/attribute mastery, and AND/OR combinations.

Weakness drawbacks stay and both magnitude sliders still apply. All 137 sets
are covered (460 conditional effects in total); entries for absent add-ons are
skipped.
Only conditions that evaluate natively on **both engines** are used, so MWSE and
OpenMW behave identically. Install alongside Set Bonus 1.6+:

| Engine | Install | Uninstall |
|--------|---------|-----------|
| MWSE | copy `MWSE/mods/Static/SetBonusRebalance` in | delete the folder |
| OpenMW | add `OpenMW_SetBonusRebalance` as a data dir, enable `setbonus_rebalance.omwscripts` | disable the content file |

Full design notes and the complete per-set spell list:
`SetBonus_Rebalance_Reference.md`.

## Companion modules

External-mod armour is folded into the matching sets by optional, self-detecting
add-ons that only act when the target mod is present:

- **Tamriel Rebuilt** — hundreds of TR pieces mapped, plus new TR-flavoured sets.
- **OAAB_Data**, **NOD**, **AATL** — their armour, bucklers, and artifacts
  re-linked to the right sets.

It edits no armour or NPC records, so it's compatible with essentially everything
and load order doesn't matter.

## Optional integrations

These are soft dependencies — they enhance the mod when present and are ignored
otherwise:

- **Consistent Enchanting** *(MWSE)* — when it records an item's base object,
  player-enchanted set pieces are matched by that exact base item (no icon
  false-positives, works with icon matching off).
- **Inventory Extender** *(OpenMW)* — provides the tooltip hook OpenMW otherwise
  lacks, enabling the item-tooltip set display on OpenMW.

## For mod authors

Other mods can register their own sets and let Set Bonus build and manage the
spells for them. As of 1.6, you can add conditional evaluation logic directly 
to any effect.

**MWSE** — `require` the interop from anywhere:

```lua
local setBonus = require("Static.SetBonus.interop")
setBonus.registerSet{
    name = "My Set",
    items = { "my_helm", "my_cuirass", "my_greaves", "my_boots" },
    bonuses = {
        min = { { effect = "resistFire", magnitude = 10 } },
        max = { { effect = "resistFire", magnitude = 20 },
                { effect = "fortifySkill", skill = "longBlade", magnitude = 12 } },
    },
}
```

an MWSE example with conditional evaluation:

```lua
local setBonus = require("Static.SetBonus.interop")
setBonus.registerSet{
    name = "Bloodmoon Reaver",
    items = { "brv_helm", "brv_cuirass", "brv_greaves", "brv_boots" },
    bonuses = {
        max = {
            { effect = "resistFrost", magnitude = 20 }, -- always on
            { effect = "fortifyAttack", magnitude = 12, 
              condition = { kind = "health", op = "<", value = 0.5, fraction = true } }, -- bloodied
            { effect = "chameleon", magnitude = 20, 
              condition = { { kind = "time", value = "night" }, { kind = "location", value = "exterior" } } } -- AND array
        },
    },
}
```

**OpenMW** — from a global script via the `I.SetBonus` interface (or the matching
global events for any script type):

```lua
local I = require('openmw.interfaces')
I.SetBonus.registerSet{
    name  = 'My Set',
    items = { 'my_helm', 'my_cuirass', 'my_greaves', 'my_boots' },
    bonuses = {
        min = { { effect = 'resistfire', mag = 10 } },
        max = { { effect = 'resistfire', mag = 20 },
                { effect = 'fortifyskill', skill = 'longblade', mag = 12 } },
    },
}
```

an OpenMW example with conditional evaluation:

```lua
local I = require('openmw.interfaces')
I.SetBonus.registerSet{
    name  = 'Bloodmoon Reaver',
    items = { 'brv_helm', 'brv_cuirass', 'brv_greaves', 'brv_boots' },
    bonuses = {
        max = {
            { effect = 'resistfrost', mag = 20 }, -- always on
            { effect = 'fortifyattack', mag = 12, 
              condition = { kind = 'health', op = '<', value = 0.5, fraction = true } }
        },
    },
}
```

Supported Conditions: `health`, `magicka`, `fatigue`, `attribute`, `skill`, `level`, `time`,
`sun`, `location`, `race`, `class`, `encumbrance`, `faction`, `bounty`, `region`,
`birthsign`, `sex`, `werewolf`, `stance` (`faction`/`bounty`/`birthsign` are
player-scoped and evaluate false for NPCs).

Custom Flags (OpenMW Combat/Weather): Because OpenMW 0.51 lacks global reads for 
combat state and weather, these states fail-safe to `false` natively. Mods 
detecting combat/weather can push state directly into Set Bonus to evaluate:

OpenMW: `core.sendGlobalEvent('SetBonus_setFlag', { actor = someActor, id = 'combat', value = true })`

MWSE: `event.trigger("Static:SetBonusFlag", { reference = ref, id = 'combat', value = true })`

Don't want to wire that up yourself? The optional **Flag Companion** add-on
(`SetBonusFlags`, both engines, new in 1.7.1) already does this: MWSE gets
`combat`/`weather`/`movement`/`swimming`/`sneaking`; OpenMW gets `swimming`/`moving`
(its Lua can't read weather or combat), leaving the hook open for a dedicated
mod to feed the rest. See `SetBonus_Flags_Companion.md`.

Both engines also offer `amendSet` (append items/effects, tweak thresholds),
`addItems`, `registerSetLink`, query helpers, and a way to fully replace or
disable a set. On OpenMW, interface **v2** adds `registerSets(list)` (and the
`SetBonus_registerSets` event) to register many sets with a single rebuild and
actor recompute — the Conditional Rebalance applies all 137 sets that way.
MWSE fires a `Static:SetBonusChanged` event on tier changes.

Shipping for both engines? Prefer conditions that evaluate natively everywhere
(health/magicka/fatigue, attribute, skill, level, time, sun, location, race,
class) — `combat`/`weather`/`flag` need fed-in state on OpenMW. See the full
guides:

- `MWSE/mods/Static/SetBonus/SetBonus_Interop_Guide.md`
- `OpenMW_SetBonus/SetBonus_Interop_OpenMW.md`
- Working example add-on: `OpenMW_SetBonus_Example/`

## Repository layout

```
SetBonus-metadata.toml       MWSE metadata file for mod managers
MWSE/mods/Static/
  SetBonus/                  Core MWSE framework logic
    main.lua                 Handles runtime counting, tiers, and tooltips
    interop.lua              Public API for other mods and spell building
    config.lua               Handles mod configuration data
    settings.lua             Manages user settings state
    mcm.lua                  Mod Config Menu interface
    conditions.lua           Engine for evaluating state-based conditions
    logger.lua               Module-specific logger
    example.lua              Minimal example for mod authors
    SetBonus_Interop_Guide.md Documentation for mod authors
  ArmorBonus/sets/*.lua      Lua definitions for 70 base armor sets
  SetBonusTR/                Add-on for Tamriel Rebuilt support
  SetBonusOAAB/              Add-on for OAAB_Data support
  SetBonusNOD/               Add-on for NOD support
  SetBonusAATL/              Add-on for AATL support
  SetBonusRebalance/         Optional Conditional Rebalance submodule (MWSE)
    main.lua                 Applies the rebalance through the interop
    data.lua                 Canonical rebalance definitions (both engines)
  SetBonusFlags/              Optional Flag Companion (MWSE) — feeds
                               combat/weather/movement/swimming/sneaking to
                               the flag hook

OpenMW_SetBonus/
  setbonus.omwscripts        Main OpenMW content file
  scripts/SetBonus/
    global.lua               Handles spell building, tiers, and framework API
    actor.lua                Monitors actor equipment changes
    player.lua               Manages settings and user notifications
    ietooltip.lua            Hooks into Inventory Extender for tooltips
    data.lua                 Auto-generated set and item link definitions
    conditions.lua           OpenMW-side state evaluation engine
    SetBonus_Interop_OpenMW.md Documentation for OpenMW mod authors
OpenMW_SetBonus_Example/     Drop-in project example for OpenMW developers

OpenMW_SetBonusRebalance/    Optional Conditional Rebalance submodule (OpenMW)
  setbonus_rebalance.omwscripts  Content file for the submodule
  scripts/SetBonusRebalance/
    main.lua                 Applies the rebalance via I.SetBonus
    data.lua                 Generated from the MWSE rebalance data

OpenMW_SetBonusFlags/        Optional Flag Companion (OpenMW) — feeds
                              swimming/movement to the flag hook (see
                              SetBonus_Flags_Companion.md for exact contents)

SetBonus_Changelog.md        Full version history
Set_Bonus_Spell_Reference.md Reference for all per-set effects (default balance)
SetBonus_Rebalance_Reference.md Reference for the Conditional Rebalance submodule
gen_rebalance.py             Generates the OpenMW rebalance data + reference doc
README.md                    Primary project documentation

```

The MWSE base sets are Lua-defined (no ESP needed); the OpenMW `data.lua` is
generated from the MWSE set definitions so the two stay in sync.

## Changelog

See `SetBonus_Changelog.md`. Current release: **1.7.2** (fully populated
Armor-class sets, a much wider cross-engine condition vocabulary, situational
Rebalance drawbacks, and the optional Flag Companion).

## Credits & license

Created by Static. Built on MWSE and the OpenMW Lua API. Inspired by the armour
set design of *The Elder Scrolls Online*.

No license is specified yet — if you'd like to reuse the code or build on the
framework, please get in touch via the Nexus page.
