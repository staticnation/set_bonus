# Set Bonus — Spell Reference

Constant-effect armour set bonuses: wearing several pieces of a set grants a scaling ability, by default at **2 / 4 / 6+** pieces (some sets override this).

All bonuses are **defined in Lua and built at runtime — no ESP required**. Vanilla Morrowind/Tribunal/Bloodmoon magic effects only. "/s" marks per-second Restore effects.

**Layout**

- **Base mod** (`MWSE/mods/Static/ArmorBonus`) — 69 sets of base-game / other-mod armour.
- **Tamriel Rebuilt add-on** (`MWSE/mods/Static/SetBonusTR`, active only when TR is installed) — 27 new TR sets + 40 TR-only sets relocated from the base mod, and 42 existing sets that gain TR items.


---

## Base mod sets (69)

### Adamantium
- **min:** Resist Magicka 10
- **mid:** Resist Magicka 20, Reflect 8
- **max:** Resist Magicka 30, Reflect 12, Shield 10

### Armun-An
- **min:** Resist Fire 15
- **mid:** Resist Fire 25, Fortify Health 20
- **max:** Resist Fire 40, Fortify Health 35, Shield 10

### Artifacts
- **min:** Resist Magicka 10, Fortify Luck 5
- **mid:** Resist Magicka 20, Fortify Luck 10, Reflect 8
- **max:** Resist Magicka 30, Fortify Luck 15, Reflect 12, Spell Absorption 15

### Bear Fur
- **min:** Resist Frost 20
- **mid:** Resist Frost 35, Fortify Endurance 10
- **max:** Resist Frost 50, Fortify Endurance 15, Fortify Health 25

### Bearskin
- **min:** Resist Frost 15, Fortify Strength 5
- **mid:** Resist Frost 30, Fortify Strength 10, Fortify Health 20
- **max:** Resist Frost 45, Fortify Strength 15, Fortify Health 35

### Bonemold
- **min:** Fortify Health 10, Resist Blight Disease 10
- **mid:** Fortify Health 20, Resist Blight Disease 20, Restore Fatigue 1 /s
- **max:** Fortify Health 35, Resist Blight Disease 30, Restore Fatigue 2 /s, Shield 10

### Bosmer
- **min:** Resist Poison 15, Fortify Agility 5
- **mid:** Resist Poison 25, Fortify Agility 10, Fortify Marksman 15
- **max:** Resist Poison 40, Fortify Agility 15, Fortify Marksman 25, Resist Common Disease 30

### Bronze
- **min:** Shield 5, Resist Shock 10
- **mid:** Shield 10, Resist Shock 20, Fortify Endurance 5
- **max:** Shield 15, Resist Shock 35, Fortify Endurance 10

### Cephalopod
- **min:** Swift Swim 30, Water Breathing 1
- **mid:** Swift Swim 50, Water Breathing 1, Sanctuary 8
- **max:** Swift Swim 70, Water Breathing 1, Sanctuary 15, Resist Frost 25

### Chain Mail
- **min:** Fortify Fatigue 25
- **mid:** Fortify Fatigue 40, Resist Normal Weapons 5
- **max:** Fortify Fatigue 60, Resist Normal Weapons 10, Shield 5

### Chitin
- **min:** Resist Blight Disease 15, Resist Poison 15
- **mid:** Resist Blight Disease 25, Resist Poison 25, Resist Paralysis 15
- **max:** Resist Blight Disease 40, Resist Poison 40, Resist Paralysis 30, Fortify Agility 10

### Cloth
- **min:** Restore Magicka 1 /s, Feather 5
- **mid:** Restore Magicka 2 /s, Feather 10, Fortify Alteration 10
- **max:** Restore Magicka 3 /s, Feather 20, Fortify Alteration 20, Fortify Intelligence 10

### Colovian
- **min:** Resist Frost 15, Fortify Endurance 5
- **mid:** Resist Frost 30, Fortify Endurance 10, Fortify Attack Bonus 10
- **max:** Resist Frost 45, Fortify Endurance 15, Fortify Attack Bonus 15, Fortify Health 25

### Daedric
- **min:** Spell Absorption 10
- **mid:** Spell Absorption 15, Resist Magicka 20
- **max:** Spell Absorption 20, Resist Magicka 30, Resist Normal Weapons 10, Fortify Attack Bonus 15

### Dark Brotherhood
- **min:** Fortify Sneak 10, Resist Poison 10
- **mid:** Fortify Sneak 20, Resist Poison 20, Chameleon 10
- **max:** Fortify Sneak 30, Resist Poison 35, Chameleon 20, Fortify Attack Bonus 15

### Dragonbone  *(stub — add items to enable)*
- **min:** Resist Fire 20, Fortify Health 15
- **mid:** Resist Fire 35, Fortify Health 25, Shield 10
- **max:** Resist Fire 60, Fortify Health 45, Shield 15, Resist Magicka 20

