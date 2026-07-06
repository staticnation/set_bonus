#!/usr/bin/env python3
"""Set Bonus -- Conditional Rebalance build script.

Single source of truth: MWSE/mods/Static/SetBonusRebalance/data.lua
Generates:
  * OpenMW_SetBonusRebalance/scripts/SetBonusRebalance/data.lua  (OpenMW ids)
  * SetBonus_Rebalance_Reference.md                              (spell list)
and validates the data first (set names against the base OpenMW data.lua,
effect/skill/attribute names, per-tier effect caps, condition schema --
cross-engine conditions only, so no combat/weather/flag) plus the stacking
rules for overlapping sets (see check_stacking below).

Requires: pip install lupa
"""

import re
import sys
from pathlib import Path

from lupa import LuaRuntime

ROOT = Path(__file__).parent
SRC = ROOT / "MWSE/mods/Static/SetBonusRebalance/data.lua"
BASE_OPENMW_DATA = ROOT / "OpenMW_SetBonus/scripts/SetBonus/data.lua"
OUT_OPENMW = ROOT / "OpenMW_SetBonusRebalance/scripts/SetBonusRebalance/data.lua"
OUT_MD = ROOT / "SetBonus_Rebalance_Reference.md"

TIERS = ("min", "mid", "max")

# MWSE effect names used by the project (camelCase, matching tes3.effect keys).
EFFECTS = {
    "resistFire", "resistFrost", "resistShock", "resistMagicka", "resistPoison",
    "resistCommonDisease", "resistBlightDisease", "resistNormalWeapons",
    "resistParalysis", "weaknesstoFire", "weaknesstoFrost", "weaknesstoShock",
    "weaknesstoMagicka", "weaknesstoNormalWeapons", "weaknesstoPoison",
    "fortifyHealth", "fortifyFatigue", "fortifyMagicka", "fortifyAttack",
    "fortifySkill", "fortifyAttribute", "restoreHealth", "restoreMagicka",
    "restoreFatigue", "spellAbsorption", "reflect", "sanctuary", "chameleon",
    "nightEye", "swiftSwim", "waterBreathing", "waterWalking", "slowFall",
    "feather", "light", "turnUndead", "detectAnimal", "jump", "levitate",
    "telekinesis",
}
SKILLS = {
    "block", "armorer", "mediumArmor", "heavyArmor", "bluntWeapon", "longBlade",
    "axe", "spear", "athletics", "enchant", "destruction", "alteration",
    "illusion", "conjuration", "mysticism", "restoration", "alchemy",
    "unarmored", "security", "sneak", "acrobatics", "lightArmor", "shortBlade",
    "marksman", "mercantile", "speechcraft", "handToHand",
}
ATTRIBUTES = {"strength", "intelligence", "willpower", "agility", "speed",
              "endurance", "personality", "luck"}
RESTORE = {"restoreHealth", "restoreMagicka", "restoreFatigue"}
# Conditions that evaluate natively on BOTH engines. combat/weather/flag are
# deliberately excluded for MWSE/OpenMW parity (OpenMW 0.51 cannot read them).
COND_KINDS = {"health", "magicka", "fatigue", "attribute", "skill", "level",
              "time", "sun", "location", "race", "class"}
OPS = {"<", "<=", ">", ">=", "==", "~="}

errors = []


def err(msg):
    errors.append(msg)


def lua_to_py(obj):
    """Recursively convert a lupa table to dict/list."""
    if not hasattr(obj, "keys"):
        return obj
    keys = list(obj.keys())
    if keys and all(isinstance(k, int) for k in keys) and sorted(keys) == list(range(1, len(keys) + 1)):
        return [lua_to_py(obj[k]) for k in sorted(keys)]
    return {k: lua_to_py(obj[k]) for k in keys}


def load_sets():
    lua = LuaRuntime(unpack_returned_tuples=True)
    code = SRC.read_text(encoding="utf-8").replace("\x00", "")
    return lua_to_py(lua.execute(code))


def canonical_names():
    text = BASE_OPENMW_DATA.read_text(encoding="utf-8")
    return re.findall(r'name = "([^"]+)"', text)


