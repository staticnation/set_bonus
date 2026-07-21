#!/usr/bin/env python3
"""
Rule-based armour -> set roster classifier.

Onboarding a new armour mod should be: dump its armour with tes3conv into
armor/<mod>_armor_output.txt, add a rule or two below, re-run. No hand-listing
hundreds of item ids, and one source of truth so MWSE and OpenMW can't drift.

    python gen_rosters.py            # classify + write generated roster data
    python gen_rosters.py --report   # show coverage + UNMATCHED items (rule-writing aid)
    python gen_rosters.py --set Bonemold   # show what a single set would receive

Rules are (pattern, [set names]) matched case-insensitively against the item id
AND its display name. ALL matching rules apply -- an item legitimately belongs to
several sets (an Indoril cuirass is House Indoril + Tribunal Temple + Dunmer),
which is exactly how the framework works. Weight-class sets are added
automatically from the engine's own (Light/Medium/Heavy) tag.
"""
import re
import sys
import json
from pathlib import Path
from collections import defaultdict

ROOT = Path(__file__).resolve().parent
ARMOR_DIR = ROOT / "armor"
OUT_LUA = ROOT / "armor_rosters_generated.lua"
OUT_JSON = ROOT / "armor_rosters_generated.json"

WEIGHT_SET = {"light": "Light Armor", "medium": "Medium Armor", "heavy": "Heavy Armor"}

# ---------------------------------------------------------------- rules
# Order doesn't matter (all matches accumulate). Keep patterns tight enough not
# to catch unrelated mods' ids -- run --report after adding one to sanity-check.
RULES = [
    # --- vanilla materials -------------------------------------------------
    (r"\biron\b",                       ["Iron"]),
    (r"\bsteel\b",                      ["Steel"]),
    (r"\bebony\b",                      ["Ebony"]),
    (r"daedric",                        ["Daedric"]),
    (r"dwemer|dwarven",                 ["Dwemer"]),
    (r"adamantium",                     ["Adamantium"]),
    (r"orcish",                         ["Orcish"]),
    (r"\bbronze\b",                     ["Bronze"]),
    (r"\bsilver\b",                     ["Silver"]),
    (r"stalhrim|\bice\b",               ["Stalhrim"]),
    (r"\bglass\b",                      ["Glass"]),
    (r"\bchitin\b",                     ["Chitin"]),
    (r"bonemold",                       ["Bonemold"]),
    (r"netch",                          ["Netch Leather"]),
    (r"\bleather\b",                    ["Leather"]),
    (r"\bfur\b",                        ["Fur"]),
    (r"\bbear\b",                       ["Bear Fur"]),
    (r"\bwolf\b",                       ["Wolf Fur"]),
    (r"trollbone",                      ["Trollbone"]),
    (r"\bdreugh\b",                     ["Dreugh"]),
    (r"chain[ _]?mail",                 ["Chain Mail"]),
    (r"ring[ _]?mail",                  ["Ring Mail"]),
    (r"scale[ _]?mail",                 ["Scale Mail"]),
    (r"\bplate\b",                      ["Plate"]),
    (r"\bsplint\b",                     ["Splint"]),
    (r"\bhide\b",                       ["Hide"]),
    (r"\bpadded\b",                     ["Padded"]),
    (r"\bstudded\b",                    ["Studded"]),
    (r"cephalopod",                     ["Cephalopod"]),
    (r"\bgoblin\b",                     ["Goblin"]),
    # --- cultural / faction ------------------------------------------------
    (r"indoril",                        ["House Indoril", "Tribunal Temple", "Dunmer"]),
    (r"almalexia",                      ["Her Hand", "Dunmer"]),
    (r"ordinator",                      ["Tribunal Temple", "Dunmer"]),
    (r"telvanni",                       ["House Telvanni", "Dunmer"]),
    (r"redoran",                        ["House Redoran", "Dunmer"]),
    (r"hlaalu",                         ["House Hlaalu", "Dunmer"]),
    (r"\bdres\b",                       ["House Dres", "Dunmer"]),
    (r"nordic|\bnord\b",                ["Nordic"]),
    (r"imperial",                       ["Imperial"]),
    (r"colovian",                       ["Colovian"]),
    (r"orsimer|\borc\b",                ["Orsimer"]),
    (r"ashlander|\bnative\b",           ["Native"]),
    (r"\bfalmer\b|betrayed",            ["Falmer"]),
    (r"snow[ _]?prince",                ["Snow Prince"]),
    (r"morag[ _]?tong",                 ["Morag Tong"]),
    (r"dark[ _]?brotherhood",           ["Dark Brotherhood"]),
    (r"thieve?s?[ _]?guild",            ["Thieves Guild"]),
    (r"fighters[ _]?guild",             ["Fighters Guild"]),
    (r"mages[ _]?guild",                ["Mages Guild"]),
    (r"templar",                        ["Templar"]),
    (r"royal[ _]?guard",                ["Royal Guard"]),
    (r"\bguard\b",                      ["Guard"]),
    # --- Tamriel Rebuilt families -----------------------------------------
    # TR ids are regular (T_<culture>_<family>_...), so a family word is usually
    # enough. Added by reading `--report` output; extend the same way per mod.
    (r"saliache",                       ["Saliache"]),
    (r"\bayleid\b",                     ["Ayleid"]),
    (r"\bhist\b|argonian",              ["Argonian"]),
    (r"\baltmer\b",                     ["Altmer"]),
    (r"\bbreton\b",                     ["Breton"]),
    (r"maormer",                        ["Maormer"]),
    (r"redguard",                       ["Redguard"]),
    (r"lamellar",                       ["Lamellar"]),
    (r"cataphract",                     ["Cataphract"]),
    (r"klibanion",                      ["Klibanion"]),
    (r"chuzei",                         ["Chuzei"]),
    (r"gah[- _]?julan",                 ["Gah-Julan"]),
    (r"armun[- _]?an",                  ["Armun-An"]),
    (r"chap[- _]?thil",                 ["Chap-thil"]),
    (r"molecrab",                       ["Molecrab"]),
    (r"quey",                           ["Quey Chitin"]),
    (r"shellmold",                      ["Shellmold"]),
    (r"wormmouth",                      ["Wormmouth"]),
    (r"kragen",                         ["Kragen"]),
    (r"kvetchi",                        ["Kvetchi"]),
    (r"nibenese",                       ["Nibenese"]),
    (r"\breman\b",                      ["Reman"]),
    (r"skingrad",                       ["Skingrad"]),
    (r"\banvil\b",                      ["Anvil"]),
    (r"\bnavy\b",                       ["Navy"]),
    (r"militia",                        ["Militia"]),
    (r"companions",                     ["Companions"]),
    (r"golden[ _]?saint",               ["Golden Saint"]),
    (r"guar[ _]?hide",                  ["Guar Hide"]),
    (r"alit[ _]?hide",                  ["Alit Hide"]),
    (r"kagouti",                        ["Kagouti Hide"]),
]