### Dragonscale
- **min:** Resist Fire 20
- **mid:** Resist Fire 35, Resist Magicka 15
- **max:** Resist Fire 60, Resist Magicka 25, Shield 10, Fortify Agility 10

### House Dres
- **min:** Resist Poison 15, Resist Fire 15
- **mid:** Resist Poison 25, Resist Fire 25, Fortify Long Blade 10
- **max:** Resist Poison 40, Resist Fire 40, Fortify Long Blade 20, Fortify Endurance 10

### Dreugh
- **min:** Resist Shock 15, Water Breathing 1
- **mid:** Resist Shock 30, Water Breathing 1, Swift Swim 40
- **max:** Resist Shock 50, Water Breathing 1, Swift Swim 60, Lightning Shield 10

### Dwemer
- **min:** Resist Shock 15
- **mid:** Resist Shock 30, Reflect 8
- **max:** Resist Shock 50, Reflect 12, Sanctuary 10

### Ebony
- **min:** Resist Fire 15, Fortify Health 15
- **mid:** Resist Fire 25, Fortify Health 25, Shield 10
- **max:** Resist Fire 40, Fortify Health 40, Shield 15, Resist Magicka 15

### Embossed  *(stub — add items to enable)*
- **min:** Fortify Personality 5
- **mid:** Fortify Personality 10, Fortify Speechcraft 10
- **max:** Fortify Personality 15, Fortify Speechcraft 20, Fortify Luck 5

### Engraved
- **min:** Resist Magicka 10
- **mid:** Resist Magicka 20, Fortify Personality 10
- **max:** Resist Magicka 30, Fortify Personality 15, Spell Absorption 10

### Falmer  *(stub — add items to enable)*
- **min:** Resist Frost 20, Chameleon 5
- **mid:** Resist Frost 35, Chameleon 10, Night Eye 25
- **max:** Resist Frost 60, Chameleon 15, Night Eye 50, Frost Shield 10

### Fighters Guild  *(stub — add items to enable)*
- **min:** Fortify Attack Bonus 5, Fortify Health 10
- **mid:** Fortify Attack Bonus 10, Fortify Health 20, Fortify Fatigue 40
- **max:** Fortify Attack Bonus 15, Fortify Health 35, Fortify Fatigue 60, Fortify Strength 10

### Fur
- **min:** Resist Frost 15, Fortify Fatigue 20
- **mid:** Resist Frost 30, Fortify Fatigue 35
- **max:** Resist Frost 50, Fortify Fatigue 50, Fortify Endurance 10

### Gah-Julan
- **min:** Fortify Health 10, Resist Blight Disease 10
- **mid:** Fortify Health 25, Resist Blight Disease 20, Shield 10
- **max:** Fortify Health 40, Resist Blight Disease 30, Shield 15, Resist Fire 20

### Glass
- **min:** Fortify Agility 5, Resist Fire 10
- **mid:** Fortify Agility 10, Resist Fire 20, Sanctuary 8
- **max:** Fortify Agility 15, Resist Fire 30, Sanctuary 12, Chameleon 15

### Goblin
- **min:** Fortify Strength 5, Resist Common Disease 15
- **mid:** Fortify Strength 10, Resist Common Disease 25, Fortify Fatigue 30
- **max:** Fortify Strength 15, Resist Common Disease 40, Fortify Fatigue 50, Fortify Attack Bonus 10

### Guard
- **min:** Fortify Health 10, Shield 5
- **mid:** Fortify Health 20, Shield 10, Fortify Endurance 10
- **max:** Fortify Health 35, Shield 15, Fortify Endurance 15

### Heavy Armor
- **min:** Shield 5, Fortify Health 10
- **mid:** Shield 10, Fortify Health 25, Fortify Endurance 10
- **max:** Shield 15, Fortify Health 40, Fortify Endurance 15, Resist Normal Weapons 8

### Her Hand
- **min:** Resist Magicka 15, Fortify Health 10
- **mid:** Resist Magicka 25, Fortify Health 20, Fortify Restoration 15
- **max:** Resist Magicka 40, Fortify Health 35, Turn Undead 30, Fortify Restoration 25

### Hide
- **min:** Fortify Fatigue 20
- **mid:** Fortify Fatigue 35, Fortify Athletics 10
- **max:** Fortify Fatigue 50, Fortify Athletics 20, Fortify Speed 5

### House Hlaalu
- **min:** Fortify Mercantile 10, Fortify Personality 5
- **mid:** Fortify Mercantile 20, Fortify Personality 10, Fortify Speechcraft 15
- **max:** Fortify Mercantile 30, Fortify Personality 15, Fortify Speechcraft 25, Fortify Luck 10

### Imperial
- **min:** Fortify Personality 5, Fortify Speechcraft 10
- **mid:** Fortify Personality 10, Fortify Speechcraft 15, Fortify Mercantile 15
- **max:** Fortify Personality 15, Fortify Speechcraft 25, Fortify Mercantile 20, Fortify Attack Bonus 10

