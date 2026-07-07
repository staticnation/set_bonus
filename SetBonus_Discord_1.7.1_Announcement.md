**Set Bonus 1.7.1 is out — Reactive Armour**

Your armour now reacts to the *moment*, and every drawback finally bites only when it should. Drop it in over 1.7 — no new plugin, safe mid-save.

**Situational drawbacks**
Every set's Weakness is now conditional instead of a flat always-on penalty:
• Metals can't shed a bolt while you're **overburdened**
• Leathers & furs catch fire near a **hearth**
• Resin & chitin go brittle in the **cold dark**
• Daedric punishes **cowards** (weapon sheathed and unhurt)
• Falmer relics burn in **daylight**
(Drawback slider to 0 still skips them entirely.)

**A much wider condition vocabulary — same on MWSE & OpenMW**
Eight new states the framework can now read natively:
• **Carry weight** • **Faction rank & standing** • **Bounty** • **Region** • **Birthsign** • **Werewolf form** • **Weapon stance**
→ rank-scaling guild/House gear, werewolf-blood on Nordic/Orsimer/Companions, lawful armour that spurns a wanted wearer, homeland regions, stance-gated assassin strikes… **460 conditional effects across all 137 sets**, stacking-verified.

**Full Armor-class sets**
Heavy / Medium / Light now cover **every** piece of their weight class across the base game + TR, OAAB, NOD, AATL (shields too).

**Optional Flag Companion**
A tiny opt-in add-on that feeds **combat / weather / movement** to the framework so authors can build sets reacting to them. Not needed for the base mod. (MWSE: all of it. OpenMW: swimming/movement — its Lua can't read weather/combat — hook left open for a dedicated mod.)

**Also fixed**
Enchanted/copied-item matching now checks an item's mesh as well as its icon, closing a rare false-match where an unrelated add-on item reusing a vanilla icon (e.g. some NOD and TR pieces) could get counted toward the wrong set.

Grab it on Nexus — MWSE and OpenMW builds on the same page. OpenMW needs **0.51+**.
Modders: the interop guide covers all the new condition kinds, and the companion doc shows the flag hook.
