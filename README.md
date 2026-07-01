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
- **Restrained, flat balance** — modest bonuses that barely grow at the top tier,
  so they enhance rather than trivialise. Vanilla magic effects only.
- **Thematic drawbacks** — many sets carry a mild Weakness at mid/max (metal →
  shock, fur/hide → fire, chitin/glass → frost, Altmer → magicka).
- **Players and NPCs** — fully-kitted NPCs benefit too (toggleable).
- **Two magnitude sliders** — scale the benefits and the weakness drawbacks
  independently; set drawbacks to 0 to turn them off entirely.
- **Enchant-friendly** — set pieces are matched by inventory icon as well as by
  ID, so a player-enchanted or copied set item still counts (toggleable).
- **Informative tooltips** *(MWSE)* — hover a set piece to see the set, your
  progress, and each tier's effects with icons; the active tier is highlighted.
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
behind. Items are matched by ID and, optionally, by inventory icon so enchanted
copies keep working.

## In-game options

Toggle everything at runtime — **MWSE:** Mod Config Menu › Set Bonus.
**OpenMW:** Options › Scripts › Set Bonus.

- Tier-change notifications
- Apply bonuses to NPCs
- Match enchanted/copied items by icon
- Set info on item tooltips *(MWSE)*
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
spells for them.

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

Both engines also offer `amendSet` (append items/effects, tweak thresholds),
`addItems`, `registerSetLink`, query helpers, and a way to fully replace or
disable a set. MWSE fires a `Static:SetBonusChanged` event on tier changes. See
the full guides:

- `MWSE/mods/Static/SetBonus/SetBonus_Interop_Guide.md`
- `OpenMW_SetBonus/SetBonus_Interop_OpenMW.md`
- Working example add-on: `OpenMW_SetBonus_Example/`

## Repository layout

```
MWSE/mods/Static/
  logger.lua                 shared logger
  SetBonus/                  core framework
    main.lua                 runtime: counting, tiers, tooltips
    interop.lua              public API + runtime spell building
    config.lua  settings.lua  mcm.lua
    example.lua              minimal author example
    SetBonus_Interop_Guide.md
  ArmorBonus/sets/*.lua      69 base set definitions (Lua-defined bonuses)
  SetBonusTR/  SetBonusOAAB/  SetBonusNOD/  SetBonusAATL/
                             self-detecting companion add-ons

OpenMW_SetBonus/
  setbonus.omwscripts
  scripts/SetBonus/
    global.lua               builds spells, applies tiers, framework API
    actor.lua                per-actor equipment watcher
    player.lua               settings page + notifications
    ietooltip.lua            optional Inventory Extender tooltip integration
    data.lua                 all sets + item links (auto-generated from MWSE)
  README.md  SetBonus_Interop_OpenMW.md
OpenMW_SetBonus_Example/     drop-in example add-on

SetBonus_Changelog.md              version history
Set_Bonus_Spell_Reference.md       full per-set effect reference
```

The MWSE base sets are Lua-defined (no ESP needed); the OpenMW `data.lua` is
generated from the MWSE set definitions so the two stay in sync.

## Changelog

See `SetBonus_Changelog.md`. Current release: **1.5.1** (optional Consistent
Enchanting and Inventory Extender integrations).

## Credits & license

Created by Static. Built on MWSE and the OpenMW Lua API. Inspired by the armour
set design of *The Elder Scrolls Online*.

No license is specified yet — if you'd like to reuse the code or build on the
framework, please get in touch via the Nexus page.