### House Indoril
- **min:** Resist Magicka 15, Fortify Restoration 10
- **mid:** Resist Magicka 25, Fortify Restoration 20, Fortify Personality 10
- **max:** Resist Magicka 40, Fortify Restoration 30, Fortify Personality 15, Turn Undead 25

### Iron
- **min:** Fortify Health 10
- **mid:** Fortify Health 20, Fortify Fatigue 25
- **max:** Fortify Health 35, Fortify Fatigue 50, Shield 10

### Khajiit
- **min:** Night Eye 25, Fortify Agility 5
- **mid:** Night Eye 50, Fortify Agility 10, Fortify Acrobatics 10
- **max:** Night Eye 75, Fortify Agility 15, Fortify Acrobatics 20, Fortify Hand To Hand 20

### Kynareth
- **min:** Slow Fall 10, Resist Shock 10
- **mid:** Slow Fall 20, Resist Shock 20, Fortify Speed 10
- **max:** Slow Fall 30, Resist Shock 35, Fortify Speed 15, Fortify Fatigue 50

### Leather
- **min:** Fortify Fatigue 20, Fortify Acrobatics 5
- **mid:** Fortify Fatigue 35, Fortify Acrobatics 10, Fortify Sneak 10
- **max:** Fortify Fatigue 50, Fortify Acrobatics 15, Fortify Sneak 15, Fortify Agility 10

### Light Armor
- **min:** Fortify Fatigue 25, Fortify Agility 5
- **mid:** Fortify Fatigue 40, Fortify Agility 10, Sanctuary 8
- **max:** Fortify Fatigue 60, Fortify Agility 15, Sanctuary 12, Fortify Acrobatics 15

### Mages Guild  *(stub — add items to enable)*
- **min:** Restore Magicka 1 /s, Fortify Destruction 5
- **mid:** Restore Magicka 2 /s, Fortify Destruction 10, Resist Magicka 15
- **max:** Restore Magicka 3 /s, Fortify Destruction 20, Resist Magicka 25, Fortify Intelligence 15

### Master
- **min:** Fortify Luck 5, Fortify Fatigue 20
- **mid:** Fortify Luck 10, Fortify Fatigue 40, Fortify Health 20
- **max:** Fortify Luck 15, Fortify Fatigue 60, Fortify Health 30, Fortify Attack Bonus 10

### Medium Armor
- **min:** Fortify Fatigue 25, Shield 5
- **mid:** Fortify Fatigue 40, Shield 8, Fortify Health 20
- **max:** Fortify Fatigue 60, Shield 12, Fortify Health 30, Fortify Endurance 10

### Morag Tong
- **min:** Resist Poison 15, Fortify Short Blade 10
- **mid:** Resist Poison 25, Fortify Short Blade 20, Fortify Sneak 15
- **max:** Resist Poison 40, Fortify Short Blade 30, Fortify Sneak 25, Chameleon 15

### Native
- **min:** Resist Blight Disease 15, Resist Poison 15
- **mid:** Resist Blight Disease 25, Resist Poison 25, Fortify Athletics 10
- **max:** Resist Blight Disease 40, Resist Poison 40, Fortify Athletics 20, Resist Fire 25

### Netch Leather
- **min:** Fortify Fatigue 25, Resist Poison 10
- **mid:** Fortify Fatigue 40, Resist Poison 20, Fortify Athletics 10
- **max:** Fortify Fatigue 60, Resist Poison 35, Fortify Athletics 20, Fortify Speed 10

### Newtscale
- **min:** Resist Poison 15, Swift Swim 20
- **mid:** Resist Poison 25, Swift Swim 40, Water Breathing 1
- **max:** Resist Poison 40, Swift Swim 60, Water Breathing 1, Resist Common Disease 30

### Nordic
- **min:** Resist Frost 25, Resist Shock 10
- **mid:** Resist Frost 40, Resist Shock 20, Fortify Strength 10
- **max:** Resist Frost 60, Resist Shock 35, Fortify Strength 15, Fortify Health 25

### Orcish
- **min:** Fortify Health 15, Fortify Strength 5
- **mid:** Fortify Health 25, Fortify Strength 10, Fortify Fatigue 30
- **max:** Fortify Health 40, Fortify Strength 15, Fortify Fatigue 50, Fortify Attack Bonus 10

### Orsimer
- **min:** Fortify Strength 5, Fortify Health 10
- **mid:** Fortify Strength 10, Fortify Health 20, Resist Magicka 10
- **max:** Fortify Strength 15, Fortify Health 35, Resist Magicka 20, Fortify Attack Bonus 10

### Padded
- **min:** Fortify Fatigue 25
- **mid:** Fortify Fatigue 40, Resist Frost 10
- **max:** Fortify Fatigue 60, Resist Frost 20, Fortify Health 15

### Plate
- **min:** Shield 10, Fortify Health 10
- **mid:** Shield 15, Fortify Health 25, Resist Normal Weapons 8
- **max:** Shield 20, Fortify Health 45, Resist Normal Weapons 15