def load_base_sets():
    """Full base data (items + thresholds) for overlap analysis."""
    lua = LuaRuntime(unpack_returned_tuples=True)
    return lua_to_py(lua.execute(BASE_OPENMW_DATA.read_text(encoding="utf-8")))


# ---------------------------------------------------------------- validation

def check_condition(c, where):
    if not isinstance(c, (dict, list)):
        err(f"{where}: condition must be a table")
        return
    if isinstance(c, list):  # AND-array
        for i, sub in enumerate(c):
            check_condition(sub, f"{where}[{i + 1}]")
        return
    if "any" in c or "all" in c:
        for k in ("any", "all"):
            if k in c:
                for i, sub in enumerate(c[k]):
                    check_condition(sub, f"{where}.{k}[{i + 1}]")
        return
    kind = c.get("kind")
    if kind not in COND_KINDS:
        err(f"{where}: condition kind '{kind}' is not cross-engine safe "
            f"(allowed: {sorted(COND_KINDS)})")
        return
    if kind in ("health", "magicka", "fatigue", "attribute", "skill", "level"):
        op = c.get("op", "<" if kind in ("health", "magicka", "fatigue") else ">=")
        if op not in OPS:
            err(f"{where}: bad op '{op}'")
        if not isinstance(c.get("value"), (int, float)):
            err(f"{where}: numeric 'value' required")
        if kind == "attribute" and c.get("id") not in ATTRIBUTES:
            err(f"{where}: unknown attribute id '{c.get('id')}'")
        if kind == "skill" and c.get("id") not in SKILLS:
            err(f"{where}: unknown skill id '{c.get('id')}'")
    elif kind == "time" and c.get("value") not in ("day", "night"):
        err(f"{where}: time value must be day|night")
    elif kind == "sun" and c.get("value") not in ("up", "down"):
        err(f"{where}: sun value must be up|down")
    elif kind == "location" and c.get("value") not in ("interior", "exterior"):
        err(f"{where}: location value must be interior|exterior")


def check_effect(e, where):
    eff = e.get("effect")
    if eff not in EFFECTS:
        err(f"{where}: unknown effect '{eff}'")
    if eff == "fortifySkill" and e.get("skill") not in SKILLS:
        err(f"{where}: fortifySkill needs a valid 'skill' (got {e.get('skill')})")
    if eff == "fortifyAttribute" and e.get("attribute") not in ATTRIBUTES:
        err(f"{where}: fortifyAttribute needs a valid 'attribute' (got {e.get('attribute')})")
    if eff not in ("fortifySkill",) and "skill" in e:
        err(f"{where}: stray 'skill' on {eff}")
    if eff not in ("fortifyAttribute",) and "attribute" in e:
        err(f"{where}: stray 'attribute' on {eff}")
    if not isinstance(e.get("magnitude"), (int, float)) or e["magnitude"] < 1:
        err(f"{where}: 'magnitude' must be a number >= 1")
    if "condition" in e:
        check_condition(e["condition"], where + ".condition")


def validate(sets, canon):
    canon_set = set(canon)
    seen = set()
    for s in sets:
        name = s.get("name")
        where = f"set '{name}'"
        if name in seen:
            err(f"{where}: duplicate entry")
        seen.add(name)
        if name not in canon_set:
            err(f"{where}: not a registered base/TR set name")
        if "items" in s or "thresholds" in s:
            err(f"{where}: rebalance entries must not carry items/thresholds")
        bonuses = s.get("bonuses", {})
        for tier in TIERS:
            defs = bonuses.get(tier, [])
            uncond = [e for e in defs if "condition" not in e]
            if len(uncond) > 8:
                err(f"{where} {tier}: {len(uncond)} unconditional effects (max 8)")
            for i, e in enumerate(defs):
                check_effect(e, f"{where} {tier}[{i + 1}]")
        unknown = set(bonuses) - set(TIERS)
        if unknown:
            err(f"{where}: unknown bonus tier(s) {sorted(unknown)}")
    missing = [n for n in canon if n not in seen]
    if missing:
        err(f"canonical sets missing from rebalance: {missing}")