# --------------------------------------------------------------- emission
# Which dump belongs to which distribution. Base-game items live in the MWSE
# base set files; add-on items go in that add-on's managed block. OpenMW's
# data.lua carries the combined roster.
SOURCES = {
    "base": ["morrowind_armor_output.txt", "tribunal_armor_output.txt", "bloodmoon_armor_output.txt"],
    "TR":   ["TR_armor_output.txt", "tr_data_armor_output.txt"],
    "OAAB": ["oaab_armor_output.txt"],
    "NOD":  ["nod_armor_output.txt"],
    "AATL": ["aatl_armor_output.txt"],
}
ADDONS = [("SetBonusTR", "registerTRSets", "TR"),
          ("SetBonusOAAB", "registerOAAB", "OAAB"),
          ("SetBonusNOD", "registerNOD", "NOD"),
          ("SetBonusAATL", "registerAATL", "AATL")]
MWSE_SETS_DIR = ROOT / "MWSE/mods/Static/ArmorBonus/sets"
OPENMW_DATA = ROOT / "OpenMW_SetBonus/scripts/SetBonus/data.lua"
MARK_START = "    -- >>> SETBONUS ROSTERS (auto-generated by gen_rosters.py) >>>"
MARK_END = "    -- <<< SETBONUS ROSTERS <<<"
# gen_class_sets.py owns these -- don't fight over them.
OWNED_ELSEWHERE = {"Heavy Armor", "Medium Armor", "Light Armor"}

REC_ID = re.compile(r"NAME:\s*ID:(.+)")
REC_NAME = re.compile(r"FNAM:\s*Name:(.+)")
REC_AODT = re.compile(r"AODT:\s*Type:\(([^)]*)\).*?Weight:[\d.]+\s*\(([A-Za-z]+)\)")


def parse_dump(path):
    """Yield {id, name, slot, weight} per armour record."""
    cur = None
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = REC_ID.search(line)
        if m:
            if cur and cur.get("id"):
                yield cur
            cur = {"id": m.group(1).strip(), "name": "", "slot": "", "weight": ""}
            continue
        if cur is None:
            continue
        m = REC_NAME.search(line)
        if m:
            cur["name"] = m.group(1).strip()
            continue
        m = REC_AODT.search(line)
        if m:
            cur["slot"], cur["weight"] = m.group(1).strip(), m.group(2).strip().lower()
    if cur and cur.get("id"):
        yield cur