### Resin Molded  *(stub — add items to enable)*
- **min:** Resist Blight Disease 15
- **mid:** Resist Blight Disease 25, Fortify Fatigue 30
- **max:** Resist Blight Disease 40, Fortify Fatigue 50, Resist Poison 25

### Ring Mail
- **min:** Fortify Fatigue 20, Fortify Agility 5
- **mid:** Fortify Fatigue 35, Fortify Agility 10
- **max:** Fortify Fatigue 50, Fortify Agility 15, Shield 5

### Royal Guard
- **min:** Fortify Health 15, Shield 8
- **mid:** Fortify Health 25, Shield 12, Resist Magicka 15
- **max:** Fortify Health 45, Shield 18, Resist Magicka 25, Fortify Attack Bonus 15

### Scale Mail
- **min:** Shield 5, Resist Normal Weapons 5
- **mid:** Shield 10, Resist Normal Weapons 8
- **max:** Shield 15, Resist Normal Weapons 12, Fortify Health 20

### Scrap
- **min:** Fortify Luck 5
- **mid:** Fortify Luck 10, Fortify Fatigue 25
- **max:** Fortify Luck 15, Fortify Fatigue 50, Shield 5

### Silver
- **min:** Resist Magicka 10
- **mid:** Resist Magicka 20, Turn Undead 15
- **max:** Resist Magicka 30, Turn Undead 30, Spell Absorption 10

### Splint
- **min:** Shield 8, Fortify Health 10
- **mid:** Shield 12, Fortify Health 20
- **max:** Shield 18, Fortify Health 35, Resist Normal Weapons 8

### Stalhrim
- **min:** Resist Frost 20
- **mid:** Resist Frost 35, Restore Magicka 1 /s
- **max:** Resist Frost 60, Restore Magicka 2 /s, Frost Shield 15

### Steel
- **min:** Fortify Health 10, Fortify Attack Bonus 5
- **mid:** Fortify Health 20, Fortify Attack Bonus 10
- **max:** Fortify Health 30, Fortify Attack Bonus 15, Shield 10

### Studded
- **min:** Fortify Fatigue 20, Resist Normal Weapons 3
- **mid:** Fortify Fatigue 35, Resist Normal Weapons 5
- **max:** Fortify Fatigue 50, Resist Normal Weapons 10, Shield 5

### House Telvanni
- **min:** Restore Magicka 1 /s, Fortify Intelligence 5
- **mid:** Restore Magicka 2 /s, Fortify Intelligence 10, Fortify Mysticism 15
- **max:** Restore Magicka 3 /s, Fortify Intelligence 15, Fortify Mysticism 25, Fortify Destruction 20

### Templar
- **min:** Fortify Health 10, Turn Undead 15
- **mid:** Fortify Health 20, Turn Undead 25, Resist Magicka 15
- **max:** Fortify Health 35, Turn Undead 40, Resist Magicka 25, Fortify Attack Bonus 10

### Thieves Guild  *(stub — add items to enable)*
- **min:** Fortify Sneak 10, Fortify Security 10
- **mid:** Fortify Sneak 15, Fortify Security 20, Chameleon 10
- **max:** Fortify Sneak 25, Fortify Security 30, Chameleon 20, Fortify Agility 10

### Tribunal Temple
- **min:** Resist Magicka 15, Fortify Restoration 10
- **mid:** Resist Magicka 25, Fortify Restoration 20, Restore Health 1 /s
- **max:** Resist Magicka 40, Fortify Restoration 30, Restore Health 2 /s, Turn Undead 30

### Trollbone
- **min:** Restore Health 1 /s
- **mid:** Restore Health 2 /s, Resist Frost 15
- **max:** Restore Health 3 /s, Resist Frost 30, Fortify Health 25

### Wolf Fur
- **min:** Resist Frost 15, Fortify Speed 5
- **mid:** Resist Frost 30, Fortify Speed 10, Night Eye 25
- **max:** Resist Frost 45, Fortify Speed 15, Night Eye 50, Fortify Athletics 15


---

## Add-on sets (67)

*Tag: (relocated) = was an all-TR set moved out of the base mod; otherwise newly added.*

### Alessian Bronze
- **min:** Fortify Health 10, Resist Magicka 10
- **mid:** Fortify Health 20, Resist Magicka 20, Fortify Attack Bonus 10
- **max:** Fortify Health 35, Resist Magicka 30, Fortify Attack Bonus 15, Turn Undead 25

### Alit Hide
- **min:** Fortify Agility 5, Resist Poison 10
- **mid:** Fortify Agility 10, Resist Poison 20, Fortify Athletics 15
- **max:** Fortify Agility 15, Resist Poison 35, Fortify Athletics 25, Fortify Attack Bonus 10

### Altmer  *(relocated)*
- **min:** Restore Magicka 1 /s, Fortify Intelligence 5
- **mid:** Restore Magicka 2 /s, Fortify Intelligence 10, Fortify Destruction 10
- **max:** Restore Magicka 3 /s, Fortify Intelligence 15, Fortify Destruction 20, Fortify Alteration 15