# --------------------------------------------------- stacking (overlap) rules
#
# Items commonly belong to several sets, so one outfit can hold max tier in
# multiple sets at once ("co-max"). To keep that from doubling the same stats:
#   R1  in a co-max pair, the same always-on effect signature may be full-
#       strength in at most ONE set; the other may keep an "echo" at or below
#       the cap here (or drop it).
#   R2  in a co-max pair, the same effect may not appear conditionally in both
#       sets with the same condition kind (they'd spike together).
# Flag effects (Water Breathing/Walking, etc.) are exempt.

ECHO = {
    "resistFire": 10, "resistFrost": 10, "resistShock": 10, "resistPoison": 10,
    "resistCommonDisease": 10, "resistBlightDisease": 10, "resistMagicka": 5,
    "resistNormalWeapons": 3, "resistParalysis": 15,
    "fortifyHealth": 8, "fortifyFatigue": 12, "fortifyMagicka": 8,
    "fortifyAttack": 3, "fortifySkill": 5, "fortifyAttribute": 3,
    "restoreHealth": 1, "restoreMagicka": 1, "restoreFatigue": 1,
    "spellAbsorption": 3, "reflect": 3, "sanctuary": 5, "chameleon": 5,
    "turnUndead": 10, "nightEye": 25, "swiftSwim": 20, "slowFall": 10,
    "feather": 5, "light": 8, "detectAnimal": 50,
}
FLAG_EFFECTS = {"waterBreathing", "waterWalking", "levitate", "jump", "telekinesis"}


def sig(e):
    return (e["effect"], e.get("skill"), e.get("attribute"))


def cond_kinds(c):
    kinds = set()
    if isinstance(c, list):
        for x in c:
            kinds |= cond_kinds(x)
    elif isinstance(c, dict):
        if "any" in c or "all" in c:
            for x in list(c.get("any", [])) + list(c.get("all", [])):
                kinds |= cond_kinds(x)
        elif "kind" in c:
            kinds.add(c["kind"])
    return kinds


def collect_effects(s):
    """-> (flats {sig: max mag across tiers}, conds {sig: set of kind-tuples})."""
    flats, conds = {}, {}
    for tier in TIERS:
        for e in s["bonuses"].get(tier, []):
            if e["effect"].startswith("weaknessto") or e["effect"] in FLAG_EFFECTS:
                continue
            k = sig(e)
            if "condition" in e:
                conds.setdefault(k, set()).add(tuple(sorted(cond_kinds(e["condition"]))))
            else:
                flats[k] = max(flats.get(k, 0), e["magnitude"])
    return flats, conds


def check_stacking(sets):
    base = load_base_sets()
    items = {s["name"]: {i.lower() for i in s["items"]} for s in base}
    thr = {s["name"]: s["thresholds"]["max"] for s in base}
    byname = {s["name"]: s for s in sets}
    problems, notes = [], []
    names = [s["name"] for s in sets if s["name"] in items]
    for i, a in enumerate(names):
        for b in names[i + 1:]:
            shared = len(items[a] & items[b])
            if shared < thr[a] or shared < thr[b]:
                continue  # can't co-max from shared items
            fa, ca = collect_effects(byname[a])
            fb, cb = collect_effects(byname[b])
            # R1: full-strength flat duplicated
            for k in set(fa) & set(fb):
                cap = ECHO.get(k[0], 0)
                if fa[k] > cap and fb[k] > cap:
                    problems.append(
                        f"R1 {a} + {b} (share {shared}): both carry full-strength "
                        f"always-on {k[0]}{'/' + str(k[1] or k[2]) if (k[1] or k[2]) else ''} "
                        f"({fa[k]} / {fb[k]}; echo cap {cap})")
            # R2: same conditional effect with same condition kind(s)
            for k in set(ca) & set(cb):
                overlap = ca[k] & cb[k]
                if overlap:
                    problems.append(
                        f"R2 {a} + {b} (share {shared}): both spike {k[0]}"
                        f"{'/' + str(k[1] or k[2]) if (k[1] or k[2]) else ''} "
                        f"on the same state {sorted(overlap)}")
            # informational: flat in one, conditional in the other
            for k in (set(fa) & set(cb)) | (set(fb) & set(ca)):
                notes.append(f"note {a} + {b}: {k[0]} is flat in one and conditional in the other")
    return problems, notes


