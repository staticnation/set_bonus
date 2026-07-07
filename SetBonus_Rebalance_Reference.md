# Set Bonus — Conditional Rebalance Reference

Complete spell reference for the optional **Conditional Rebalance** submodule
(`SetBonusRebalance` on MWSE, `OpenMW_SetBonusRebalance` on OpenMW). Install it
on top of Set Bonus 1.6+ to replace every set's bonuses with the balance below;
remove it to return to the default balance. Item lists and piece thresholds are
unchanged — only the effects differ.

## Design

The rebalance leans on the 1.6 conditional-effects framework. Each set keeps a
small always-on identity (the restrained base-mod magnitude bands), and gains
**situational spikes** — effects roughly 1.5–2× stronger than an always-on
equivalent that apply only while a state holds. The moods follow the kind of set:
heavy materials answer pain (*bloodied*, below 50% health; *last stand*, below
25%), light materials favour darkness and open sky, cultural sets are strongest
for their own race and homeland habits, faction sets mirror their trade, and the
class sets (Light/Medium/Heavy Armor, Cloth) are purely reactive so they
complement — rather than double — the material sets that share their items.
Weakness drawbacks remain (a few are now conditional too) and still scale with
the Weakness slider; benefits still scale with the Benefit slider.

**Stacking lanes.** Items commonly belong to several sets at once — a Chuzei
helm is also Bonemold, Dunmer, and Native; a bear pelt is also Nordic — so one
outfit can hold max tier in three or four sets simultaneously. Rather than let
that multiply the same stats, every co-activating cluster is split into
**lanes**: the specific set keeps the full-strength identity (Bonemold tanks,
Chuzei commands, Kragen trades, Her Hand heals) while broad umbrella sets
(Dunmer, Native, Nordic, Colovian, Imperial, Orsimer, the class sets) carry
only echo-strength flats (~10 resist) plus cultural conditionals. The build
script enforces this: two sets that can reach max tier from shared items may
not both carry the same full-strength always-on effect, nor spike the same
effect on the same state. Wearing a themed outfit therefore layers
*complementary* bonuses — tank + officer + kinship — instead of doubling them.

Every condition used evaluates natively on **both engines** — thresholds on
health/magicka/fatigue, attributes, skills, and level, time of day, sun,
interior/exterior, and race, plus AND/OR combinations of these. No combat,
weather, or flag conditions are used, so MWSE and OpenMW behave identically.

Conditions at a glance: **bloodied** HP < 50% · **last stand** HP < 25% ·
**unscathed** HP > 75% · **winded** FP < 50% · **fresh** FP > 75% ·
**charged** MP > 50% · **drained** MP < 25% · **night/day** · **sun up/down**
(up = daytime *and* outdoors) · **indoors/outdoors** · **race** ·
**veteran/green** (level thresholds) · **mastery** (skill/attribute
thresholds, e.g. Marksman ≥ 50) · combined states (**at night and indoors**,
**under the open night sky**, **desperate** = last stand *or* winded,
**in shade** = indoors *or* night).