### Ancient Nordic
- **min:** Resist Frost 20, Fortify Health 10
- **mid:** Resist Frost 35, Fortify Health 25, Shield 10
- **max:** Resist Frost 50, Fortify Health 40, Shield 15, Turn Undead 25

### Anvil  *(relocated)*
- **min:** Water Breathing 1, Swift Swim 30
- **mid:** Water Breathing 1, Swift Swim 50, Resist Frost 20
- **max:** Water Breathing 1, Swift Swim 70, Resist Frost 35, Fortify Personality 10

### Argonian  *(relocated)*
- **min:** Water Breathing 1, Resist Poison 15
- **mid:** Water Breathing 1, Resist Poison 25, Resist Common Disease 30, Swift Swim 40
- **max:** Water Breathing 1, Resist Poison 40, Resist Common Disease 50, Swift Swim 60, Restore Health 1 /s

### Ayleid  *(relocated)*
- **min:** Restore Magicka 1 /s, Light 10
- **mid:** Restore Magicka 2 /s, Spell Absorption 10
- **max:** Restore Magicka 3 /s, Spell Absorption 18, Resist Magicka 25

### Bal-Darum  *(relocated)*
- **min:** Resist Blight Disease 15, Shield 5
- **mid:** Resist Blight Disease 25, Shield 10, Fortify Health 20
- **max:** Resist Blight Disease 40, Shield 15, Fortify Health 35

### Breton  *(relocated)*
- **min:** Resist Magicka 15
- **mid:** Resist Magicka 30, Spell Absorption 10
- **max:** Resist Magicka 50, Spell Absorption 18, Fortify Conjuration 15

### Cataphract  *(relocated)*
- **min:** Fortify Health 10, Fortify Attack Bonus 5
- **mid:** Fortify Health 20, Fortify Attack Bonus 10, Shield 8
- **max:** Fortify Health 35, Fortify Attack Bonus 15, Shield 12

### Chap-thil  *(relocated)*
- **min:** Resist Fire 15, Fortify Fatigue 20
- **mid:** Resist Fire 25, Fortify Fatigue 35
- **max:** Resist Fire 40, Fortify Fatigue 55, Fortify Endurance 10

### Chev-Aram  *(relocated)*
- **min:** Resist Fire 15, Fortify Attack Bonus 5
- **mid:** Resist Fire 25, Fortify Attack Bonus 10, Fortify Health 20
- **max:** Resist Fire 40, Fortify Attack Bonus 15, Fortify Health 35

### Chuzei  *(relocated)*
- **min:** Fortify Health 10, Resist Blight Disease 10
- **mid:** Fortify Health 25, Resist Blight Disease 20, Shield 10
- **max:** Fortify Health 40, Resist Blight Disease 30, Shield 15, Resist Fire 25

### Colovian Leather
- **min:** Fortify Fatigue 25, Fortify Agility 5
- **mid:** Fortify Fatigue 40, Fortify Agility 10, Fortify Sneak 10
- **max:** Fortify Fatigue 60, Fortify Agility 15, Fortify Sneak 20, Fortify Acrobatics 15

### Companions  *(relocated)*
- **min:** Fortify Attack Bonus 5, Fortify Fatigue 25
- **mid:** Fortify Attack Bonus 10, Fortify Fatigue 40, Fortify Health 20
- **max:** Fortify Attack Bonus 15, Fortify Fatigue 60, Fortify Health 35, Fortify Personality 10

### Crown Guard  *(relocated)*
- **min:** Fortify Health 10, Shield 5
- **mid:** Fortify Health 20, Shield 10, Fortify Personality 10
- **max:** Fortify Health 35, Shield 15, Fortify Personality 15, Fortify Attack Bonus 10

### Daedric Hide  *(relocated)*
- **min:** Spell Absorption 8
- **mid:** Spell Absorption 12, Resist Magicka 15, Sanctuary 8
- **max:** Spell Absorption 18, Resist Magicka 25, Sanctuary 12, Restore Magicka 1 /s

### Domina  *(relocated)*
- **min:** Fortify Personality 5, Fortify Attack Bonus 5
- **mid:** Fortify Personality 10, Fortify Attack Bonus 10, Fortify Health 20
- **max:** Fortify Personality 15, Fortify Attack Bonus 15, Fortify Health 35, Shield 10

### Dunmer  *(relocated)*
- **min:** Resist Fire 25
- **mid:** Resist Fire 50, Fortify Destruction 10
- **max:** Resist Fire 75, Fortify Destruction 20, Fortify Speed 10

### Ebonweave
- **min:** Restore Magicka 1, Fortify Fatigue 20
- **mid:** Restore Magicka 2, Fortify Fatigue 35, Resist Magicka 15
- **max:** Restore Magicka 3, Fortify Fatigue 50, Resist Magicka 25, Spell Absorption 10

### Falkreath Guard
- **min:** Fortify Health 10, Resist Frost 15
- **mid:** Fortify Health 20, Resist Frost 30, Shield 10
- **max:** Fortify Health 35, Resist Frost 45, Shield 15, Fortify Endurance 10