# ------------------------------------------------------------ OpenMW output

def lua_str(v):
    return '"' + str(v).replace('"', '\\"') + '"'


def num(v):
    return str(int(v)) if float(v).is_integer() else str(v)


def cond_lua(c):
    if isinstance(c, list):
        return "{ " + ", ".join(cond_lua(x) for x in c) + " }"
    parts = []
    for key in ("kind", "op", "id", "value", "fraction", "any", "all"):
        if key not in c:
            continue
        v = c[key]
        if key in ("any", "all"):
            parts.append(f"{key} = {{ " + ", ".join(cond_lua(x) for x in v) + " }")
        elif isinstance(v, bool):
            parts.append(f"{key} = {str(v).lower()}")
        elif isinstance(v, (int, float)):
            parts.append(f"{key} = {num(v)}")
        elif isinstance(v, list):
            parts.append(f"{key} = {{ " + ", ".join(lua_str(x) for x in v) + " }")
        else:
            parts.append(f"{key} = {lua_str(v)}")
    return "{ " + ", ".join(parts) + " }"


def effect_openmw(e):
    parts = [f'effect = "{e["effect"].lower()}"']
    if "skill" in e:
        parts.append(f'skill = "{e["skill"].lower()}"')
    if "attribute" in e:
        parts.append(f'attribute = "{e["attribute"].lower()}"')
    parts.append(f'mag = {num(e["magnitude"])}')
    if e["effect"] in RESTORE:
        parts.append("dur = 1")
    if "condition" in e:
        parts.append(f'condition = {cond_lua(e["condition"])}')
    return "{ " + ", ".join(parts) + " }"


def emit_openmw(sets):
    out = [
        "-- Set Bonus -- Conditional Rebalance data for OpenMW.",
        "-- AUTO-GENERATED from MWSE/mods/Static/SetBonusRebalance/data.lua by",
        "-- gen_rebalance.py -- edit the MWSE file and regenerate; don't edit here.",
        "-- Effect ids are OpenMW MagicEffectId strings; conditions are identical",
        "-- on both engines (cross-engine kinds only).",
        "return {",
    ]
    for s in sets:
        out.append(f'  {{ name = "{s["name"]}",')
        out.append("    bonuses = {")
        for tier in TIERS:
            defs = s["bonuses"].get(tier)
            if not defs:
                continue
            out.append(f"      {tier} = {{")
            for e in defs:
                out.append(f"        {effect_openmw(e)},")
            out.append("      },")
        out.append("    },")
        out.append("  },")
    out.append("}")
    OUT_OPENMW.parent.mkdir(parents=True, exist_ok=True)
    OUT_OPENMW.write_text("\n".join(out) + "\n", encoding="utf-8")


# ------------------------------------------------------------- markdown doc

PRETTY = {
    "resistFire": "Resist Fire", "resistFrost": "Resist Frost",
    "resistShock": "Resist Shock", "resistMagicka": "Resist Magicka",
    "resistPoison": "Resist Poison", "resistCommonDisease": "Resist Common Disease",
    "resistBlightDisease": "Resist Blight Disease",
    "resistNormalWeapons": "Resist Normal Weapons",
    "resistParalysis": "Resist Paralysis",
    "weaknesstoFire": "Weakness to Fire", "weaknesstoFrost": "Weakness to Frost",
    "weaknesstoShock": "Weakness to Shock", "weaknesstoMagicka": "Weakness to Magicka",
    "weaknesstoNormalWeapons": "Weakness to Normal Weapons",
    "weaknesstoPoison": "Weakness to Poison",
    "fortifyHealth": "Fortify Health", "fortifyFatigue": "Fortify Fatigue",
    "fortifyMagicka": "Fortify Magicka", "fortifyAttack": "Fortify Attack",
    "restoreHealth": "Restore Health", "restoreMagicka": "Restore Magicka",
    "restoreFatigue": "Restore Fatigue", "spellAbsorption": "Spell Absorption",
    "reflect": "Reflect", "sanctuary": "Sanctuary", "chameleon": "Chameleon",
    "nightEye": "Night Eye", "swiftSwim": "Swift Swim",
    "waterBreathing": "Water Breathing", "waterWalking": "Water Walking",
    "slowFall": "Slow Fall", "feather": "Feather", "light": "Light",
    "turnUndead": "Turn Undead", "detectAnimal": "Detect Animal",
    "jump": "Jump", "levitate": "Levitate", "telekinesis": "Telekinesis",
}
UNIT = {"health": "HP", "magicka": "MP", "fatigue": "FP"}