def classify(items):
    """-> rosters {set name: {item id: source}}, plus weight-class-only items."""
    rosters = defaultdict(dict)
    unmatched = []
    compiled = [(re.compile(p, re.I), sets) for p, sets in RULES]
    for it in items:
        hay = f"{it['id']} {it['name']}"
        hits = set()
        for rx, sets in compiled:
            if rx.search(hay):
                hits.update(sets)
        # Items that only ever hit the weight-class fallback have no identity
        # rule yet -- those are what you want to see when onboarding a new mod.
        if not hits:
            unmatched.append(it)
        # weight-class set comes straight from the engine's own tag
        wset = WEIGHT_SET.get(it["weight"])
        if wset:
            hits.add(wset)
        for s in hits:
            rosters[s].setdefault(it["id"], it.get("src", "base"))
    return rosters, unmatched


def _read(p):
    return p.read_text(encoding="utf-8", errors="replace").replace("\x00", "")


def _lua_items(ids, indent, per=4):
    if not ids:
        return indent + "-- (none)"
    rows = []
    for i in range(0, len(ids), per):
        rows.append(indent + ", ".join('"%s"' % x for x in ids[i:i + per]) + ",")
    return "\n".join(rows)


def _items_in(block):
    """Item ids inside an `items = { ... }` block (no nested braces)."""
    m = re.search(r"items\s*=\s*\{([^{}]*)\}", block, re.S)
    return [x.lower() for x in re.findall(r'"([^"]+)"', m.group(1))] if m else []


def mwse_set_files():
    """Map set name -> MWSE base set file path."""
    out = {}
    for p in sorted(MWSE_SETS_DIR.glob("*.lua")):
        m = re.search(r'name\s*=\s*"([^"]+)"', _read(p))
        if m:
            out[m.group(1)] = p
    return out


def openmw_roster():
    """Map set name -> current item ids in the OpenMW combined data.lua."""
    s = _read(OPENMW_DATA)
    out = {}
    for m in re.finditer(r'name\s*=\s*"([^"]+)"', s):
        out[m.group(1)] = _items_in(s[m.end():m.end() + 20000])
    return out


def plan(rosters):
    """Work out per-target ADDITIONS only (never removals)."""
    files, omw = mwse_set_files(), openmw_roster()
    adds = {"mwse": defaultdict(list), "openmw": defaultdict(list),
            "addon": {a: defaultdict(list) for _, _, a in ADDONS}}
    for name, items in sorted(rosters.items()):
        if name in OWNED_ELSEWHERE:
            continue
        have_omw = set(omw.get(name, []))
        have_base = set(_items_in(_read(files[name]))) if name in files else set()
        for iid, src in sorted(items.items()):
            if iid not in have_omw:
                adds["openmw"][name].append(iid)
            if src == "base":
                if name in files and iid not in have_base:
                    adds["mwse"][name].append(iid)
            else:
                adds["addon"][src][name].append(iid)
    return adds, files, omw


def do_diff(rosters):
    adds, files, omw = plan(rosters)
    known = set(omw)
    unknown = [n for n in rosters if n not in known and n not in OWNED_ELSEWHERE]
    print("ADDITIVE plan (nothing is ever removed):\n")
    print(f"  OpenMW data.lua : {sum(len(v) for v in adds['openmw'].values())} new items "
          f"across {len(adds['openmw'])} sets")
    print(f"  MWSE base sets  : {sum(len(v) for v in adds['mwse'].values())} new items "
          f"across {len(adds['mwse'])} sets")
    for _, _, a in ADDONS:
        n = sum(len(v) for v in adds["addon"][a].values())
        print(f"  {a:15} : {n} items across {len(adds['addon'][a])} sets")
    print("\nbiggest additions (OpenMW):")
    for n, v in sorted(adds["openmw"].items(), key=lambda x: -len(x[1]))[:15]:
        print(f"  {n:26} +{len(v)}")
    if unknown:
        print(f"\nNOTE: {len(unknown)} classified set name(s) are not registered anywhere "
              f"-- they'd be skipped: {', '.join(sorted(unknown)[:8])}")
    print("\nrun with --write to apply")