### Gah'Kogo  *(relocated)*
- **min:** Resist Poison 15, Resist Blight Disease 10
- **mid:** Resist Poison 25, Resist Blight Disease 20, Resist Paralysis 15
- **max:** Resist Poison 40, Resist Blight Disease 30, Resist Paralysis 25, Fortify Agility 10

### Gilded Glass
- **min:** Fortify Agility 5, Fortify Personality 5
- **mid:** Fortify Agility 10, Resist Fire 20, Fortify Personality 10
- **max:** Fortify Agility 15, Resist Fire 35, Sanctuary 12, Fortify Personality 15

### Gold  *(relocated)*
- **min:** Fortify Personality 5
- **mid:** Fortify Personality 10, Fortify Mercantile 10
- **max:** Fortify Personality 15, Fortify Mercantile 20, Resist Magicka 15

### Golden Saint
- **min:** Resist Magicka 15, Spell Absorption 8
- **mid:** Resist Magicka 25, Spell Absorption 12, Reflect 8
- **max:** Resist Magicka 40, Spell Absorption 18, Reflect 12, Fortify Attack Bonus 10

### Guar Hide
- **min:** Fortify Fatigue 25, Resist Blight Disease 10
- **mid:** Fortify Fatigue 40, Resist Blight Disease 20, Fortify Endurance 10
- **max:** Fortify Fatigue 60, Resist Blight Disease 30, Fortify Endurance 15, Fortify Athletics 15

### House Direnni  *(relocated)*
- **min:** Resist Magicka 15, Restore Magicka 1 /s
- **mid:** Resist Magicka 30, Restore Magicka 2 /s, Spell Absorption 10
- **max:** Resist Magicka 50, Restore Magicka 2 /s, Spell Absorption 18, Fortify Alteration 20

### House Redoran  *(relocated)*
- **min:** Fortify Health 10, Resist Blight Disease 10
- **mid:** Fortify Health 25, Resist Blight Disease 20, Fortify Endurance 10
- **max:** Fortify Health 40, Resist Blight Disease 30, Fortify Endurance 15, Shield 12

### Kagouti Hide
- **min:** Fortify Speed 5, Fortify Athletics 10
- **mid:** Fortify Speed 10, Fortify Athletics 15, Resist Poison 20
- **max:** Fortify Speed 15, Fortify Athletics 25, Resist Poison 35, Fortify Attack Bonus 10

### Kalantar  *(relocated)*
- **min:** Resist Fire 15, Fortify Attack Bonus 5
- **mid:** Resist Fire 25, Fortify Attack Bonus 10, Fortify Strength 5
- **max:** Resist Fire 40, Fortify Attack Bonus 15, Fortify Strength 10, Fortify Health 25

### Klibanion  *(relocated)*
- **min:** Shield 8, Fortify Endurance 5
- **mid:** Shield 12, Fortify Endurance 10
- **max:** Shield 18, Fortify Endurance 15, Fortify Health 25

### Kragen  *(relocated)*
- **min:** Resist Fire 15, Fortify Mercantile 10
- **mid:** Resist Fire 25, Fortify Mercantile 20, Fortify Health 15
- **max:** Resist Fire 40, Fortify Mercantile 30, Fortify Health 25, Fortify Personality 10

### Kvetchi  *(relocated)*
- **min:** Resist Blight Disease 15, Fortify Fatigue 20
- **mid:** Resist Blight Disease 25, Fortify Fatigue 35, Resist Poison 20
- **max:** Resist Blight Disease 40, Fortify Fatigue 50, Resist Poison 35, Fortify Endurance 10

### Lamellar  *(relocated)*
- **min:** Shield 5, Fortify Fatigue 25
- **mid:** Shield 10, Fortify Fatigue 40
- **max:** Shield 15, Fortify Fatigue 60, Fortify Health 25

### Mananaut
*Thresholds: 2 / 3 / 5 pieces*  
- **min:** Resist Shock 15, Water Breathing 1
- **mid:** Resist Shock 30, Water Breathing 1, Fortify Intelligence 10
- **max:** Resist Shock 50, Water Breathing 1, Fortify Intelligence 15, Reflect 10

### Manatee Leather
- **min:** Water Breathing 1, Swift Swim 30
- **mid:** Water Breathing 1, Swift Swim 50, Fortify Fatigue 35
- **max:** Water Breathing 1, Swift Swim 70, Fortify Fatigue 50, Resist Frost 25

### Maormer
- **min:** Water Breathing 1, Swift Swim 30
- **mid:** Water Breathing 1, Swift Swim 50, Resist Shock 20
- **max:** Water Breathing 1, Swift Swim 70, Resist Shock 35, Chameleon 15

### Maradlai  *(relocated)*
- **min:** Resist Fire 15, Fortify Speed 5
- **mid:** Resist Fire 25, Fortify Speed 10, Fortify Fatigue 30
- **max:** Resist Fire 40, Fortify Speed 15, Fortify Fatigue 50, Fortify Athletics 15