def title_id(s):
    return re.sub(r"([a-z])([A-Z])", r"\1 \2", s).title()


def cond_text(c):
    if isinstance(c, list):
        return " and ".join(cond_text(x) for x in c)
    if "any" in c:
        return " or ".join(cond_text(x) for x in c["any"])
    if "all" in c:
        return " and ".join(cond_text(x) for x in c["all"])
    kind = c["kind"]
    if kind in ("health", "magicka", "fatigue"):
        v = c["value"]
        val = f"{int(round(v * 100))}%" if c.get("fraction") else num(v)
        return f"{UNIT[kind]} {c.get('op', '<')} {val}"
    if kind in ("attribute", "skill"):
        return f"{title_id(c['id'])} {c.get('op', '>=')} {num(c['value'])}"
    if kind == "level":
        return f"level {c.get('op', '>=')} {num(c['value'])}"
    if kind == "time":
        return "by day" if c["value"] == "day" else "at night"
    if kind == "sun":
        return "under the sun" if c["value"] == "up" else "out of the sun"
    if kind == "location":
        return "outdoors" if c["value"] == "exterior" else "indoors"
    if kind == "race":
        v = c["value"]
        return (" / ".join(v) if isinstance(v, list) else str(v)) + " only"
    if kind == "class":
        v = c["value"]
        return "class " + (" / ".join(v) if isinstance(v, list) else str(v))
    return "?"


def effect_text(e):
    eff = e["effect"]
    name = PRETTY.get(eff, eff)
    if eff == "fortifySkill":
        name = f"Fortify {title_id(e['skill'])}"
    elif eff == "fortifyAttribute":
        name = f"Fortify {title_id(e['attribute'])}"
    mag = num(e["magnitude"])
    unit = " /s" if eff in RESTORE else ""
    txt = f"{name} {mag}{unit}"
    if "condition" in e:
        txt += f" *({cond_text(e['condition'])})*"
    return txt


TR_NAMES = {
    "Alessian Bronze", "Alit Hide", "Altmer", "Ancient Nordic", "Anvil",
    "Argonian", "Ayleid", "Bal-Darum", "Breton", "Cataphract", "Chap-thil",
    "Chev-Aram", "Chuzei", "Colovian Leather", "Companions", "Crown Guard",
    "Daedric Hide", "Domina", "Dunmer", "Ebonweave", "Falkreath Guard",
    "Gah'Kogo", "Gilded Glass", "Gold", "Golden Saint", "Guar Hide",
    "House Direnni", "House Redoran", "Kagouti Hide", "Kalantar", "Klibanion",
    "Kragen", "Kvetchi", "Lamellar", "Mananaut", "Manatee Leather", "Maormer",
    "Maradlai", "Militia", "Molecrab", "Narsis Watch", "Navy", "Necrom Guard",
    "Nibenese", "Oloman", "Quey Chitin", "Reach", "Reach Royal Guard",
    "Red Dome Templar", "Redguard", "Redguard Iron Lamellar", "Reman",
    "Rihad Guard", "Riverwatch", "Rourken", "Sacred Lands", "Saliache",
    "Shellmold", "Shinathi Chitin", "Shipal-Arai", "Skingrad", "Sutch Mail",
    "Thirr", "Toadscale", "Watchman", "Wenbone", "Wormmouth",
}


