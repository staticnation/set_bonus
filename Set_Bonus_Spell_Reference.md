# Set Bonus — Spell Reference

Constant-effect armour set bonuses; default tiers at **2 / 4 / 6+** pieces (some override). All bonuses are **Lua-defined, built at runtime (no ESP)**, vanilla effects only. "/s" = per-second Restore. Values are tuned low and flat (so 6 pieces isn't far above 4), since you wear armour anyway; many sets carry a mild thematic **Weakness** drawback at mid/max (metal→shock, fur/hide→fire, chitin/glass→frost, etc.).

## Modules
- **Base mod** — 69 sets.
- **Tamriel Rebuilt add-on** — 67 sets (new + relocated).
- **OAAB / NOD / AATL** — relink each mod's armour onto existing sets.


---

## Base mod sets (69)

### Adamantium
- **min:** Resist Magicka 5
- **mid:** Resist Magicka 8, Reflect 5, Weakness To Shock 10
- **max:** Resist Magicka 12, Reflect 8, Resist Normal Weapons 8, Weakness To Shock 20

### Armun-An
- **min:** Resist Fire 10
- **mid:** Resist Fire 15, Fortify Health 12, Weakness To Frost 10
- **max:** Resist Fire 20, Fortify Health 18, Resist Normal Weapons 8, Weakness To Frost 20

### Artifacts
- **min:** Resist Magicka 5, Fortify Luck 3
- **mid:** Resist Magicka 8, Fortify Luck 5, Reflect 5
- **max:** Resist Magicka 12, Fortify Luck 8, Reflect 8, Spell Absorption 8

### Bear Fur
- **min:** Resist Frost 10
- **mid:** Resist Frost 15, Fortify Endurance 5, Weakness To Fire 10
- **max:** Resist Frost 20, Fortify Endurance 8, Fortify Health 18, Weakness To Fire 20

### Bearskin
- **min:** Resist Frost 10, Fortify Strength 3
- **mid:** Resist Frost 15, Fortify Strength 5, Fortify Health 12, Weakness To Fire 10
- **max:** Resist Frost 20, Fortify Strength 8, Fortify Health 18, Weakness To Fire 20

### Bonemold
- **min:** Fortify Health 8, Resist Blight Disease 10
- **mid:** Fortify Health 12, Resist Blight Disease 15, Restore Fatigue 2 /s, Weakness To Frost 10
- **max:** Fortify Health 18, Resist Blight Disease 20, Restore Fatigue 2 /s, Resist Normal Weapons 8, Weakness To Frost 20

### Bosmer
- **min:** Resist Poison 10, Fortify Agility 3
- **mid:** Resist Poison 15, Fortify Agility 5, Fortify Marksman 8
- **max:** Resist Poison 20, Fortify Agility 8, Fortify Marksman 12, Resist Common Disease 20

### Bronze
- **min:** Resist Normal Weapons 3, Resist Shock 10
- **mid:** Resist Normal Weapons 5, Resist Shock 15, Fortify Endurance 5
- **max:** Resist Normal Weapons 8, Resist Shock 20, Fortify Endurance 8

### Cephalopod
- **min:** Swift Swim 20, Water Breathing 1
- **mid:** Swift Swim 30, Water Breathing 1, Sanctuary 7
- **max:** Swift Swim 40, Water Breathing 1, Sanctuary 10, Resist Frost 20

### Chain Mail
- **min:** Fortify Fatigue 12
- **mid:** Fortify Fatigue 20, Resist Normal Weapons 5, Weakness To Shock 10
- **max:** Fortify Fatigue 28, Resist Normal Weapons 8, Weakness To Shock 20

### Chitin
- **min:** Resist Blight Disease 10, Resist Poison 10
- **mid:** Resist Blight Disease 15, Resist Poison 15, Resist Paralysis 15, Weakness To Frost 10
- **max:** Resist Blight Disease 20, Resist Poison 20, Resist Paralysis 20, Fortify Agility 8, Weakness To Frost 20

### Cloth
- **min:** Restore Magicka 1 /s, Feather 5
- **mid:** Restore Magicka 1 /s, Feather 10, Fortify Alteration 8, Weakness To Normal Weapons 10
- **max:** Restore Magicka 2 /s, Feather 15, Fortify Alteration 12, Fortify Intelligence 8, Weakness To Normal Weapons 20

### Colovian
- **min:** Resist Frost 10, Fortify Endurance 3
- **mid:** Resist Frost 15, Fortify Endurance 5, Fortify Attack Bonus 5
- **max:** Resist Frost 20, Fortify Endurance 8, Fortify Attack Bonus 8, Fortify Health 18

### Daedric
- **min:** Spell Absorption 3
- **mid:** Spell Absorption 5, Resist Magicka 8, Weakness To Shock 10
- **max:** Spell Absorption 8, Resist Magicka 12, Resist Normal Weapons 8, Fortify Attack Bonus 8, Weakness To Shock 20

### Dark Brotherhood
- **min:** Fortify Sneak 5, Resist Poison 10
- **mid:** Fortify Sneak 8, Resist Poison 15, Chameleon 7
- **max:** Fortify Sneak 12, Resist Poison 20, Chameleon 10, Fortify Attack Bonus 8

### Dragonbone (stub)
- **min:** Resist Fire 10, Fortify Health 8
- **mid:** Resist Fire 15, Fortify Health 12, Resist Normal Weapons 5, Weakness To Frost 10
- **max:** Resist Fire 20, Fortify Health 18, Resist Normal Weapons 8, Resist Magicka 12, Weakness To Frost 20

### Dragonscale
- **min:** Resist Fire 10
- **mid:** Resist Fire 15, Resist Magicka 8, Weakness To Frost 10
- **max:** Resist Fire 20, Resist Magicka 12, Resist Normal Weapons 8, Fortify Agility 8, Weakness To Frost 20

### House Dres (stub)
- **min:** Resist Poison 10, Resist Fire 10
- **mid:** Resist Poison 15, Resist Fire 15, Fortify Long Blade 8
- **max:** Resist Poison 20, Resist Fire 20, Fortify Long Blade 12, Fortify Endurance 8

### Dreugh
- **min:** Resist Shock 10, Water Breathing 1
- **mid:** Resist Shock 15, Water Breathing 1, Swift Swim 30, Weakness To Frost 10
- **max:** Resist Shock 20, Water Breathing 1, Swift Swim 40, Weakness To Frost 20

### Dwemer
- **min:** Resist Shock 10
- **mid:** Resist Shock 15, Reflect 5
- **max:** Resist Shock 20, Reflect 8, Sanctuary 10

### Ebony
- **min:** Resist Fire 10, Fortify Health 8
- **mid:** Resist Fire 15, Fortify Health 12, Resist Normal Weapons 5, Weakness To Shock 10
- **max:** Resist Fire 20, Fortify Health 18, Resist Normal Weapons 8, Resist Magicka 12, Weakness To Shock 20

### Embossed (stub)
- **min:** Fortify Personality 3
- **mid:** Fortify Personality 5, Fortify Speechcraft 8
- **max:** Fortify Personality 8, Fortify Speechcraft 12, Fortify Luck 8

### Engraved
- **min:** Resist Magicka 5
- **mid:** Resist Magicka 8, Fortify Personality 5
- **max:** Resist Magicka 12, Fortify Personality 8, Spell Absorption 8

### Falmer (stub)
- **min:** Resist Frost 10, Chameleon 5
- **mid:** Resist Frost 15, Chameleon 7, Night Eye 40
- **max:** Resist Frost 20, Chameleon 10, Night Eye 50

### Fighters Guild (stub)
- **min:** Fortify Attack Bonus 3, Fortify Health 8
- **mid:** Fortify Attack Bonus 5, Fortify Health 12, Fortify Fatigue 20
- **max:** Fortify Attack Bonus 8, Fortify Health 18, Fortify Fatigue 28, Fortify Strength 8

### Fur
- **min:** Resist Frost 10, Fortify Fatigue 12
- **mid:** Resist Frost 15, Fortify Fatigue 20, Weakness To Fire 10
- **max:** Resist Frost 20, Fortify Fatigue 28, Fortify Endurance 8, Weakness To Fire 20

### Gah-Julan
- **min:** Fortify Health 8, Resist Blight Disease 10
- **mid:** Fortify Health 12, Resist Blight Disease 15, Resist Normal Weapons 5
- **max:** Fortify Health 18, Resist Blight Disease 20, Resist Normal Weapons 8, Resist Fire 20

### Glass
- **min:** Fortify Agility 3, Resist Fire 10
- **mid:** Fortify Agility 5, Resist Fire 15, Sanctuary 7, Weakness To Frost 10
- **max:** Fortify Agility 8, Resist Fire 20, Sanctuary 10, Chameleon 10, Weakness To Frost 20

### Goblin
- **min:** Fortify Strength 3, Resist Common Disease 10
- **mid:** Fortify Strength 5, Resist Common Disease 15, Fortify Fatigue 20
- **max:** Fortify Strength 8, Resist Common Disease 20, Fortify Fatigue 28, Fortify Attack Bonus 8

### Guard
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Fortify Endurance 5, Weakness To Fire 10
- **max:** Fortify Health 18, Resist Normal Weapons 8, Fortify Endurance 8, Weakness To Fire 20

### Heavy Armor
- **min:** Resist Normal Weapons 3, Fortify Health 8
- **mid:** Resist Normal Weapons 5, Fortify Health 12, Fortify Endurance 5
- **max:** Resist Normal Weapons 8, Fortify Health 18, Fortify Endurance 8

### Her Hand
- **min:** Resist Magicka 5, Fortify Health 8
- **mid:** Resist Magicka 8, Fortify Health 12, Fortify Restoration 8
- **max:** Resist Magicka 12, Fortify Health 18, Turn Undead 20, Fortify Restoration 12

### Hide
- **min:** Fortify Fatigue 12
- **mid:** Fortify Fatigue 20, Fortify Athletics 8, Weakness To Fire 10
- **max:** Fortify Fatigue 28, Fortify Athletics 12, Fortify Speed 8, Weakness To Fire 20

### House Hlaalu
- **min:** Fortify Mercantile 5, Fortify Personality 3
- **mid:** Fortify Mercantile 8, Fortify Personality 5, Fortify Speechcraft 8
- **max:** Fortify Mercantile 12, Fortify Personality 8, Fortify Speechcraft 12, Fortify Luck 8

### Imperial
- **min:** Fortify Personality 3, Fortify Speechcraft 5
- **mid:** Fortify Personality 5, Fortify Speechcraft 8, Fortify Mercantile 8
- **max:** Fortify Personality 8, Fortify Speechcraft 12, Fortify Mercantile 12, Fortify Attack Bonus 8

### House Indoril
- **min:** Resist Magicka 5, Fortify Restoration 5
- **mid:** Resist Magicka 8, Fortify Restoration 8, Fortify Personality 5
- **max:** Resist Magicka 12, Fortify Restoration 12, Fortify Personality 8, Turn Undead 20

### Iron
- **min:** Fortify Health 8
- **mid:** Fortify Health 12, Fortify Fatigue 20, Weakness To Shock 10
- **max:** Fortify Health 18, Fortify Fatigue 28, Resist Normal Weapons 8, Weakness To Shock 20

### Khajiit
- **min:** Night Eye 25, Fortify Agility 3
- **mid:** Night Eye 40, Fortify Agility 5, Fortify Acrobatics 8
- **max:** Night Eye 50, Fortify Agility 8, Fortify Acrobatics 12, Fortify Hand To Hand 12

### Kynareth
- **min:** Slow Fall 10, Resist Shock 10
- **mid:** Slow Fall 15, Resist Shock 15, Fortify Speed 5
- **max:** Slow Fall 20, Resist Shock 20, Fortify Speed 8, Fortify Fatigue 28

### Leather
- **min:** Fortify Fatigue 12, Fortify Acrobatics 5
- **mid:** Fortify Fatigue 20, Fortify Acrobatics 8, Fortify Sneak 8, Weakness To Fire 10
- **max:** Fortify Fatigue 28, Fortify Acrobatics 12, Fortify Sneak 12, Fortify Agility 8, Weakness To Fire 20

### Light Armor
- **min:** Fortify Fatigue 12, Fortify Agility 3
- **mid:** Fortify Fatigue 20, Fortify Agility 5, Sanctuary 7
- **max:** Fortify Fatigue 28, Fortify Agility 8, Sanctuary 10, Fortify Acrobatics 12

### Mages Guild (stub)
- **min:** Restore Magicka 1 /s, Fortify Destruction 5
- **mid:** Restore Magicka 1 /s, Fortify Destruction 8, Resist Magicka 8
- **max:** Restore Magicka 2 /s, Fortify Destruction 12, Resist Magicka 12, Fortify Intelligence 8

### Master
- **min:** Fortify Luck 3, Fortify Fatigue 12
- **mid:** Fortify Luck 5, Fortify Fatigue 20, Fortify Health 12
- **max:** Fortify Luck 8, Fortify Fatigue 28, Fortify Health 18, Fortify Attack Bonus 8

### Medium Armor
- **min:** Fortify Fatigue 12, Resist Normal Weapons 3
- **mid:** Fortify Fatigue 20, Resist Normal Weapons 5, Fortify Health 12
- **max:** Fortify Fatigue 28, Resist Normal Weapons 8, Fortify Health 18, Fortify Endurance 8

### Morag Tong
- **min:** Resist Poison 10, Fortify Short Blade 5
- **mid:** Resist Poison 15, Fortify Short Blade 8, Fortify Sneak 8
- **max:** Resist Poison 20, Fortify Short Blade 12, Fortify Sneak 12, Chameleon 10

### Native
- **min:** Resist Blight Disease 10, Resist Poison 10
- **mid:** Resist Blight Disease 15, Resist Poison 15, Fortify Athletics 8, Weakness To Frost 10
- **max:** Resist Blight Disease 20, Resist Poison 20, Fortify Athletics 12, Resist Fire 20, Weakness To Frost 20

### Netch Leather
- **min:** Fortify Fatigue 12, Resist Poison 10
- **mid:** Fortify Fatigue 20, Resist Poison 15, Fortify Athletics 8, Weakness To Fire 10
- **max:** Fortify Fatigue 28, Resist Poison 20, Fortify Athletics 12, Fortify Speed 8, Weakness To Fire 20

### Newtscale
- **min:** Resist Poison 10, Swift Swim 20
- **mid:** Resist Poison 15, Swift Swim 30, Water Breathing 1, Weakness To Frost 10
- **max:** Resist Poison 20, Swift Swim 40, Water Breathing 1, Resist Common Disease 20, Weakness To Frost 20

### Nordic
- **min:** Resist Frost 10, Resist Shock 10
- **mid:** Resist Frost 15, Resist Shock 15, Fortify Strength 5
- **max:** Resist Frost 20, Resist Shock 20, Fortify Strength 8, Fortify Health 18

### Orcish
- **min:** Fortify Health 8, Fortify Strength 3
- **mid:** Fortify Health 12, Fortify Strength 5, Fortify Fatigue 20, Weakness To Shock 10
- **max:** Fortify Health 18, Fortify Strength 8, Fortify Fatigue 28, Fortify Attack Bonus 8, Weakness To Shock 20

### Orsimer
- **min:** Fortify Strength 3, Fortify Health 8
- **mid:** Fortify Strength 5, Fortify Health 12, Resist Magicka 8
- **max:** Fortify Strength 8, Fortify Health 18, Resist Magicka 12, Fortify Attack Bonus 8

### Padded
- **min:** Fortify Fatigue 12
- **mid:** Fortify Fatigue 20, Resist Frost 15, Weakness To Fire 10
- **max:** Fortify Fatigue 28, Resist Frost 20, Fortify Health 18, Weakness To Fire 20

### Plate
- **min:** Resist Normal Weapons 3, Fortify Health 8
- **mid:** Resist Normal Weapons 5, Fortify Health 12, Weakness To Shock 10
- **max:** Resist Normal Weapons 8, Fortify Health 18, Weakness To Shock 20

### Resin Molded (stub)
- **min:** Resist Blight Disease 10
- **mid:** Resist Blight Disease 15, Fortify Fatigue 20, Weakness To Frost 10
- **max:** Resist Blight Disease 20, Fortify Fatigue 28, Resist Poison 20, Weakness To Frost 20

### Ring Mail
- **min:** Fortify Fatigue 12, Fortify Agility 3
- **mid:** Fortify Fatigue 20, Fortify Agility 5, Weakness To Shock 10
- **max:** Fortify Fatigue 28, Fortify Agility 8, Resist Normal Weapons 8, Weakness To Shock 20

### Royal Guard
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Resist Magicka 8, Weakness To Fire 10
- **max:** Fortify Health 18, Resist Normal Weapons 8, Resist Magicka 12, Fortify Attack Bonus 8, Weakness To Fire 20

### Scale Mail
- **min:** Resist Normal Weapons 3
- **mid:** Resist Normal Weapons 5, Weakness To Shock 10
- **max:** Resist Normal Weapons 8, Fortify Health 18, Weakness To Shock 20

### Scrap (stub)
- **min:** Fortify Luck 3
- **mid:** Fortify Luck 5, Fortify Fatigue 20
- **max:** Fortify Luck 8, Fortify Fatigue 28, Resist Normal Weapons 8

### Silver
- **min:** Resist Magicka 5
- **mid:** Resist Magicka 8, Turn Undead 15, Weakness To Shock 10
- **max:** Resist Magicka 12, Turn Undead 20, Spell Absorption 8, Weakness To Shock 20

### Splint
- **min:** Resist Normal Weapons 3, Fortify Health 8
- **mid:** Resist Normal Weapons 5, Fortify Health 12, Weakness To Shock 10
- **max:** Resist Normal Weapons 8, Fortify Health 18, Weakness To Shock 20

### Stalhrim
- **min:** Resist Frost 10
- **mid:** Resist Frost 15, Restore Magicka 1 /s, Weakness To Fire 10
- **max:** Resist Frost 20, Restore Magicka 2 /s, Weakness To Fire 20

### Steel
- **min:** Fortify Health 8, Fortify Attack Bonus 3
- **mid:** Fortify Health 12, Fortify Attack Bonus 5, Weakness To Shock 10
- **max:** Fortify Health 18, Fortify Attack Bonus 8, Resist Normal Weapons 8, Weakness To Shock 20

### Studded
- **min:** Fortify Fatigue 12, Resist Normal Weapons 3
- **mid:** Fortify Fatigue 20, Resist Normal Weapons 5, Weakness To Fire 10
- **max:** Fortify Fatigue 28, Resist Normal Weapons 8, Weakness To Fire 20

### House Telvanni
- **min:** Restore Magicka 1 /s, Fortify Intelligence 3
- **mid:** Restore Magicka 1 /s, Fortify Intelligence 5, Fortify Mysticism 8
- **max:** Restore Magicka 2 /s, Fortify Intelligence 8, Fortify Mysticism 12, Fortify Destruction 12

### Templar
- **min:** Fortify Health 8, Turn Undead 10
- **mid:** Fortify Health 12, Turn Undead 15, Resist Magicka 8
- **max:** Fortify Health 18, Turn Undead 20, Resist Magicka 12, Fortify Attack Bonus 8

### Thieves Guild (stub)
- **min:** Fortify Sneak 5, Fortify Security 5
- **mid:** Fortify Sneak 8, Fortify Security 8, Chameleon 7
- **max:** Fortify Sneak 12, Fortify Security 12, Chameleon 10, Fortify Agility 8

### Tribunal Temple
- **min:** Resist Magicka 5, Fortify Restoration 5
- **mid:** Resist Magicka 8, Fortify Restoration 8, Restore Health 1 /s
- **max:** Resist Magicka 12, Fortify Restoration 12, Restore Health 1 /s, Turn Undead 20

### Trollbone
- **min:** Restore Health 1 /s
- **mid:** Restore Health 1 /s, Resist Frost 15, Weakness To Fire 10
- **max:** Restore Health 1 /s, Resist Frost 20, Fortify Health 18, Weakness To Fire 20

### Wolf Fur
- **min:** Resist Frost 10, Fortify Speed 3
- **mid:** Resist Frost 15, Fortify Speed 5, Night Eye 40, Weakness To Fire 10
- **max:** Resist Frost 20, Fortify Speed 8, Night Eye 50, Fortify Athletics 12, Weakness To Fire 20


---

## Tamriel Rebuilt add-on sets (67)

### Alessian Bronze
- **min:** Fortify Health 8, Resist Magicka 5
- **mid:** Fortify Health 12, Resist Magicka 8, Fortify Attack Bonus 5, Weakness To Shock 10
- **max:** Fortify Health 18, Resist Magicka 12, Fortify Attack Bonus 8, Turn Undead 20, Weakness To Shock 20

### Alit Hide
- **min:** Fortify Agility 3, Resist Poison 10
- **mid:** Fortify Agility 5, Resist Poison 15, Fortify Athletics 8, Weakness To Fire 10
- **max:** Fortify Agility 8, Resist Poison 20, Fortify Athletics 12, Fortify Attack Bonus 8, Weakness To Fire 20

### Altmer  (relocated)
- **min:** Restore Magicka 1 /s, Fortify Intelligence 3
- **mid:** Restore Magicka 1 /s, Fortify Intelligence 5, Fortify Destruction 8, Weakness To Magicka 10
- **max:** Restore Magicka 2 /s, Fortify Intelligence 8, Fortify Destruction 12, Fortify Alteration 12, Weakness To Magicka 20

### Ancient Nordic
- **min:** Resist Frost 10, Fortify Health 8
- **mid:** Resist Frost 15, Fortify Health 12, Resist Normal Weapons 5
- **max:** Resist Frost 20, Fortify Health 18, Resist Normal Weapons 8, Turn Undead 20

### Anvil  (relocated)
- **min:** Water Breathing 1, Swift Swim 20
- **mid:** Water Breathing 1, Swift Swim 30, Resist Frost 15
- **max:** Water Breathing 1, Swift Swim 40, Resist Frost 20, Fortify Personality 8

### Argonian  (relocated)
- **min:** Water Breathing 1, Resist Poison 10
- **mid:** Water Breathing 1, Resist Poison 15, Resist Common Disease 15, Swift Swim 30
- **max:** Water Breathing 1, Resist Poison 20, Resist Common Disease 20, Swift Swim 40, Restore Health 1 /s

### Ayleid  (relocated)
- **min:** Restore Magicka 1 /s, Light 8
- **mid:** Restore Magicka 1 /s, Spell Absorption 5
- **max:** Restore Magicka 2 /s, Spell Absorption 8, Resist Magicka 12

### Bal-Darum  (relocated)
- **min:** Resist Blight Disease 10, Resist Normal Weapons 3
- **mid:** Resist Blight Disease 15, Resist Normal Weapons 5, Fortify Health 12
- **max:** Resist Blight Disease 20, Resist Normal Weapons 8, Fortify Health 18

### Breton  (relocated)
- **min:** Resist Magicka 5
- **mid:** Resist Magicka 8, Spell Absorption 5
- **max:** Resist Magicka 12, Spell Absorption 8, Fortify Conjuration 12

### Cataphract  (relocated)
- **min:** Fortify Health 8, Fortify Attack Bonus 3
- **mid:** Fortify Health 12, Fortify Attack Bonus 5, Resist Normal Weapons 5, Weakness To Shock 10
- **max:** Fortify Health 18, Fortify Attack Bonus 8, Resist Normal Weapons 8, Weakness To Shock 20

### Chap-thil  (relocated)
- **min:** Resist Fire 10, Fortify Fatigue 12
- **mid:** Resist Fire 15, Fortify Fatigue 20, Weakness To Frost 10
- **max:** Resist Fire 20, Fortify Fatigue 28, Fortify Endurance 8, Weakness To Frost 20

### Chev-Aram  (relocated)
- **min:** Resist Fire 10, Fortify Attack Bonus 3
- **mid:** Resist Fire 15, Fortify Attack Bonus 5, Fortify Health 12
- **max:** Resist Fire 20, Fortify Attack Bonus 8, Fortify Health 18

### Chuzei  (relocated)
- **min:** Fortify Health 8, Resist Blight Disease 10
- **mid:** Fortify Health 12, Resist Blight Disease 15, Resist Normal Weapons 5, Weakness To Frost 10
- **max:** Fortify Health 18, Resist Blight Disease 20, Resist Normal Weapons 8, Resist Fire 20, Weakness To Frost 20

### Colovian Leather
- **min:** Fortify Fatigue 12, Fortify Agility 3
- **mid:** Fortify Fatigue 20, Fortify Agility 5, Fortify Sneak 8, Weakness To Fire 10
- **max:** Fortify Fatigue 28, Fortify Agility 8, Fortify Sneak 12, Fortify Acrobatics 12, Weakness To Fire 20

### Companions  (relocated)
- **min:** Fortify Attack Bonus 3, Fortify Fatigue 12
- **mid:** Fortify Attack Bonus 5, Fortify Fatigue 20, Fortify Health 12
- **max:** Fortify Attack Bonus 8, Fortify Fatigue 28, Fortify Health 18, Fortify Personality 8

### Crown Guard  (relocated)
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Fortify Personality 5, Weakness To Fire 10
- **max:** Fortify Health 18, Resist Normal Weapons 8, Fortify Personality 8, Fortify Attack Bonus 8, Weakness To Fire 20

### Daedric Hide  (relocated)
- **min:** Spell Absorption 3
- **mid:** Spell Absorption 5, Resist Magicka 8, Sanctuary 7, Weakness To Fire 10
- **max:** Spell Absorption 8, Resist Magicka 12, Sanctuary 10, Restore Magicka 2 /s, Weakness To Fire 20

### Domina  (relocated)
- **min:** Fortify Personality 3, Fortify Attack Bonus 3
- **mid:** Fortify Personality 5, Fortify Attack Bonus 5, Fortify Health 12
- **max:** Fortify Personality 8, Fortify Attack Bonus 8, Fortify Health 18, Resist Normal Weapons 8

### Dunmer  (relocated)
- **min:** Resist Fire 10
- **mid:** Resist Fire 15, Fortify Destruction 8
- **max:** Resist Fire 20, Fortify Destruction 12, Fortify Speed 8

### Ebonweave
- **min:** Restore Magicka 1 /s, Fortify Fatigue 12
- **mid:** Restore Magicka 1 /s, Fortify Fatigue 20, Resist Magicka 8
- **max:** Restore Magicka 2 /s, Fortify Fatigue 28, Resist Magicka 12, Spell Absorption 8

### Falkreath Guard
- **min:** Fortify Health 8, Resist Frost 10
- **mid:** Fortify Health 12, Resist Frost 15, Resist Normal Weapons 5, Weakness To Fire 10
- **max:** Fortify Health 18, Resist Frost 20, Resist Normal Weapons 8, Fortify Endurance 8, Weakness To Fire 20

### Gah'Kogo  (relocated)
- **min:** Resist Poison 10, Resist Blight Disease 10
- **mid:** Resist Poison 15, Resist Blight Disease 15, Resist Paralysis 15, Weakness To Frost 10
- **max:** Resist Poison 20, Resist Blight Disease 20, Resist Paralysis 20, Fortify Agility 8, Weakness To Frost 20

### Gilded Glass
- **min:** Fortify Agility 3, Fortify Personality 3
- **mid:** Fortify Agility 5, Resist Fire 15, Fortify Personality 5, Weakness To Frost 10
- **max:** Fortify Agility 8, Resist Fire 20, Sanctuary 10, Fortify Personality 8, Weakness To Frost 20

### Gold  (relocated)
- **min:** Fortify Personality 3
- **mid:** Fortify Personality 5, Fortify Mercantile 8, Weakness To Shock 10
- **max:** Fortify Personality 8, Fortify Mercantile 12, Resist Magicka 12, Weakness To Shock 20

### Golden Saint
- **min:** Resist Magicka 5, Spell Absorption 3
- **mid:** Resist Magicka 8, Spell Absorption 5, Reflect 5, Weakness To Shock 10
- **max:** Resist Magicka 12, Spell Absorption 8, Reflect 8, Fortify Attack Bonus 8, Weakness To Shock 20

### Guar Hide
- **min:** Fortify Fatigue 12, Resist Blight Disease 10
- **mid:** Fortify Fatigue 20, Resist Blight Disease 15, Fortify Endurance 5, Weakness To Fire 10
- **max:** Fortify Fatigue 28, Resist Blight Disease 20, Fortify Endurance 8, Fortify Athletics 12, Weakness To Fire 20

### House Direnni  (relocated)
- **min:** Resist Magicka 5, Restore Magicka 1 /s
- **mid:** Resist Magicka 8, Restore Magicka 1 /s, Spell Absorption 5
- **max:** Resist Magicka 12, Restore Magicka 2 /s, Spell Absorption 8, Fortify Alteration 12

### House Redoran  (relocated)
- **min:** Fortify Health 8, Resist Blight Disease 10
- **mid:** Fortify Health 12, Resist Blight Disease 15, Fortify Endurance 5
- **max:** Fortify Health 18, Resist Blight Disease 20, Fortify Endurance 8, Resist Normal Weapons 8

### Kagouti Hide
- **min:** Fortify Speed 3, Fortify Athletics 5
- **mid:** Fortify Speed 5, Fortify Athletics 8, Resist Poison 15, Weakness To Fire 10
- **max:** Fortify Speed 8, Fortify Athletics 12, Resist Poison 20, Fortify Attack Bonus 8, Weakness To Fire 20

### Kalantar  (relocated)
- **min:** Resist Fire 10, Fortify Attack Bonus 3
- **mid:** Resist Fire 15, Fortify Attack Bonus 5, Fortify Strength 5
- **max:** Resist Fire 20, Fortify Attack Bonus 8, Fortify Strength 8, Fortify Health 18

### Klibanion  (relocated)
- **min:** Resist Normal Weapons 3, Fortify Endurance 3
- **mid:** Resist Normal Weapons 5, Fortify Endurance 5, Weakness To Shock 10
- **max:** Resist Normal Weapons 8, Fortify Endurance 8, Fortify Health 18, Weakness To Shock 20

### Kragen  (relocated)
- **min:** Resist Fire 10, Fortify Mercantile 5
- **mid:** Resist Fire 15, Fortify Mercantile 8, Fortify Health 12, Weakness To Frost 10
- **max:** Resist Fire 20, Fortify Mercantile 12, Fortify Health 18, Fortify Personality 8, Weakness To Frost 20

### Kvetchi  (relocated)
- **min:** Resist Blight Disease 10, Fortify Fatigue 12
- **mid:** Resist Blight Disease 15, Fortify Fatigue 20, Resist Poison 15, Weakness To Frost 10
- **max:** Resist Blight Disease 20, Fortify Fatigue 28, Resist Poison 20, Fortify Endurance 8, Weakness To Frost 20

### Lamellar  (relocated)
- **min:** Resist Normal Weapons 3, Fortify Fatigue 12
- **mid:** Resist Normal Weapons 5, Fortify Fatigue 20, Weakness To Shock 10
- **max:** Resist Normal Weapons 8, Fortify Fatigue 28, Fortify Health 18, Weakness To Shock 20

### Mananaut
*Thresholds: 2 / 3 / 5 pieces*  
- **min:** Resist Shock 10, Water Breathing 1
- **mid:** Resist Shock 15, Water Breathing 1, Fortify Intelligence 5
- **max:** Resist Shock 20, Water Breathing 1, Fortify Intelligence 8, Reflect 8

### Manatee Leather
- **min:** Water Breathing 1, Swift Swim 20
- **mid:** Water Breathing 1, Swift Swim 30, Fortify Fatigue 20, Weakness To Fire 10
- **max:** Water Breathing 1, Swift Swim 40, Fortify Fatigue 28, Resist Frost 20, Weakness To Fire 20

### Maormer
- **min:** Water Breathing 1, Swift Swim 20
- **mid:** Water Breathing 1, Swift Swim 30, Resist Shock 15
- **max:** Water Breathing 1, Swift Swim 40, Resist Shock 20, Chameleon 10

### Maradlai  (relocated)
- **min:** Resist Fire 10, Fortify Speed 3
- **mid:** Resist Fire 15, Fortify Speed 5, Fortify Fatigue 20
- **max:** Resist Fire 20, Fortify Speed 8, Fortify Fatigue 28, Fortify Athletics 12

### Militia  (relocated)
- **min:** Fortify Fatigue 12, Fortify Health 8
- **mid:** Fortify Fatigue 20, Fortify Health 12, Resist Normal Weapons 5
- **max:** Fortify Fatigue 28, Fortify Health 18, Resist Normal Weapons 8

### Molecrab  (relocated)
- **min:** Resist Normal Weapons 3
- **mid:** Resist Normal Weapons 5, Weakness To Frost 10
- **max:** Resist Normal Weapons 8, Fortify Health 18, Weakness To Frost 20

### Narsis Watch
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Fortify Endurance 5
- **max:** Fortify Health 18, Resist Normal Weapons 8, Fortify Endurance 8, Fortify Mercantile 12

### Navy  (relocated)
- **min:** Swift Swim 20, Water Breathing 1
- **mid:** Swift Swim 30, Water Breathing 1, Resist Frost 15
- **max:** Swift Swim 40, Water Breathing 1, Resist Frost 20, Fortify Fatigue 28

### Necrom Guard  (relocated)
- **min:** Turn Undead 10, Resist Magicka 5
- **mid:** Turn Undead 15, Resist Magicka 8, Fortify Health 12, Weakness To Fire 10
- **max:** Turn Undead 20, Resist Magicka 12, Fortify Health 18, Fortify Restoration 12, Weakness To Fire 20

### Nibenese  (relocated)
- **min:** Restore Magicka 1 /s, Fortify Mercantile 5
- **mid:** Restore Magicka 1 /s, Fortify Mercantile 8, Resist Magicka 8
- **max:** Restore Magicka 2 /s, Fortify Mercantile 12, Resist Magicka 12, Fortify Personality 8

### Oloman  (relocated)
- **min:** Resist Fire 10, Resist Normal Weapons 3
- **mid:** Resist Fire 15, Resist Normal Weapons 5, Fortify Health 12
- **max:** Resist Fire 20, Resist Normal Weapons 8, Fortify Health 18, Fortify Endurance 8

### Quey Chitin
- **min:** Water Breathing 1, Resist Poison 10
- **mid:** Water Breathing 1, Resist Poison 15, Resist Normal Weapons 5, Weakness To Frost 10
- **max:** Water Breathing 1, Resist Poison 20, Resist Normal Weapons 8, Swift Swim 40, Weakness To Frost 20

### Reach
- **min:** Resist Frost 10, Fortify Endurance 3
- **mid:** Resist Frost 15, Fortify Endurance 5, Fortify Attack Bonus 5
- **max:** Resist Frost 20, Fortify Endurance 8, Fortify Attack Bonus 8, Spell Absorption 8

### Reach Royal Guard
- **min:** Fortify Health 8, Resist Frost 10
- **mid:** Fortify Health 12, Resist Frost 15, Resist Normal Weapons 5, Weakness To Fire 10
- **max:** Fortify Health 18, Resist Frost 20, Resist Normal Weapons 8, Fortify Attack Bonus 8, Weakness To Fire 20

### Red Dome Templar
- **min:** Fortify Health 8, Resist Magicka 5
- **mid:** Fortify Health 12, Resist Magicka 8, Turn Undead 15
- **max:** Fortify Health 18, Resist Magicka 12, Turn Undead 20, Fortify Restoration 12

### Redguard  (relocated)
- **min:** Resist Poison 10, Fortify Endurance 3
- **mid:** Resist Poison 15, Fortify Endurance 5, Fortify Fatigue 20, Weakness To Fire 10
- **max:** Resist Poison 20, Fortify Endurance 8, Fortify Fatigue 28, Fortify Attack Bonus 8, Weakness To Fire 20

### Redguard Iron Lamellar
- **min:** Resist Normal Weapons 3, Fortify Health 8
- **mid:** Resist Normal Weapons 5, Fortify Health 12, Fortify Attack Bonus 5, Weakness To Shock 10
- **max:** Resist Normal Weapons 8, Fortify Health 18, Fortify Attack Bonus 8, Fortify Endurance 8, Weakness To Shock 20

### Reman  (relocated)
- **min:** Fortify Health 8, Fortify Attack Bonus 3
- **mid:** Fortify Health 12, Fortify Attack Bonus 5, Fortify Personality 5
- **max:** Fortify Health 18, Fortify Attack Bonus 8, Fortify Personality 8, Resist Normal Weapons 8

### Rihad Guard
- **min:** Resist Poison 10, Fortify Fatigue 12
- **mid:** Resist Poison 15, Fortify Fatigue 20, Resist Normal Weapons 5, Weakness To Fire 10
- **max:** Resist Poison 20, Fortify Fatigue 28, Resist Normal Weapons 8, Fortify Endurance 8, Weakness To Fire 20

### Riverwatch
- **min:** Fortify Health 8, Water Walking 1
- **mid:** Fortify Health 12, Water Walking 1, Resist Normal Weapons 5
- **max:** Fortify Health 18, Water Walking 1, Resist Normal Weapons 8, Resist Blight Disease 20

### Rourken
- **min:** Resist Shock 10, Fortify Health 8
- **mid:** Resist Shock 15, Fortify Health 12, Resist Normal Weapons 5
- **max:** Resist Shock 20, Fortify Health 18, Resist Normal Weapons 8, Reflect 8

### Sacred Lands
- **min:** Resist Magicka 5, Fortify Health 8
- **mid:** Resist Magicka 8, Fortify Health 12, Fortify Restoration 8
- **max:** Resist Magicka 12, Fortify Health 18, Fortify Restoration 12, Turn Undead 20

### Saliache  (relocated)
- **min:** Resist Blight Disease 10, Fortify Athletics 5
- **mid:** Resist Blight Disease 15, Fortify Athletics 8, Resist Poison 15, Weakness To Frost 10
- **max:** Resist Blight Disease 20, Fortify Athletics 12, Resist Poison 20, Fortify Agility 8, Weakness To Frost 20

### Shellmold  (relocated)
- **min:** Resist Normal Weapons 3, Resist Shock 10
- **mid:** Resist Normal Weapons 5, Resist Shock 15, Weakness To Frost 10
- **max:** Resist Normal Weapons 8, Resist Shock 20, Fortify Health 18, Weakness To Frost 20

### Shinathi Chitin
- **min:** Resist Poison 10, Resist Blight Disease 10
- **mid:** Resist Poison 15, Resist Blight Disease 15, Resist Paralysis 15, Weakness To Frost 10
- **max:** Resist Poison 20, Resist Blight Disease 20, Resist Paralysis 20, Fortify Agility 8, Weakness To Frost 20

### Shipal-Arai  (relocated)
- **min:** Resist Blight Disease 10, Resist Poison 10
- **mid:** Resist Blight Disease 15, Resist Poison 15, Fortify Spear 8, Weakness To Frost 10
- **max:** Resist Blight Disease 20, Resist Poison 20, Fortify Spear 12, Fortify Agility 8, Weakness To Frost 20

### Skingrad  (relocated)
- **min:** Resist Poison 10, Resist Common Disease 10
- **mid:** Resist Poison 15, Resist Common Disease 15, Fortify Personality 5
- **max:** Resist Poison 20, Resist Common Disease 20, Fortify Personality 8, Resist Magicka 12

### Sutch Mail
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Fortify Attack Bonus 5
- **max:** Fortify Health 18, Resist Normal Weapons 8, Fortify Attack Bonus 8, Fortify Fatigue 28

### Thirr  (relocated)
- **min:** Resist Fire 10, Water Breathing 1
- **mid:** Resist Fire 15, Water Breathing 1, Fortify Health 12, Weakness To Frost 10
- **max:** Resist Fire 20, Water Breathing 1, Fortify Health 18, Swift Swim 40, Weakness To Frost 20

### Toadscale
- **min:** Resist Poison 10, Resist Frost 10
- **mid:** Resist Poison 15, Resist Frost 15, Resist Common Disease 15, Weakness To Fire 10
- **max:** Resist Poison 20, Resist Frost 20, Resist Common Disease 20, Fortify Fatigue 28, Weakness To Fire 20

### Watchman  (relocated)
- **min:** Night Eye 25, Fortify Fatigue 12
- **mid:** Night Eye 40, Fortify Fatigue 20, Fortify Health 12
- **max:** Night Eye 50, Fortify Fatigue 28, Fortify Health 18, Detect Animal 50

### Wenbone
- **min:** Resist Poison 10, Fortify Marksman 5
- **mid:** Resist Poison 15, Fortify Marksman 8, Fortify Agility 5, Weakness To Fire 10
- **max:** Resist Poison 20, Fortify Marksman 12, Fortify Agility 8, Fortify Sneak 12, Weakness To Fire 20

### Wormmouth  (relocated)
- **min:** Resist Poison 10
- **mid:** Resist Poison 15, Resist Blight Disease 15, Weakness To Frost 10
- **max:** Resist Poison 20, Resist Blight Disease 20, Resist Paralysis 20, Weakness To Frost 20


---

## External-mod armour folded into existing sets


### Tamriel Rebuilt — 42 sets

- **Bearskin** (+7 items)
- **Bonemold** (+92 items)
- **Bronze** (+9 items)
- **Cephalopod** (+8 items)
- **Chain Mail** (+15 items)
- **Chitin** (+17 items)
- **Colovian** (+136 items)
- **Daedric** (+57 items)
- **Dragonscale** (+9 items)
- **Dreugh** (+12 items)
- **Dwemer** (+20 items)
- **Ebony** (+19 items)
- **Fur** (+21 items)
- **Glass** (+10 items)
- **Goblin** (+6 items)
- **Heavy Armor** (+3 items)
- **Hide** (+14 items)
- **House Dres** (+32 items)
- **House Hlaalu** (+1 items)
- **House Indoril** (+26 items)
- **House Telvanni** (+26 items)
- **Imperial** (+5 items)
- **Iron** (+97 items)
- **Lamellar** (+11 items)
- **Leather** (+37 items)
- **Light Armor** (+13 items)
- **Master** (+3 items)
- **Morag Tong** (+7 items)
- **Native** (+101 items)
- **Netch Leather** (+14 items)
- **Newtscale** (+8 items)
- **Nordic** (+81 items)
- **Orcish** (+6 items)
- **Orsimer** (+14 items)
- **Ring Mail** (+11 items)
- **Scrap** (+8 items)
- **Shellmold** (+8 items)
- **Silver** (+12 items)
- **Steel** (+133 items)
- **Studded** (+5 items)
- **Templar** (+1 items)
- **Trollbone** (+7 items)

### OAAB — 16 sets

- **Cephalopod** (+3 items)
- **Chitin** (+5 items)
- **Cloth** (+3 items)
- **Daedric** (+4 items)
- **Dreugh** (+7 items)
- **Glass** (+3 items)
- **House Hlaalu** (+1 items)
- **House Telvanni** (+9 items)
- **Iron** (+6 items)
- **Leather** (+1 items)
- **Morag Tong** (+4 items)
- **Native** (+6 items)
- **Netch Leather** (+3 items)
- **Orcish** (+1 items)
- **Orsimer** (+1 items)
- **Steel** (+9 items)

### NOD — 14 sets

- **Adamantium** (+53 items)
- **Chitin** (+3 items)
- **Cloth** (+2 items)
- **Daedric** (+3 items)
- **Dwemer** (+16 items)
- **House Dres** (+1 items)
- **House Hlaalu** (+3 items)
- **House Indoril** (+8 items)
- **House Telvanni** (+5 items)
- **Iron** (+6 items)
- **Leather** (+2 items)
- **Netch Leather** (+35 items)
- **Orcish** (+2 items)
- **Scrap** (+8 items)

### AATL — 9 sets

- **Artifacts** (+8 items)
- **Chitin** (+5 items)
- **Dark Brotherhood** (+8 items)
- **Dreugh** (+1 items)
- **Dwemer** (+2 items)
- **Glass** (+4 items)
- **House Redoran** (+2 items)
- **Iron** (+5 items)
- **Netch Leather** (+2 items)