### Militia  *(relocated)*
- **min:** Fortify Fatigue 20, Fortify Health 10
- **mid:** Fortify Fatigue 35, Fortify Health 20, Shield 5
- **max:** Fortify Fatigue 50, Fortify Health 30, Shield 10

### Molecrab  *(relocated)*
- **min:** Shield 8
- **mid:** Shield 12, Resist Normal Weapons 5
- **max:** Shield 18, Resist Normal Weapons 10, Fortify Health 20

### Narsis Watch
- **min:** Fortify Health 10, Shield 5
- **mid:** Fortify Health 20, Shield 10, Fortify Endurance 10
- **max:** Fortify Health 35, Shield 15, Fortify Endurance 15, Fortify Mercantile 15

### Navy  *(relocated)*
- **min:** Swift Swim 30, Water Breathing 1
- **mid:** Swift Swim 50, Water Breathing 1, Resist Frost 20
- **max:** Swift Swim 70, Water Breathing 1, Resist Frost 35, Fortify Fatigue 50

### Necrom Guard  *(relocated)*
- **min:** Turn Undead 15, Resist Magicka 10
- **mid:** Turn Undead 25, Resist Magicka 20, Fortify Health 20
- **max:** Turn Undead 40, Resist Magicka 30, Fortify Health 35, Fortify Restoration 20

### Nibenese  *(relocated)*
- **min:** Restore Magicka 1 /s, Fortify Mercantile 10
- **mid:** Restore Magicka 2 /s, Fortify Mercantile 20, Resist Magicka 15
- **max:** Restore Magicka 2 /s, Fortify Mercantile 30, Resist Magicka 25, Fortify Personality 15

### Oloman  *(relocated)*
- **min:** Resist Fire 15, Shield 5
- **mid:** Resist Fire 25, Shield 10, Fortify Health 20
- **max:** Resist Fire 40, Shield 15, Fortify Health 35, Fortify Endurance 10

### Quey Chitin
- **min:** Water Breathing 1, Resist Poison 15
- **mid:** Water Breathing 1, Resist Poison 25, Shield 10
- **max:** Water Breathing 1, Resist Poison 40, Shield 15, Swift Swim 50

### Reach
- **min:** Resist Frost 15, Fortify Endurance 5
- **mid:** Resist Frost 30, Fortify Endurance 10, Fortify Attack Bonus 10
- **max:** Resist Frost 45, Fortify Endurance 15, Fortify Attack Bonus 15, Spell Absorption 10

### Reach Royal Guard
- **min:** Fortify Health 10, Resist Frost 15
- **mid:** Fortify Health 20, Resist Frost 30, Shield 10
- **max:** Fortify Health 35, Resist Frost 45, Shield 15, Fortify Attack Bonus 15

### Red Dome Templar
- **min:** Fortify Health 10, Resist Magicka 10
- **mid:** Fortify Health 20, Resist Magicka 20, Turn Undead 20
- **max:** Fortify Health 35, Resist Magicka 30, Turn Undead 35, Fortify Restoration 20

### Redguard  *(relocated)*
- **min:** Resist Poison 15, Fortify Endurance 5
- **mid:** Resist Poison 25, Fortify Endurance 10, Fortify Fatigue 40
- **max:** Resist Poison 40, Fortify Endurance 15, Fortify Fatigue 60, Fortify Attack Bonus 15

### Redguard Iron Lamellar
- **min:** Shield 8, Fortify Health 10
- **mid:** Shield 12, Fortify Health 20, Fortify Attack Bonus 10
- **max:** Shield 18, Fortify Health 35, Fortify Attack Bonus 15, Fortify Endurance 10

### Reman  *(relocated)*
- **min:** Fortify Health 10, Fortify Attack Bonus 5
- **mid:** Fortify Health 25, Fortify Attack Bonus 10, Fortify Personality 10
- **max:** Fortify Health 40, Fortify Attack Bonus 15, Fortify Personality 15, Shield 10

### Rihad Guard
- **min:** Resist Poison 15, Fortify Fatigue 20
- **mid:** Resist Poison 25, Fortify Fatigue 35, Shield 10
- **max:** Resist Poison 40, Fortify Fatigue 55, Shield 15, Fortify Endurance 10

### Riverwatch
- **min:** Fortify Health 10, Water Walking 1
- **mid:** Fortify Health 20, Water Walking 1, Shield 10
- **max:** Fortify Health 35, Water Walking 1, Shield 15, Resist Blight Disease 30

### Rourken
- **min:** Resist Shock 15, Fortify Health 10
- **mid:** Resist Shock 30, Fortify Health 20, Shield 10
- **max:** Resist Shock 50, Fortify Health 35, Shield 15, Reflect 10

### Sacred Lands
- **min:** Resist Magicka 15, Fortify Health 10
- **mid:** Resist Magicka 25, Fortify Health 20, Fortify Restoration 15
- **max:** Resist Magicka 40, Fortify Health 35, Fortify Restoration 25, Turn Undead 25