def emit_markdown(sets, canon):
    tr_names = TR_NAMES
    lines = [
        "# Set Bonus — Conditional Rebalance Reference",
        "",
        "Complete spell reference for the optional **Conditional Rebalance** submodule",
        "(`SetBonusRebalance` on MWSE, `OpenMW_SetBonusRebalance` on OpenMW). Install it",
        "on top of Set Bonus 1.6+ to replace every set's bonuses with the balance below;",
        "remove it to return to the default balance. Item lists and piece thresholds are",
        "unchanged — only the effects differ.",
        "",
        "## Design",
        "",
        "The rebalance leans on the 1.6 conditional-effects framework. Each set keeps a",
        "small always-on identity (the restrained base-mod magnitude bands), and gains",
        "**situational spikes** — effects roughly 1.5–2× stronger than an always-on",
        "equivalent that apply only while a state holds. The moods follow the kind of set:",
        "heavy materials answer pain (*bloodied*, below 50% health; *last stand*, below",
        "25%), light materials favour darkness and open sky, cultural sets are strongest",
        "for their own race and homeland habits, faction sets mirror their trade, and the",
        "class sets (Light/Medium/Heavy Armor, Cloth) are purely reactive so they",
        "complement — rather than double — the material sets that share their items.",
        "Weakness drawbacks remain (a few are now conditional too) and still scale with",
        "the Weakness slider; benefits still scale with the Benefit slider.",
        "",
        "**Stacking lanes.** Items commonly belong to several sets at once — a Chuzei",
        "helm is also Bonemold, Dunmer, and Native; a bear pelt is also Nordic — so one",
        "outfit can hold max tier in three or four sets simultaneously. Rather than let",
        "that multiply the same stats, every co-activating cluster is split into",
        "**lanes**: the specific set keeps the full-strength identity (Bonemold tanks,",
        "Chuzei commands, Kragen trades, Her Hand heals) while broad umbrella sets",
        "(Dunmer, Native, Nordic, Colovian, Imperial, Orsimer, the class sets) carry",
        "only echo-strength flats (~10 resist) plus cultural conditionals. The build",
        "script enforces this: two sets that can reach max tier from shared items may",
        "not both carry the same full-strength always-on effect, nor spike the same",
        "effect on the same state. Wearing a themed outfit therefore layers",
        "*complementary* bonuses — tank + officer + kinship — instead of doubling them.",
        "",
        "Every condition used evaluates natively on **both engines** — thresholds on",
        "health/magicka/fatigue, attributes, skills, and level, time of day, sun,",
        "interior/exterior, and race, plus AND/OR combinations of these. No combat,",
        "weather, or flag conditions are used, so MWSE and OpenMW behave identically.",
        "",
        "Conditions at a glance: **bloodied** HP < 50% · **last stand** HP < 25% ·",
        "**unscathed** HP > 75% · **winded** FP < 50% · **fresh** FP > 75% ·",
        "**charged** MP > 50% · **drained** MP < 25% · **night/day** · **sun up/down**",
        "(up = daytime *and* outdoors) · **indoors/outdoors** · **race** ·",
        "**veteran/green** (level thresholds) · **mastery** (skill/attribute",
        "thresholds, e.g. Marksman ≥ 50) · combined states (**at night and indoors**,",
        "**under the open night sky**, **desperate** = last stand *or* winded,",
        "**in shade** = indoors *or* night).",
        "",
        "Tier thresholds stay at **2 / 4 / 6+** pieces (per-set overrides such as",
        "Mananaut's 2/3/5 are kept). \"/s\" = per-second Restore.",
        "",
        "---",
        "",
    ]

    def section(title, names):
        lines.append(f"## {title} ({len(names)})")
        lines.append("")
        for s in sets:
            if s["name"] not in names:
                continue
            lines.append(f"### {s['name']}")
            for tier in TIERS:
                defs = s["bonuses"].get(tier)
                if defs:
                    lines.append(f"- **{tier}:** " + ", ".join(effect_text(e) for e in defs))
            lines.append("")

    all_names = [s["name"] for s in sets]
    base_names = [n for n in all_names if n not in tr_names]
    section("Base mod sets", set(base_names))
    lines.append("---")
    lines.append("")
    section("Tamriel Rebuilt add-on sets", set(tr_names))
    lines.append("Sets from add-ons that are not installed are skipped automatically —")
    lines.append("the corresponding entries simply never apply.")
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")