def do_write(rosters):
    adds, files, omw = plan(rosters)
    touched = 0

    # 1. MWSE base set files (union existing + new base items)
    for name, new in adds["mwse"].items():
        p = files[name]
        s = _read(p)
        merged = list(dict.fromkeys(_items_in(s) + new))
        block = "items = {\n" + _lua_items(merged, "\t\t") + "\n\t}"
        p.write_text(re.sub(r"items\s*=\s*\{[^{}]*\}", block, s, count=1), encoding="utf-8")
        touched += 1

    # 2. add-on managed blocks (fully regenerated -- they're auto-generated)
    for folder, funcname, src in ADDONS:
        per_set = adds["addon"][src]
        lines = [MARK_START]
        for name in sorted(per_set):
            if not per_set[name]:
                continue
            lines += ['    if setBonus.getSet("%s") then' % name,
                      '        setBonus.addItems("%s", {' % name,
                      _lua_items(sorted(per_set[name]), "            "),
                      "        })", "    end"]
        lines.append(MARK_END)
        block = "\n".join(lines)
        p = ROOT / "MWSE/mods/Static" / folder / "main.lua"
        if not p.exists():
            continue
        s = _read(p)
        if MARK_START in s:
            s = re.sub(re.escape(MARK_START) + r".*?" + re.escape(MARK_END), block, s, flags=re.S)
        else:
            anchor = "\nend\n\nevent.register(tes3.event.initialized, %s" % funcname
            if anchor not in s:
                print(f"  ! no anchor in {folder}/main.lua -- skipped")
                continue
            s = s.replace(anchor, "\n" + block + anchor, 1)
        p.write_text(s, encoding="utf-8")
        touched += 1

    # 3. OpenMW combined data.lua (union existing + all new)
    s = _read(OPENMW_DATA)
    for name, new in adds["openmw"].items():
        m = re.search(r'name\s*=\s*"' + re.escape(name) + r'"', s)
        if not m:
            continue
        seg = s[m.end():]
        merged = list(dict.fromkeys(_items_in(seg) + new))
        block = "items = {\n" + _lua_items(merged, "      ") + "\n    }"
        s = s[:m.end()] + re.sub(r"items\s*=\s*\{[^{}]*\}", block, seg, count=1)
    OPENMW_DATA.write_text(s, encoding="utf-8")
    touched += 1

    print(f"wrote {touched} file(s). Re-run gen_rebalance.py to re-validate.")


def main():
    args = sys.argv[1:]
    dumps = sorted(ARMOR_DIR.glob("*_armor_output.txt"))
    if not dumps:
        sys.exit(f"no armour dumps found in {ARMOR_DIR}")

    src_of = {f: s for s, files in SOURCES.items() for f in files}
    items, per_source = [], {}
    for d in dumps:
        got = list(parse_dump(d))
        src = src_of.get(d.name, "base")
        for g in got:
            g["src"] = src
        per_source[d.name] = len(got)
        items.extend(got)

    rosters, unmatched = classify(items)

    if "--diff" in args:
        return do_diff(rosters)
    if "--write" in args:
        return do_write(rosters)

    if "--set" in args:
        name = args[args.index("--set") + 1]
        got = sorted(rosters.get(name, []))
        print(f"{name}: {len(got)} items")
        for i in got:
            print("   ", i)
        return

    if "--report" in args:
        print("sources:")
        for k, v in per_source.items():
            print(f"  {k:34} {v:5} records")
        print(f"\ntotal {len(items)} records | identity rule matched "
              f"{len(items) - len(unmatched)} | weight-class only {len(unmatched)}\n")
        print("rosters (top 25 by size):")
        for s, v in sorted(rosters.items(), key=lambda x: -len(x[1]))[:25]:
            print(f"  {s:24} {len(v):5}")
        print(f"\nWEIGHT-CLASS ONLY ({len(unmatched)}) -- no identity rule yet, add rules for these:")
        for it in unmatched[:40]:
            print(f"  {it['id']:44} {it['name'][:34]:36} {it['weight']}")
        if len(unmatched) > 40:
            print(f"  ... and {len(unmatched) - 40} more")
        return

    out = {s: sorted(v) for s, v in sorted(rosters.items())}
    OUT_JSON.write_text(json.dumps(out, indent=1), encoding="utf-8")
    lines = ["-- GENERATED by gen_rosters.py -- do not hand-edit.",
             "-- Set name -> item ids, classified from armor/*_armor_output.txt.",
             "return {"]
    for s, v in out.items():
        lines.append(f'  ["{s}"] = {{')
        for i in range(0, len(v), 4):
            lines.append("    " + ", ".join(f'"{x}"' for x in v[i:i + 4]) + ",")
        lines.append("  },")
    lines.append("}")
    OUT_LUA.write_text("\n".join(lines), encoding="utf-8")
    print(f"{len(items)} records -> {len(out)} sets "
          f"({len(items) - len(unmatched)} matched, {len(unmatched)} unmatched)")
    print(f"wrote {OUT_LUA.name} and {OUT_JSON.name}  (--report to tune rules)")


if __name__ == "__main__":
    main()