### Saliache  *(relocated)*
- **min:** Resist Blight Disease 15, Fortify Athletics 10
- **mid:** Resist Blight Disease 25, Fortify Athletics 15, Resist Poison 20
- **max:** Resist Blight Disease 40, Fortify Athletics 25, Resist Poison 35, Fortify Agility 10

### Shellmold  *(relocated)*
- **min:** Shield 5, Resist Shock 10
- **mid:** Shield 10, Resist Shock 20
- **max:** Shield 15, Resist Shock 35, Fortify Health 20

### Shinathi Chitin
- **min:** Resist Poison 15, Resist Blight Disease 15
- **mid:** Resist Poison 25, Resist Blight Disease 25, Resist Paralysis 15
- **max:** Resist Poison 40, Resist Blight Disease 40, Resist Paralysis 30, Fortify Agility 10

### Shipal-Arai  *(relocated)*
- **min:** Resist Blight Disease 15, Resist Poison 15
- **mid:** Resist Blight Disease 25, Resist Poison 25, Fortify Spear 15
- **max:** Resist Blight Disease 40, Resist Poison 40, Fortify Spear 25, Fortify Agility 10

### Skingrad  *(relocated)*
- **min:** Resist Poison 15, Resist Common Disease 20
- **mid:** Resist Poison 25, Resist Common Disease 35, Fortify Personality 10
- **max:** Resist Poison 40, Resist Common Disease 50, Fortify Personality 15, Resist Magicka 15

### Sutch Mail
- **min:** Fortify Health 10, Shield 5
- **mid:** Fortify Health 20, Shield 10, Fortify Attack Bonus 10
- **max:** Fortify Health 35, Shield 15, Fortify Attack Bonus 15, Fortify Fatigue 40

### Thirr  *(relocated)*
- **min:** Resist Fire 15, Water Breathing 1
- **mid:** Resist Fire 25, Water Breathing 1, Fortify Health 20
- **max:** Resist Fire 40, Water Breathing 1, Fortify Health 35, Swift Swim 40

### Toadscale
- **min:** Resist Poison 15, Resist Frost 15
- **mid:** Resist Poison 25, Resist Frost 30, Resist Common Disease 30
- **max:** Resist Poison 40, Resist Frost 45, Resist Common Disease 50, Fortify Fatigue 40

### Watchman  *(relocated)*
- **min:** Night Eye 25, Fortify Fatigue 20
- **mid:** Night Eye 50, Fortify Fatigue 35, Fortify Health 15
- **max:** Night Eye 75, Fortify Fatigue 50, Fortify Health 25, Detect Animal 50

### Wenbone
- **min:** Resist Poison 15, Fortify Marksman 10
- **mid:** Resist Poison 25, Fortify Marksman 15, Fortify Agility 10
- **max:** Resist Poison 40, Fortify Marksman 25, Fortify Agility 15, Fortify Sneak 15

### Wormmouth  *(relocated)*
- **min:** Resist Poison 15
- **mid:** Resist Poison 25, Resist Blight Disease 20
- **max:** Resist Poison 40, Resist Blight Disease 35, Resist Paralysis 20


---

## TR items folded into existing sets

When TR is installed these sets also recognise their Tamriel Rebuilt armour (re-linked via `addItems`):

- **Bearskin** (+7 TR items)
- **Bonemold** (+92 TR items)
- **Bronze** (+9 TR items)
- **Cephalopod** (+8 TR items)
- **Chain Mail** (+15 TR items)
- **Chitin** (+17 TR items)
- **Colovian** (+136 TR items)
- **Daedric** (+57 TR items)
- **Dragonscale** (+9 TR items)
- **Dreugh** (+12 TR items)
- **Dwemer** (+9 TR items)
- **Ebony** (+19 TR items)
- **Fur** (+21 TR items)
- **Glass** (+10 TR items)
- **Goblin** (+6 TR items)
- **Heavy Armor** (+3 TR items)
- **Hide** (+14 TR items)
- **House Dres** (+32 TR items)
- **House Hlaalu** (+1 TR items)
- **House Indoril** (+26 TR items)
- **House Telvanni** (+26 TR items)
- **Imperial** (+5 TR items)
- **Iron** (+16 TR items)
- **Lamellar** (+11 TR items)
- **Leather** (+16 TR items)
- **Light Armor** (+13 TR items)
- **Master** (+3 TR items)
- **Morag Tong** (+7 TR items)
- **Native** (+101 TR items)
- **Netch Leather** (+14 TR items)
- **Newtscale** (+8 TR items)
- **Nordic** (+81 TR items)
- **Orcish** (+6 TR items)
- **Orsimer** (+14 TR items)
- **Ring Mail** (+11 TR items)
- **Scrap** (+8 TR items)
- **Shellmold** (+8 TR items)
- **Silver** (+12 TR items)
- **Steel** (+8 TR items)
- **Studded** (+5 TR items)
- **Templar** (+1 TR items)
- **Trollbone** (+7 TR items)