Tier thresholds stay at **2 / 4 / 6+** pieces (per-set overrides such as
Mananaut's 2/3/5 are kept). "/s" = per-second Restore.

---

## Base mod sets (70)

### Iron
- **min:** Fortify Health 8
- **mid:** Fortify Health 12, Fortify Attack 8 *(HP < 50%)*, Weakness to Shock 15 *(FP < 50%)*
- **max:** Fortify Health 18, Fortify Attack 12 *(HP < 50%)*, Resist Normal Weapons 8, Weakness to Shock 25 *(FP < 50%)*

### Steel
- **min:** Fortify Health 8, Fortify Attack 3
- **mid:** Fortify Health 12, Fortify Attack 5, Weakness to Shock 15 *(>= 75% load)*
- **max:** Fortify Health 18, Fortify Attack 8, Resist Normal Weapons 12 *(HP < 50%)*, Weakness to Shock 25 *(>= 75% load)*

### Ebony
- **min:** Resist Fire 10, Fortify Health 8
- **mid:** Resist Fire 15, Fortify Health 12, Resist Normal Weapons 8 *(HP < 50%)*, Weakness to Shock 15 *(>= 75% load)*
- **max:** Resist Fire 20, Fortify Health 18, Resist Normal Weapons 12 *(HP < 50%)*, Resist Magicka 12, Fortify Health 8 *(>= 75% load)*, Weakness to Shock 25 *(>= 75% load)*

### Daedric
- **min:** Spell Absorption 3
- **mid:** Spell Absorption 5, Resist Magicka 8, Fortify Attack 12 *(HP < 25%)*, Weakness to Fire 15 *(HP > 75% and weapon sheathed)*
- **max:** Spell Absorption 8, Resist Magicka 12, Fortify Attack 16 *(HP < 25%)*, Sanctuary 12 *(HP < 25%)*, Weakness to Fire 25 *(HP > 75% and weapon sheathed)*

### Dwemer
- **min:** Resist Shock 10
- **mid:** Resist Shock 15, Reflect 8 *(indoors)*, Weakness to Fire 15 *(under the sun)*
- **max:** Resist Shock 20, Reflect 12 *(indoors)*, Sanctuary 12 *(indoors)*, Resist Magicka 8, Weakness to Fire 25 *(under the sun)*

### Adamantium
- **min:** Resist Magicka 5
- **mid:** Resist Magicka 8, Reflect 8 *(HP < 50%)*, Weakness to Shock 15 *(MP > 50%)*
- **max:** Resist Magicka 12, Reflect 12 *(HP < 50%)*, Resist Normal Weapons 8, Weakness to Shock 25 *(MP > 50%)*

### Orcish
- **min:** Fortify Health 8, Fortify Strength 3
- **mid:** Fortify Health 12, Fortify Strength 5, Restore Health 2 /s *(HP < 50%)*, Weakness to Magicka 15 *(HP < 25%)*
- **max:** Fortify Health 18, Fortify Strength 8, Restore Health 3 /s *(HP < 50%)*, Fortify Attack 12 *(Strength >= 60)*, Weakness to Magicka 25 *(HP < 25%)*

### Bronze
- **min:** Resist Shock 10, Resist Normal Weapons 3
- **mid:** Resist Shock 15, Resist Normal Weapons 5, Fortify Attack 8 *(under the sun)*, Weakness to Normal Weapons 15 *(out of the sun)*
- **max:** Resist Shock 20, Resist Normal Weapons 8, Fortify Attack 12 *(under the sun)*, Fortify Endurance 8, Weakness to Normal Weapons 20 *(out of the sun)*

### Plate
- **min:** Resist Normal Weapons 3, Fortify Health 8
- **mid:** Resist Normal Weapons 5, Fortify Health 12, Fortify Endurance 8 *(HP < 50%)*, Weakness to Shock 15 *(>= 75% load)*
- **max:** Resist Normal Weapons 8, Fortify Health 18, Fortify Endurance 12 *(HP < 50%)*, Resist Paralysis 20, Weakness to Shock 25 *(>= 75% load)*

### Splint
- **min:** Resist Normal Weapons 3, Fortify Health 8
- **mid:** Resist Normal Weapons 5, Fortify Health 12, Fortify Block 12 *(HP < 50%)*, Weakness to Shock 15 *(FP < 50%)*
- **max:** Resist Normal Weapons 8, Fortify Health 18, Fortify Block 18 *(HP < 50%)*, Weakness to Shock 25 *(FP < 50%)*

### Silver
- **min:** Resist Magicka 5
- **mid:** Resist Magicka 8, Turn Undead 15, Spell Absorption 8 *(at night)*, Weakness to Normal Weapons 15 *(by day)*
- **max:** Resist Magicka 12, Turn Undead 20, Spell Absorption 12 *(at night)*, Weakness to Normal Weapons 20 *(by day)*

### Stalhrim
- **min:** Resist Frost 10
- **mid:** Resist Frost 15, Restore Magicka 1 /s, Fortify Willpower 8 *(out of the sun)*, Weakness to Fire 15 *(indoors)*
- **max:** Resist Frost 20, Restore Magicka 2 /s, Fortify Willpower 12 *(out of the sun)*, Resist Magicka 12 *(out of the sun)*, Weakness to Fire 25 *(indoors)*

### Dragonbone
- **min:** Resist Fire 10, Fortify Health 8
- **mid:** Resist Fire 15, Fortify Health 12, Resist Normal Weapons 5, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Fire 20, Fortify Health 18, Resist Normal Weapons 8, Fortify Attack 12 *(HP < 50%)*, Resist Magicka 12, Weakness to Frost 25 *(out of the sun)*

### Chain Mail
- **min:** Fortify Fatigue 12
- **mid:** Fortify Fatigue 20, Resist Normal Weapons 8 *(FP < 50%)*, Weakness to Shock 15 *(>= 75% load)*
- **max:** Fortify Fatigue 28, Resist Normal Weapons 12 *(FP < 50%)*, Fortify Endurance 8, Weakness to Shock 25 *(>= 75% load)*

### Bonemold
- **min:** Fortify Health 8, Resist Blight Disease 10
- **mid:** Fortify Health 12, Resist Blight Disease 10, Fortify Endurance 8 *(HP < 50%)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Fortify Health 18, Resist Blight Disease 10, Fortify Endurance 12 *(HP < 50%)*, Resist Normal Weapons 12 *(HP < 50%)*, Weakness to Frost 25 *(out of the sun)*

### Gah-Julan
- **min:** Fortify Fatigue 12
- **mid:** Fortify Fatigue 20, Fortify Attack 8 *(HP > 75%)*, Weakness to Normal Weapons 15 *(HP < 50%)*
- **max:** Fortify Fatigue 28, Fortify Attack 12 *(HP > 75%)*, Sanctuary 8, Weakness to Normal Weapons 20 *(HP < 50%)*

### Armun-An
- **min:** Resist Fire 10
- **mid:** Resist Fire 15, Fortify Health 15 *(outdoors)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Fire 20, Fortify Health 22 *(outdoors)*, Resist Normal Weapons 8, Weakness to Frost 25 *(out of the sun)*

### Dreugh
- **min:** Resist Shock 10, Water Breathing 1
- **mid:** Resist Shock 15, Water Breathing 1, Swift Swim 30, Weakness to Frost 15 *(outdoors)*
- **max:** Resist Shock 20, Water Breathing 1, Swift Swim 40, Reflect 12 *(HP < 50%)*, Weakness to Frost 25 *(outdoors)*

### Ring Mail
- **min:** Fortify Fatigue 12, Fortify Agility 3
- **mid:** Fortify Fatigue 20, Fortify Agility 5, Resist Normal Weapons 8 *(HP > 75%)*, Weakness to Shock 15 *(HP < 50%)*
- **max:** Fortify Fatigue 28, Fortify Agility 8, Resist Normal Weapons 12 *(HP > 75%)*, Weakness to Shock 25 *(HP < 50%)*

### Scale Mail
- **min:** Resist Normal Weapons 3
- **mid:** Resist Normal Weapons 5, Fortify Fatigue 20, Weakness to Shock 15 *(>= 75% load)*
- **max:** Resist Normal Weapons 8, Fortify Fatigue 28, Fortify Health 15 *(HP < 50%)*, Weakness to Shock 25 *(>= 75% load)*

### Goblin
- **min:** Fortify Strength 3, Resist Common Disease 10
- **mid:** Fortify Strength 5, Resist Common Disease 15, Fortify Attack 8 *(FP < 50%)*, Weakness to Shock 15 *(HP > 75%)*
- **max:** Fortify Strength 8, Resist Common Disease 20, Fortify Attack 12 *(FP < 50%)*, Fortify Fatigue 28, Weakness to Shock 25 *(HP > 75%)*

### Trollbone
- **min:** Restore Health 1 /s
- **mid:** Restore Health 1 /s, Fortify Endurance 5, Restore Health 2 /s *(HP < 50%)*, Weakness to Fire 15 *(indoors)*
- **max:** Restore Health 1 /s, Fortify Endurance 8, Restore Health 3 /s *(HP < 50%)*, Fortify Health 18, Weakness to Fire 15 *(indoors)*, Weakness to Fire 15 *(HP < 50%)*

### Leather
- **min:** Fortify Fatigue 12, Fortify Acrobatics 5
- **mid:** Fortify Fatigue 20, Fortify Acrobatics 8, Fortify Sneak 12 *(at night)*, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Fatigue 28, Fortify Acrobatics 12, Fortify Sneak 18 *(at night)*, Fortify Agility 8, Weakness to Fire 25 *(indoors)*

### Netch Leather
- **min:** Resist Poison 10, Slow Fall 10
- **mid:** Resist Poison 15, Slow Fall 15, Weakness to Fire 15 *(indoors)*
- **max:** Resist Poison 20, Slow Fall 20, Fortify Speed 8 *(outdoors)*, Weakness to Fire 25 *(indoors)*

### Hide
- **min:** Fortify Fatigue 12
- **mid:** Fortify Fatigue 20, Fortify Athletics 12 *(outdoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Fatigue 28, Fortify Athletics 18 *(outdoors)*, Fortify Speed 12 *(outdoors)*, Weakness to Fire 25 *(indoors)*

### Fur
- **min:** Resist Frost 10, Fortify Fatigue 12
- **mid:** Resist Frost 15, Fortify Fatigue 20, Restore Fatigue 2 /s *(outdoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Resist Frost 20, Fortify Fatigue 28, Restore Fatigue 3 /s *(outdoors)*, Weakness to Fire 25 *(indoors)*

### Bear Fur
- **min:** Resist Frost 10
- **mid:** Resist Frost 15, Fortify Endurance 8 *(outdoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Resist Frost 20, Fortify Endurance 12 *(outdoors)*, Fortify Health 22 *(HP < 50%)*, Weakness to Fire 25 *(indoors)*

### Bearskin
- **min:** Resist Frost 10, Fortify Strength 3
- **mid:** Resist Frost 15, Fortify Strength 5, Fortify Attack 12 *(HP < 50%)*, Weakness to Fire 15 *(indoors)*
- **max:** Resist Frost 20, Fortify Strength 8, Fortify Attack 16 *(HP < 50%)*, Fortify Health 22 *(HP < 50%)*, Weakness to Fire 25 *(indoors)*

### Wolf Fur
- **min:** Resist Frost 10, Fortify Speed 3
- **mid:** Resist Frost 15, Fortify Speed 5, Night Eye 40 *(at night)*, Fortify Attack 8 *(at night and outdoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Resist Frost 20, Fortify Speed 8, Night Eye 50 *(at night)*, Fortify Attack 12 *(at night and outdoors)*, Fortify Athletics 12, Weakness to Fire 25 *(indoors)*

### Chitin
- **min:** Resist Blight Disease 10, Resist Poison 10
- **mid:** Resist Blight Disease 15, Resist Poison 15, Resist Paralysis 15, Weakness to Frost 15 *(by day)*
- **max:** Resist Blight Disease 20, Resist Poison 20, Resist Paralysis 20, Chameleon 12 *(at night)*, Weakness to Frost 25 *(by day)*

### Glass
- **min:** Fortify Agility 3, Resist Fire 10
- **mid:** Fortify Agility 5, Resist Fire 15, Sanctuary 12 *(HP > 75%)*, Weakness to Frost 15 *(HP < 50%)*
- **max:** Fortify Agility 8, Resist Fire 20, Sanctuary 16 *(HP > 75%)*, Chameleon 10, Weakness to Frost 25 *(HP < 50%)*

### Padded
- **min:** Fortify Fatigue 12
- **mid:** Fortify Fatigue 20, Resist Frost 15, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Fatigue 28, Resist Frost 20, Restore Fatigue 2 /s *(indoors)*, Weakness to Fire 25 *(indoors)*

### Studded
- **min:** Fortify Fatigue 12, Resist Normal Weapons 3
- **mid:** Fortify Fatigue 20, Resist Normal Weapons 5, Fortify Sneak 8 *(at night)*, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Fatigue 28, Resist Normal Weapons 8, Fortify Sneak 12 *(at night)*, Weakness to Fire 25 *(indoors)*

### Cephalopod
- **min:** Swift Swim 20, Water Breathing 1
- **mid:** Swift Swim 30, Water Breathing 1, Sanctuary 7
- **max:** Swift Swim 40, Water Breathing 1, Sanctuary 10, Chameleon 16 *(HP < 50%)*, Resist Frost 20

### Newtscale
- **min:** Resist Poison 10, Swift Swim 20
- **mid:** Resist Poison 15, Swift Swim 30, Water Breathing 1, Weakness to Frost 15 *(outdoors)*
- **max:** Resist Poison 20, Swift Swim 40, Water Breathing 1, Sanctuary 12 *(HP < 25% or FP < 50%)*, Weakness to Frost 25 *(outdoors)*

### Resin Molded
- **min:** Resist Blight Disease 10
- **mid:** Resist Blight Disease 15, Fortify Fatigue 20, Resist Fire 15 *(under the sun)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Blight Disease 20, Fortify Fatigue 28, Resist Fire 22 *(under the sun)*, Resist Poison 20, Weakness to Frost 25 *(out of the sun)*

### Scrap
- **min:** Fortify Luck 3
- **mid:** Fortify Luck 5, Fortify Fatigue 20, Fortify Luck 8 *(HP < 25% or FP < 50%)*, Weakness to Normal Weapons 15 *(FP > 75%)*
- **max:** Fortify Luck 8, Fortify Fatigue 28, Fortify Luck 12 *(HP < 25% or FP < 50%)*, Resist Normal Weapons 8 *(HP < 25% or FP < 50%)*, Weakness to Normal Weapons 20 *(FP > 75%)*

### Heavy Armor
- **min:** Resist Normal Weapons 3
- **mid:** Resist Normal Weapons 3, Fortify Heavy Armor 8 *(HP < 50%)*
- **max:** Resist Normal Weapons 3, Fortify Heavy Armor 14 *(HP < 50%)*

### Medium Armor
- **min:** Fortify Fatigue 12
- **mid:** Fortify Fatigue 12, Fortify Medium Armor 8 *(FP < 50%)*
- **max:** Fortify Fatigue 12, Fortify Medium Armor 14 *(FP < 50%)*, Fortify Endurance 3

### Light Armor
- **min:** Fortify Light Armor 5
- **mid:** Fortify Light Armor 8, Sanctuary 8 *(FP > 75%)*
- **max:** Fortify Light Armor 12, Sanctuary 12 *(FP > 75%)*, Fortify Agility 3

### Cloth
- **min:** Restore Magicka 1 /s, Feather 5
- **mid:** Restore Magicka 1 /s, Feather 10, Fortify Alteration 12 *(MP > 50%)*, Weakness to Normal Weapons 15 *(spell readied)*
- **max:** Restore Magicka 2 /s, Feather 15, Fortify Alteration 18 *(MP > 50%)*, Fortify Willpower 12 *(MP > 50%)*, Weakness to Normal Weapons 25 *(spell readied)*

### Nordic
- **min:** Resist Shock 10
- **mid:** Resist Shock 15, Resist Frost 10
- **max:** Resist Shock 20, Resist Frost 10, Fortify Attack 10 *(Nord only)*, Fortify Health 12 *(in werewolf form)*

### Imperial
- **min:** Fortify Personality 3, Fortify Speechcraft 5
- **mid:** Fortify Personality 5, Fortify Speechcraft 8
- **max:** Fortify Personality 8, Fortify Speechcraft 12, Fortify Attack 10 *(Imperial only)*

### Colovian
- **min:** Fortify Endurance 3
- **mid:** Fortify Endurance 5, Fortify Attack 8 *(FP > 75%)*, Resist Frost 10
- **max:** Fortify Endurance 8, Fortify Attack 12 *(FP > 75%)*, Resist Frost 10

### Bosmer
- **min:** Resist Poison 10, Fortify Agility 3
- **mid:** Resist Poison 15, Fortify Agility 5, Fortify Marksman 12 *(outdoors)*
- **max:** Resist Poison 20, Fortify Agility 8, Fortify Marksman 18 *(outdoors)*, Fortify Attack 10 *(Wood Elf only)*, Fortify Marksman 8 *(< 25% load)*

### Khajiit
- **min:** Night Eye 25, Fortify Agility 3
- **mid:** Night Eye 40, Fortify Agility 5, Fortify Acrobatics 12 *(at night)*
- **max:** Night Eye 50, Fortify Agility 8, Fortify Acrobatics 18 *(at night)*, Fortify Hand To Hand 18 *(at night)*, Fortify Luck 8 *(Khajiit only)*

### Orsimer
- **min:** Fortify Endurance 3
- **mid:** Fortify Endurance 5, Resist Magicka 8
- **max:** Fortify Endurance 8, Resist Magicka 12, Fortify Endurance 12 *(Orc only)*, Restore Health 2 /s *(in werewolf form and HP < 50%)*

### Native
- **min:** Resist Blight Disease 10, Resist Poison 10
- **mid:** Resist Blight Disease 15, Resist Poison 15, Fortify Athletics 12 *(outdoors)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Blight Disease 20, Resist Poison 20, Fortify Athletics 18 *(outdoors)*, Restore Fatigue 2 /s *(outdoors)*, Fortify Endurance 8 *(in Molag Amur)*, Weakness to Frost 25 *(out of the sun)*

### Snow Prince
- **min:** Resist Frost 10
- **mid:** Resist Frost 10, Resist Magicka 5, Fortify Attack 10 *(under the sun)*
- **max:** Resist Frost 10, Resist Magicka 5, Fortify Attack 14 *(under the sun)*, Sanctuary 12 *(under the sun)*, Fortify Agility 8 *(under the sun)*

### Falmer
- **min:** Resist Frost 10, Chameleon 5
- **mid:** Resist Frost 15, Chameleon 12 *(out of the sun)*, Night Eye 40 *(out of the sun)*, Weakness to Normal Weapons 15 *(under the sun)*
- **max:** Resist Frost 20, Chameleon 16 *(out of the sun)*, Night Eye 50 *(out of the sun)*, Sanctuary 10, Weakness to Normal Weapons 25 *(under the sun)*

### Fighters Guild
- **min:** Fortify Attack 3, Fortify Health 8
- **mid:** Fortify Attack 5, Fortify Health 12, Fortify Fatigue 20, Fortify Strength 8 *(HP < 50%)*
- **max:** Fortify Attack 8, Fortify Health 18, Fortify Fatigue 28, Fortify Strength 12 *(HP < 50%)*, Fortify Attack 5 *(Fighters Guild rank >= 6)*

### Mages Guild
- **min:** Restore Magicka 1 /s, Fortify Destruction 5
- **mid:** Restore Magicka 1 /s, Fortify Destruction 8, Fortify Intelligence 8 *(MP > 50%)*
- **max:** Restore Magicka 2 /s, Fortify Destruction 12, Fortify Intelligence 12 *(MP > 50%)*, Fortify Magicka 12 *(Destruction >= 50)*, Resist Magicka 12, Fortify Magicka 8 *(Mages Guild rank >= 6)*

### Thieves Guild
- **min:** Fortify Sneak 5, Fortify Security 5
- **mid:** Fortify Sneak 8, Fortify Security 8, Chameleon 12 *(at night and indoors)*, Weakness to Normal Weapons 15 *(under the sun)*
- **max:** Fortify Sneak 12, Fortify Security 12, Chameleon 16 *(at night and indoors)*, Fortify Agility 8, Fortify Security 8 *(Thieves Guild rank >= 6)*, Weakness to Normal Weapons 20 *(under the sun)*

### Dark Brotherhood
- **min:** Fortify Sneak 5, Resist Poison 10
- **mid:** Fortify Sneak 8, Resist Poison 15, Chameleon 12 *(at night)*
- **max:** Fortify Sneak 12, Resist Poison 20, Chameleon 16 *(at night)*, Fortify Attack 12 *(at night)*, Fortify Attack 8 *(at night and weapon sheathed)*

### Morag Tong
- **min:** Resist Poison 10, Fortify Short Blade 5
- **mid:** Resist Poison 15, Fortify Short Blade 8, Fortify Attack 8 *(indoors)*
- **max:** Resist Poison 20, Fortify Short Blade 12, Fortify Attack 12 *(indoors)*, Chameleon 12 *(indoors)*, Fortify Attack 5 *(Morag Tong rank >= 6)*

### House Hlaalu
- **min:** Fortify Mercantile 5, Fortify Personality 3
- **mid:** Fortify Mercantile 8, Fortify Personality 5, Fortify Speechcraft 12 *(indoors)*
- **max:** Fortify Mercantile 12, Fortify Personality 8, Fortify Speechcraft 18 *(indoors)*, Fortify Luck 8, Fortify Mercantile 8 *(Hlaalu rank >= 6)*

### House Indoril
- **min:** Resist Magicka 5, Fortify Magicka 8
- **mid:** Resist Magicka 8, Fortify Magicka 12, Turn Undead 30 *(at night)*
- **max:** Resist Magicka 12, Fortify Magicka 18, Turn Undead 50 *(at night)*, Fortify Magicka 8 *(Temple rank >= 6)*

### House Dres
- **min:** Resist Poison 10
- **mid:** Resist Poison 15, Fortify Long Blade 12 *(outdoors)*
- **max:** Resist Poison 20, Fortify Long Blade 18 *(outdoors)*, Fortify Endurance 8

### House Telvanni
- **min:** Restore Magicka 1 /s, Fortify Intelligence 3
- **mid:** Restore Magicka 1 /s, Fortify Intelligence 5, Fortify Mysticism 8, Spell Absorption 8 *(MP < 25%)*
- **max:** Restore Magicka 2 /s, Fortify Intelligence 8, Fortify Mysticism 12, Spell Absorption 12 *(MP < 25%)*, Fortify Destruction 12 *(MP > 50%)*, Fortify Magicka 8 *(Telvanni rank >= 6)*

### Templar
- **min:** Fortify Health 8, Turn Undead 10
- **mid:** Fortify Health 12, Turn Undead 15, Fortify Attack 8 *(by day)*, Weakness to Normal Weapons 15 *(bounty >= 1000)*
- **max:** Fortify Health 18, Turn Undead 20, Fortify Attack 12 *(by day)*, Resist Magicka 12, Fortify Health 8 *(Temple rank >= 6)*, Weakness to Normal Weapons 25 *(bounty >= 1000)*

### Guard
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Fortify Attack 8 *(by day)*, Weakness to Shock 15 *(bounty >= 1000)*
- **max:** Fortify Health 18, Resist Normal Weapons 8, Fortify Attack 12 *(by day)*, Fortify Endurance 8, Weakness to Shock 25 *(bounty >= 1000)*

### Royal Guard
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Resist Magicka 8, Weakness to Magicka 15 *(bounty >= 1000)*
- **max:** Fortify Health 18, Resist Normal Weapons 8, Resist Magicka 12, Reflect 12 *(indoors)*, Weakness to Magicka 25 *(bounty >= 1000)*

### Her Hand
- **min:** Fortify Health 8, Fortify Willpower 3
- **mid:** Fortify Health 12, Fortify Willpower 5, Restore Health 2 /s *(HP < 25%)*
- **max:** Fortify Health 18, Fortify Willpower 8, Restore Health 3 /s *(HP < 25%)*, Sanctuary 12 *(HP < 25%)*, Fortify Willpower 8 *(Temple rank >= 6)*

### Tribunal Temple
- **min:** Fortify Restoration 5, Fortify Personality 3
- **mid:** Fortify Restoration 8, Fortify Personality 5, Restore Health 2 /s *(indoors)*, Weakness to Fire 15 *(bounty >= 1000)*
- **max:** Fortify Restoration 12, Fortify Personality 8, Restore Health 2 /s *(indoors)*, Turn Undead 20, Fortify Restoration 8 *(Temple rank >= 6)*, Weakness to Fire 25 *(bounty >= 1000)*

### Artifacts
- **min:** Resist Magicka 5, Fortify Luck 3
- **mid:** Resist Magicka 8, Fortify Luck 5, Spell Absorption 8 *(HP < 25%)*
- **max:** Resist Magicka 12, Fortify Luck 8, Spell Absorption 12 *(HP < 25%)*, Reflect 12 *(HP < 25%)*, Fortify Magicka 12 *(level >= 20)*

### Master
- **min:** Fortify Luck 3, Fortify Fatigue 12
- **mid:** Fortify Luck 5, Fortify Fatigue 20, Sanctuary 12 *(HP < 25%)*
- **max:** Fortify Luck 8, Fortify Fatigue 28, Sanctuary 16 *(HP < 25%)*, Fortify Attack 12 *(HP < 25%)*, Fortify Attack 8 *(level >= 25)*

### Dragonscale
- **min:** Resist Fire 10, Fortify Agility 3
- **mid:** Resist Fire 15, Resist Magicka 8, Sanctuary 8 *(outdoors)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Fire 20, Resist Magicka 12, Sanctuary 12 *(outdoors)*, Fortify Agility 8, Weakness to Frost 25 *(out of the sun)*

### Embossed
- **min:** Fortify Personality 3
- **mid:** Fortify Personality 5, Fortify Speechcraft 12 *(indoors)*
- **max:** Fortify Personality 8, Fortify Speechcraft 18 *(indoors)*, Fortify Luck 8

### Engraved
- **min:** Resist Magicka 5
- **mid:** Resist Magicka 8, Spell Absorption 8 *(MP < 25%)*
- **max:** Resist Magicka 12, Spell Absorption 12 *(MP < 25%)*, Fortify Personality 8

### Kynareth
- **min:** Slow Fall 10, Resist Shock 10
- **mid:** Slow Fall 15, Resist Shock 15, Fortify Speed 8 *(outdoors)*
- **max:** Slow Fall 20, Resist Shock 20, Fortify Speed 12 *(outdoors)*, Restore Fatigue 2 /s *(outdoors)*

---

## Tamriel Rebuilt add-on sets (67)

### Alessian Bronze
- **min:** Fortify Health 8, Resist Magicka 5
- **mid:** Fortify Health 12, Resist Magicka 8, Turn Undead 30 *(under the sun)*, Weakness to Shock 15 *(>= 75% load)*
- **max:** Fortify Health 18, Resist Magicka 12, Turn Undead 50 *(under the sun)*, Fortify Attack 8, Weakness to Shock 25 *(>= 75% load)*

### Alit Hide
- **min:** Fortify Agility 3, Resist Poison 10
- **mid:** Fortify Agility 5, Resist Poison 15, Fortify Speed 8 *(outdoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Agility 8, Resist Poison 20, Fortify Speed 12 *(outdoors)*, Fortify Attack 8 *(outdoors)*, Weakness to Fire 25 *(indoors)*

### Altmer
- **min:** Restore Magicka 1 /s, Fortify Intelligence 3
- **mid:** Restore Magicka 1 /s, Fortify Intelligence 5, Fortify Destruction 12 *(MP > 50%)*, Weakness to Magicka 15 *(MP > 50%)*
- **max:** Restore Magicka 2 /s, Fortify Intelligence 8, Fortify Destruction 18 *(MP > 50%)*, Fortify Willpower 12 *(High Elf only)*, Weakness to Magicka 25 *(MP > 50%)*

### Ancient Nordic
- **min:** Resist Frost 10, Fortify Health 8
- **mid:** Resist Frost 15, Fortify Health 12, Resist Normal Weapons 5, Turn Undead 30 *(at night)*
- **max:** Resist Frost 20, Fortify Health 18, Resist Normal Weapons 8, Turn Undead 50 *(at night)*

### Anvil
- **min:** Water Breathing 1, Swift Swim 20
- **mid:** Water Breathing 1, Swift Swim 30, Resist Frost 15
- **max:** Water Breathing 1, Swift Swim 40, Resist Frost 20, Fortify Personality 8, Restore Fatigue 2 /s *(outdoors)*

### Argonian
- **min:** Water Breathing 1, Resist Poison 10
- **mid:** Water Breathing 1, Resist Poison 15, Resist Common Disease 15, Swift Swim 30
- **max:** Water Breathing 1, Resist Poison 20, Resist Common Disease 20, Swift Swim 40, Restore Health 2 /s *(Argonian only)*

### Ayleid
- **min:** Restore Magicka 1 /s, Light 8
- **mid:** Restore Magicka 1 /s, Spell Absorption 8 *(at night and outdoors)*
- **max:** Restore Magicka 2 /s, Spell Absorption 12 *(at night and outdoors)*, Resist Magicka 12

### Bal-Darum
- **min:** Fortify Strength 3, Resist Normal Weapons 3
- **mid:** Fortify Strength 5, Resist Normal Weapons 5, Fortify Armorer 12 *(HP < 50%)*
- **max:** Fortify Strength 8, Resist Normal Weapons 8, Fortify Armorer 18 *(HP < 50%)*

### Breton
- **min:** Resist Magicka 5
- **mid:** Resist Magicka 8, Spell Absorption 5
- **max:** Resist Magicka 12, Spell Absorption 8, Fortify Conjuration 12 *(MP > 50%)*, Fortify Willpower 8 *(Breton only)*

### Cataphract
- **min:** Fortify Health 8, Fortify Attack 3
- **mid:** Fortify Health 12, Fortify Attack 5, Resist Normal Weapons 5, Weakness to Shock 15 *(>= 75% load)*
- **max:** Fortify Health 18, Fortify Attack 8, Fortify Attack 8 *(FP > 75%)*, Resist Normal Weapons 8, Weakness to Shock 25 *(>= 75% load)*

### Chap-thil
- **min:** Resist Fire 10, Fortify Fatigue 12
- **mid:** Resist Fire 15, Fortify Fatigue 20, Resist Paralysis 15, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Fire 20, Fortify Fatigue 28, Resist Paralysis 20, Restore Fatigue 2 /s *(under the sun)*, Weakness to Frost 25 *(out of the sun)*

### Chev-Aram
- **min:** Fortify Attack 3, Fortify Agility 3
- **mid:** Fortify Attack 5, Fortify Agility 5, Sanctuary 8 *(HP > 75%)*
- **max:** Fortify Attack 8, Fortify Agility 8, Sanctuary 12 *(HP > 75%)*, Fortify Health 18

### Chuzei
- **min:** Fortify Attack 3, Fortify Personality 3
- **mid:** Fortify Attack 5, Fortify Personality 5, Fortify Attack 8 *(HP > 75%)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Fortify Attack 8, Fortify Personality 8, Fortify Attack 12 *(HP > 75%)*, Resist Normal Weapons 8, Weakness to Frost 25 *(out of the sun)*

### Colovian Leather
- **min:** Fortify Fatigue 12, Fortify Agility 3
- **mid:** Fortify Fatigue 20, Fortify Agility 5, Fortify Sneak 12 *(outdoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Fatigue 28, Fortify Agility 8, Fortify Sneak 18 *(outdoors)*, Fortify Acrobatics 12, Weakness to Fire 25 *(indoors)*

### Companions
- **min:** Fortify Attack 3, Fortify Fatigue 12
- **mid:** Fortify Attack 5, Fortify Fatigue 20, Fortify Health 15 *(HP < 50%)*
- **max:** Fortify Attack 8, Fortify Fatigue 28, Fortify Health 22 *(HP < 50%)*, Fortify Personality 8, Fortify Attack 8 *(in werewolf form)*

### Crown Guard
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Fortify Personality 5, Fortify Attack 8 *(indoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Health 18, Resist Normal Weapons 8, Fortify Personality 8, Fortify Attack 12 *(indoors)*, Weakness to Fire 25 *(indoors)*

### Daedric Hide
- **min:** Spell Absorption 3
- **mid:** Spell Absorption 3, Sanctuary 12 *(at night)*, Weakness to Fire 15 *(indoors)*
- **max:** Spell Absorption 3, Sanctuary 16 *(at night)*, Restore Magicka 2 /s *(at night)*, Weakness to Fire 25 *(indoors)*

### Domina
- **min:** Fortify Personality 3, Fortify Attack 3
- **mid:** Fortify Personality 5, Fortify Attack 5, Fortify Health 12
- **max:** Fortify Personality 8, Fortify Attack 8, Fortify Health 18, Sanctuary 12 *(Personality >= 60)*

### Dunmer
- **min:** Resist Fire 10
- **mid:** Resist Fire 10, Fortify Willpower 3
- **max:** Resist Fire 10, Fortify Willpower 3, Fortify Attack 10 *(Dark Elf only)*

### Ebonweave
- **min:** Restore Magicka 1 /s, Fortify Fatigue 12
- **mid:** Restore Magicka 1 /s, Fortify Fatigue 20, Resist Magicka 8, Spell Absorption 8 *(MP < 25%)*
- **max:** Restore Magicka 2 /s, Fortify Fatigue 28, Resist Magicka 12, Spell Absorption 12 *(MP < 25%)*

### Falkreath Guard
- **min:** Fortify Health 8, Resist Frost 10
- **mid:** Fortify Health 12, Resist Frost 15, Resist Normal Weapons 5, Fortify Attack 8 *(by day)*, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Health 18, Resist Frost 20, Resist Normal Weapons 8, Fortify Attack 12 *(by day)*, Fortify Endurance 8, Weakness to Fire 25 *(indoors)*

### Gah'Kogo
- **min:** Resist Poison 10, Fortify Agility 3
- **mid:** Resist Poison 10, Resist Paralysis 15, Fortify Agility 8 *(at night)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Poison 10, Resist Paralysis 20, Fortify Agility 12 *(at night)*, Fortify Sneak 12 *(at night)*, Weakness to Frost 25 *(out of the sun)*

### Gilded Glass
- **min:** Fortify Agility 3, Fortify Personality 3
- **mid:** Fortify Agility 5, Resist Fire 15, Fortify Personality 5, Sanctuary 8 *(indoors)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Fortify Agility 8, Resist Fire 20, Fortify Personality 8, Sanctuary 12 *(indoors)*, Weakness to Frost 25 *(out of the sun)*

### Gold
- **min:** Fortify Personality 3
- **mid:** Fortify Personality 5, Fortify Mercantile 12 *(indoors)*, Weakness to Shock 15 *(>= 75% load)*
- **max:** Fortify Personality 8, Fortify Mercantile 18 *(indoors)*, Resist Magicka 12, Fortify Luck 8, Weakness to Shock 25 *(>= 75% load)*

### Golden Saint
- **min:** Resist Magicka 5, Spell Absorption 3
- **mid:** Resist Magicka 8, Spell Absorption 5, Reflect 8 *(HP < 50%)*, Weakness to Shock 15 *(>= 75% load)*
- **max:** Resist Magicka 12, Spell Absorption 8, Reflect 12 *(HP < 50%)*, Fortify Attack 8, Weakness to Shock 25 *(>= 75% load)*

### Guar Hide
- **min:** Fortify Fatigue 12, Resist Blight Disease 10
- **mid:** Fortify Fatigue 20, Resist Blight Disease 15, Fortify Endurance 5, Feather 10 *(outdoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Fatigue 28, Resist Blight Disease 20, Fortify Endurance 8, Feather 15 *(outdoors)*, Fortify Athletics 12, Weakness to Fire 25 *(indoors)*

### House Direnni
- **min:** Resist Magicka 5, Restore Magicka 1 /s
- **mid:** Resist Magicka 8, Restore Magicka 1 /s, Spell Absorption 5
- **max:** Resist Magicka 12, Restore Magicka 1 /s, Spell Absorption 8, Reflect 8 *(MP > 50%)*

### House Redoran
- **min:** Fortify Health 8, Resist Blight Disease 10
- **mid:** Fortify Health 12, Resist Blight Disease 10, Fortify Spear 12 *(HP < 50%)*
- **max:** Fortify Health 18, Resist Blight Disease 10, Fortify Spear 18 *(HP < 50%)*, Resist Normal Weapons 8, Fortify Endurance 8, Fortify Spear 8 *(Redoran rank >= 6)*

### Kagouti Hide
- **min:** Fortify Speed 3, Fortify Athletics 5
- **mid:** Fortify Speed 5, Fortify Athletics 8, Resist Poison 15, Fortify Attack 8 *(outdoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Speed 8, Fortify Athletics 12, Resist Poison 20, Fortify Attack 12 *(outdoors)*, Weakness to Fire 25 *(indoors)*

### Kalantar
- **min:** Resist Fire 10, Fortify Attack 3
- **mid:** Resist Fire 15, Fortify Attack 5, Fortify Strength 5
- **max:** Resist Fire 20, Fortify Attack 8, Fortify Strength 8, Fortify Health 15 *(HP < 50%)*

### Klibanion
- **min:** Resist Normal Weapons 3, Fortify Endurance 3
- **mid:** Resist Normal Weapons 5, Fortify Endurance 5, Fortify Health 15 *(HP < 50%)*, Weakness to Shock 15 *(>= 75% load)*
- **max:** Resist Normal Weapons 8, Fortify Endurance 8, Fortify Health 22 *(HP < 50%)*, Weakness to Shock 25 *(>= 75% load)*

### Kragen
- **min:** Fortify Mercantile 5, Fortify Luck 3
- **mid:** Fortify Mercantile 8, Fortify Luck 5, Fortify Mercantile 12 *(indoors)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Fortify Mercantile 12, Fortify Luck 8, Fortify Mercantile 18 *(indoors)*, Weakness to Frost 25 *(out of the sun)*

### Kvetchi
- **min:** Resist Blight Disease 10, Fortify Fatigue 12
- **mid:** Resist Blight Disease 15, Fortify Fatigue 20, Resist Poison 15, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Blight Disease 20, Fortify Fatigue 28, Resist Poison 20, Restore Fatigue 2 /s *(FP < 50%)*, Weakness to Frost 25 *(out of the sun)*

### Lamellar
- **min:** Resist Normal Weapons 3, Fortify Fatigue 12
- **mid:** Resist Normal Weapons 5, Fortify Fatigue 20, Weakness to Shock 15 *(>= 75% load)*
- **max:** Resist Normal Weapons 8, Fortify Fatigue 28, Fortify Health 15 *(FP < 50%)*, Weakness to Shock 25 *(>= 75% load)*

### Mananaut
- **min:** Resist Shock 10, Water Breathing 1
- **mid:** Resist Shock 15, Water Breathing 1, Fortify Intelligence 5, Slow Fall 15
- **max:** Resist Shock 20, Water Breathing 1, Fortify Intelligence 8, Slow Fall 20, Reflect 12 *(out of the sun)*

### Manatee Leather
- **min:** Water Breathing 1, Swift Swim 20
- **mid:** Water Breathing 1, Swift Swim 30, Fortify Fatigue 20, Weakness to Fire 15 *(indoors)*
- **max:** Water Breathing 1, Swift Swim 40, Fortify Fatigue 28, Resist Frost 20, Restore Fatigue 2 /s *(outdoors)*, Weakness to Fire 25 *(indoors)*

### Maormer
- **min:** Water Breathing 1, Swift Swim 20
- **mid:** Water Breathing 1, Swift Swim 30, Resist Shock 15
- **max:** Water Breathing 1, Swift Swim 40, Resist Shock 20, Chameleon 16 *(at night)*

### Maradlai
- **min:** Fortify Speed 3, Fortify Fatigue 12
- **mid:** Fortify Speed 5, Fortify Fatigue 20
- **max:** Fortify Speed 8, Fortify Fatigue 28, Sanctuary 12 *(FP < 50%)*

### Militia
- **min:** Fortify Fatigue 12, Fortify Health 8
- **mid:** Fortify Fatigue 20, Fortify Health 12, Resist Normal Weapons 5, Fortify Attack 8 *(by day)*, Restore Health 1 /s *(level < 10)*, Weakness to Normal Weapons 15 *(bounty >= 1000)*
- **max:** Fortify Fatigue 28, Fortify Health 18, Resist Normal Weapons 8, Fortify Attack 12 *(by day)*, Restore Health 1 /s *(level < 10)*, Weakness to Normal Weapons 25 *(bounty >= 1000)*

### Molecrab
- **min:** Resist Normal Weapons 3
- **mid:** Resist Normal Weapons 5, Sanctuary 8 *(indoors or at night)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Normal Weapons 8, Sanctuary 12 *(indoors or at night)*, Fortify Health 18, Weakness to Frost 25 *(out of the sun)*

### Narsis Watch
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Fortify Endurance 5, Fortify Attack 8 *(by day)*
- **max:** Fortify Health 18, Resist Normal Weapons 8, Fortify Endurance 8, Fortify Attack 12 *(by day)*, Fortify Mercantile 12

### Navy
- **min:** Swift Swim 20, Water Breathing 1
- **mid:** Swift Swim 30, Water Breathing 1, Resist Frost 15, Fortify Attack 8 *(outdoors)*
- **max:** Swift Swim 40, Water Breathing 1, Resist Frost 20, Fortify Attack 12 *(outdoors)*, Fortify Fatigue 28

### Necrom Guard
- **min:** Turn Undead 10, Resist Magicka 5
- **mid:** Turn Undead 15, Resist Magicka 8, Fortify Health 12, Turn Undead 20 *(at night)*, Weakness to Fire 15 *(indoors)*
- **max:** Turn Undead 20, Resist Magicka 12, Fortify Health 18, Turn Undead 30 *(at night)*, Fortify Restoration 12, Weakness to Fire 25 *(indoors)*

### Nibenese
- **min:** Restore Magicka 1 /s, Fortify Mercantile 5
- **mid:** Restore Magicka 1 /s, Fortify Mercantile 8, Resist Magicka 8
- **max:** Restore Magicka 2 /s, Fortify Mercantile 12, Resist Magicka 12, Fortify Personality 8 *(Imperial only)*

### Oloman
- **min:** Resist Fire 10, Resist Normal Weapons 3
- **mid:** Resist Fire 15, Resist Normal Weapons 5, Fortify Endurance 8 *(HP < 50%)*
- **max:** Resist Fire 20, Resist Normal Weapons 8, Fortify Endurance 12 *(HP < 50%)*

### Quey Chitin
- **min:** Water Breathing 1, Resist Poison 10
- **mid:** Water Breathing 1, Resist Poison 15, Resist Normal Weapons 5, Weakness to Frost 15 *(out of the sun)*
- **max:** Water Breathing 1, Resist Poison 20, Resist Normal Weapons 8, Swift Swim 60 *(HP < 50%)*, Weakness to Frost 25 *(out of the sun)*

### Reach
- **min:** Resist Frost 10, Fortify Endurance 3
- **mid:** Resist Frost 15, Fortify Endurance 5, Fortify Attack 5, Spell Absorption 8 *(at night)*
- **max:** Resist Frost 20, Fortify Endurance 8, Fortify Attack 8, Spell Absorption 12 *(at night)*

### Reach Royal Guard
- **min:** Fortify Health 8, Resist Frost 10
- **mid:** Fortify Health 12, Resist Frost 15, Resist Normal Weapons 5, Weakness to Fire 15 *(indoors)*
- **max:** Fortify Health 18, Resist Frost 20, Resist Normal Weapons 8, Fortify Attack 12 *(HP < 50%)*, Weakness to Fire 25 *(indoors)*

### Red Dome Templar
- **min:** Fortify Health 8, Resist Magicka 5
- **mid:** Fortify Health 12, Resist Magicka 8, Turn Undead 15, Restore Health 2 /s *(HP < 25%)*, Weakness to Magicka 15 *(bounty >= 1000)*
- **max:** Fortify Health 18, Resist Magicka 12, Turn Undead 20, Restore Health 3 /s *(HP < 25%)*, Fortify Restoration 12, Turn Undead 15 *(Temple rank >= 6)*, Weakness to Magicka 25 *(bounty >= 1000)*

### Redguard
- **min:** Resist Poison 10, Fortify Endurance 3
- **mid:** Resist Poison 15, Fortify Endurance 5, Fortify Attack 8 *(FP < 50%)*, Weakness to Fire 15 *(indoors)*
- **max:** Resist Poison 20, Fortify Endurance 8, Fortify Attack 12 *(FP < 50%)*, Restore Fatigue 2 /s *(FP < 50%)*, Fortify Agility 8 *(Redguard only)*, Fortify Attack 5 *(born under The Warrior)*, Weakness to Fire 25 *(indoors)*

### Redguard Iron Lamellar
- **min:** Resist Normal Weapons 3, Fortify Health 8
- **mid:** Resist Normal Weapons 5, Fortify Health 12, Fortify Attack 5, Weakness to Shock 15 *(>= 75% load)*
- **max:** Resist Normal Weapons 8, Fortify Health 18, Fortify Attack 8, Fortify Attack 8 *(FP < 50%)*, Fortify Endurance 8, Weakness to Shock 25 *(>= 75% load)*

### Reman
- **min:** Fortify Health 8, Fortify Attack 3
- **mid:** Fortify Health 12, Fortify Attack 5, Fortify Personality 5
- **max:** Fortify Health 18, Fortify Attack 8, Fortify Personality 8, Resist Normal Weapons 8, Fortify Attack 16 *(HP < 25%)*

### Rihad Guard
- **min:** Resist Poison 10, Fortify Fatigue 12
- **mid:** Resist Poison 15, Fortify Fatigue 20, Resist Normal Weapons 5, Fortify Attack 8 *(under the sun)*, Weakness to Fire 15 *(indoors)*
- **max:** Resist Poison 20, Fortify Fatigue 28, Resist Normal Weapons 8, Fortify Attack 12 *(under the sun)*, Fortify Endurance 8, Weakness to Fire 25 *(indoors)*

### Riverwatch
- **min:** Fortify Health 8, Water Walking 1
- **mid:** Fortify Health 12, Water Walking 1, Resist Normal Weapons 5
- **max:** Fortify Health 18, Water Walking 1, Resist Normal Weapons 8, Resist Blight Disease 20, Fortify Attack 8 *(outdoors)*

### Rourken
- **min:** Resist Shock 10, Fortify Health 8
- **mid:** Resist Shock 15, Fortify Health 12, Resist Normal Weapons 5, Reflect 8 *(indoors)*
- **max:** Resist Shock 20, Fortify Health 18, Resist Normal Weapons 8, Reflect 12 *(indoors)*

### Sacred Lands
- **min:** Resist Magicka 5, Fortify Health 8
- **mid:** Resist Magicka 8, Fortify Health 12, Fortify Restoration 8, Restore Health 2 /s *(outdoors)*
- **max:** Resist Magicka 12, Fortify Health 18, Fortify Restoration 12, Restore Health 2 /s *(outdoors)*, Turn Undead 20

### Saliache
- **min:** Resist Blight Disease 10, Fortify Athletics 5
- **mid:** Resist Blight Disease 15, Fortify Athletics 8, Resist Poison 15, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Blight Disease 20, Fortify Athletics 12, Resist Poison 20, Fortify Agility 12 *(HP > 75%)*, Weakness to Frost 25 *(out of the sun)*

### Shellmold
- **min:** Resist Normal Weapons 3, Resist Shock 10
- **mid:** Resist Normal Weapons 5, Resist Shock 15, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Normal Weapons 8, Resist Shock 20, Fortify Health 15 *(HP < 50%)*, Weakness to Frost 25 *(out of the sun)*

### Shinathi Chitin
- **min:** Resist Poison 10, Resist Blight Disease 10
- **mid:** Resist Poison 15, Resist Blight Disease 15, Resist Paralysis 15, Fortify Sneak 12 *(at night)*, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Poison 20, Resist Blight Disease 20, Resist Paralysis 20, Fortify Sneak 18 *(at night)*, Weakness to Frost 25 *(out of the sun)*

### Shipal-Arai
- **min:** Fortify Spear 5, Fortify Agility 3
- **mid:** Fortify Spear 8, Fortify Agility 5, Resist Paralysis 15, Weakness to Frost 15 *(out of the sun)*
- **max:** Fortify Spear 12, Fortify Agility 8, Resist Paralysis 20, Fortify Attack 8 *(outdoors)*, Weakness to Frost 25 *(out of the sun)*

### Skingrad
- **min:** Resist Poison 10, Resist Common Disease 10
- **mid:** Resist Poison 15, Resist Common Disease 15, Fortify Personality 5, Fortify Attack 8 *(at night)*
- **max:** Resist Poison 20, Resist Common Disease 20, Fortify Personality 8, Fortify Attack 12 *(at night)*, Resist Magicka 12

### Sutch Mail
- **min:** Fortify Health 8, Resist Normal Weapons 3
- **mid:** Fortify Health 12, Resist Normal Weapons 5, Fortify Attack 5
- **max:** Fortify Health 18, Resist Normal Weapons 8, Fortify Attack 8, Restore Fatigue 2 /s *(FP < 50%)*

### Thirr
- **min:** Water Breathing 1, Fortify Strength 3
- **mid:** Water Breathing 1, Fortify Strength 5, Swift Swim 30, Weakness to Frost 15 *(out of the sun)*
- **max:** Water Breathing 1, Fortify Strength 8, Swift Swim 40, Fortify Attack 8 *(by day)*, Weakness to Frost 25 *(out of the sun)*

### Toadscale
- **min:** Resist Poison 10, Resist Frost 10
- **mid:** Resist Poison 15, Resist Frost 15, Resist Common Disease 15, Weakness to Fire 15 *(indoors)*
- **max:** Resist Poison 20, Resist Frost 20, Resist Common Disease 20, Sanctuary 12 *(at night)*, Weakness to Fire 25 *(indoors)*

### Watchman
- **min:** Night Eye 25, Fortify Fatigue 12
- **mid:** Night Eye 40, Fortify Fatigue 20, Fortify Attack 8 *(at night)*
- **max:** Night Eye 50, Fortify Fatigue 28, Fortify Attack 12 *(at night)*, Detect Animal 50

### Wenbone
- **min:** Resist Poison 10, Fortify Marksman 5
- **mid:** Resist Poison 15, Fortify Marksman 8, Fortify Agility 5, Fortify Sneak 12 *(outdoors)*, Weakness to Fire 15 *(indoors)*
- **max:** Resist Poison 20, Fortify Marksman 12, Fortify Sneak 18 *(outdoors)*, Fortify Attack 8 *(Marksman >= 50)*, Weakness to Fire 25 *(indoors)*

### Wormmouth
- **min:** Resist Poison 10
- **mid:** Resist Poison 15, Resist Blight Disease 15, Weakness to Frost 15 *(out of the sun)*
- **max:** Resist Poison 20, Resist Blight Disease 20, Resist Paralysis 20, Fortify Agility 8 *(at night)*, Weakness to Frost 25 *(out of the sun)*

Sets from add-ons that are not installed are skipped automatically —
the corresponding entries simply never apply.