# ------------------------------------------------- MWSE spell-id simulation
#
# MWSE builds spell record ids at runtime ("_sb_<displayName>_<tier>[_cN]") and
# the engine caps ids at 31 chars; interop.lua clamps over-long ids with a
# 4-char hash. This mirrors that logic at build time to prove no two sets can
# clamp onto the same id (hash collision) before anyone loads the game.

def _hash4(sid):
    h = 5381
    for ch in sid:
        h = (h * 33 + ord(ch)) % 1679616
    digits, out = "0123456789abcdefghijklmnopqrstuvwxyz", ""
    for _ in range(4):
        out = digits[h % 36] + out
        h //= 36
    return out


def check_spell_ids(sets):
    tr = (ROOT / "MWSE/mods/Static/SetBonusTR/main.lua").read_text(encoding="utf-8")
    disp = dict(re.findall(r'name = "([^"]+)",\s*\n\s*displayName = "([^"]+)"', tr))
    seen, clamped = {}, []
    for s in sets:
        prefix = "_sb_" + re.sub(r"[^0-9a-z]", "_", disp.get(s["name"], s["name"]).lower())
        for tier in TIERS:
            defs = s["bonuses"].get(tier, [])
            n_cond = sum(1 for e in defs if "condition" in e)
            for sid in [f"{prefix}_{tier}"] + [f"{prefix}_{tier}_c{j}" for j in range(1, n_cond + 1)]:
                cid = sid if len(sid) <= 31 else sid[:26] + "_" + _hash4(sid)
                if cid != sid:
                    clamped.append(sid)
                if cid in seen and seen[cid] != sid:
                    err(f"spell-id hash collision: '{cid}' from both '{sid}' and '{seen[cid]}'")
                seen[cid] = sid
    return len(seen), clamped


def main():
    verbose = "--notes" in sys.argv
    sets = load_sets()
    canon = canonical_names()
    validate(sets, canon)
    if errors:
        print(f"VALIDATION FAILED ({len(errors)} error(s)):")
        for e in errors:
            print("  -", e)
        sys.exit(1)
    n_ids, clamped = check_spell_ids(sets)
    if errors:
        print(f"SPELL-ID CHECK FAILED ({len(errors)} error(s)):")
        for e in errors:
            print("  -", e)
        sys.exit(1)
    problems, notes = check_stacking(sets)
    if problems:
        print(f"STACKING CHECK FAILED ({len(problems)} problem(s)):")
        for p in problems:
            print("  -", p)
        sys.exit(1)
    if verbose:
        for n in sorted(set(notes)):
            print("  ", n)
    emit_openmw(sets)
    emit_markdown(sets, canon)
    n_cond = sum(1 for s in sets for t in TIERS for e in s["bonuses"].get(t, []) if "condition" in e)
    no_cond = [s["name"] for s in sets
               if not any("condition" in e for t in TIERS for e in s["bonuses"].get(t, []))]
    kinds = {}
    for s in sets:
        for t in TIERS:
            for e in s["bonuses"].get(t, []):
                if "condition" in e:
                    for k in cond_kinds(e["condition"]):
                        kinds[k] = kinds.get(k, 0) + 1
    print(f"OK: {len(sets)} sets ({len(sets) - len(TR_NAMES)} base + {len(TR_NAMES)} TR), "
          f"{n_cond} conditional effects, stacking rules clean "
          f"({len(set(notes))} flat/conditional notes; --notes to list).")
    print(f"condition kinds: {dict(sorted(kinds.items(), key=lambda x: -x[1]))}")
    print(f"spell ids: {n_ids} simulated, all unique and <=31 chars"
          + (f" ({len(clamped)} clamped: {clamped})" if clamped else ""))
    if no_cond:
        print(f"sets without conditionals: {no_cond}")
    print(f"Wrote {OUT_OPENMW.relative_to(ROOT)} and {OUT_MD.relative_to(ROOT)}.")


if __name__ == "__main__":
    main()
