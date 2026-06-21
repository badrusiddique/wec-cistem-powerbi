# -*- coding: utf-8 -*-
"""Senior-QA static validation of the generated PBIP: model integrity, field refs,
relationships, measures, visual layout. Catches anything that would error or render blank."""
import json, glob, re, os
import model_def as M

ROOT = os.path.dirname(os.path.abspath(__file__))
RP = os.path.join(ROOT, "WEC-CISTEM.Report", "definition")
issues, warns, info = [], [], []

# --- column / measure index ---
cols = {t: {c[0] for c in M.TABLES[t]['columns']} for t in M.TABLES}
cols['Clients'].add('FullName')
measure_names = {m[0] for m in M.MEASURES}
cols['_Measures'] = set(measure_names) | {'_dummy'}
entities = set(cols) | {'_Measures'}

# --- 1. relationships ---
seen_rel = set()
for (ft, fc, tt, tc) in M.RELATIONSHIPS:
    for (tb, cl) in ((ft, fc), (tt, tc)):
        if tb not in M.TABLES: issues.append(f"REL: table '{tb}' missing")
        elif cl not in cols[tb]: issues.append(f"REL: column '{tb}.{cl}' missing")
    # type match
    def typ(tb, cl):
        for c in M.TABLES.get(tb, {}).get('columns', []):
            if c[0] == cl: return c[1][0]
        return None
    if typ(ft, fc) and typ(tt, tc) and typ(ft, fc) != typ(tt, tc):
        warns.append(f"REL type mismatch {ft}.{fc}({typ(ft,fc)}) vs {tt}.{tc}({typ(tt,tc)})")
    key = (ft, fc, tt, tc)
    if key in seen_rel: issues.append(f"REL duplicate {key}")
    seen_rel.add(key)
# every child table (with fk) has a relationship
for t, info_t in M.TABLES.items():
    fk = info_t.get('fk')
    if fk and not any(r[0] == t and r[1] == fk[0] for r in M.RELATIONSHIPS):
        warns.append(f"table '{t}' has fk {fk} but no relationship")

# --- 2. measures reference valid table[col] ---
for mname, expr, fmt in M.MEASURES:
    for tb, cl in re.findall(r"(\w+)\[([^\]]+)\]", expr):
        if tb not in cols: issues.append(f"MEASURE '{mname}': table '{tb}' missing")
        elif cl not in cols[tb]: issues.append(f"MEASURE '{mname}': col '{tb}.{cl}' missing")
    for fn, tb in re.findall(r"(COUNTROWS|DISTINCTCOUNT)\((\w+)", expr):
        if tb not in cols and not re.search(rf"{tb}\[", expr):
            issues.append(f"MEASURE '{mname}': table '{tb}' missing")

# --- 3. walk visuals: validate every field ref + positions ---
CW, CH = 1280, 980
page_dirs = sorted(glob.glob(os.path.join(RP, "pages", "*", "")))
total_vis = 0
per_page = {}
for pd in page_dirs:
    pid = os.path.basename(os.path.dirname(pd))
    if pid == "pages.json": continue
    try:
        ph = json.load(open(os.path.join(pd, "page.json"))).get("height", CH)
    except Exception:
        ph = CH
    vis = glob.glob(os.path.join(pd, "visuals", "*", "visual.json"))
    kinds = {}
    for vf in vis:
        total_vis += 1
        v = json.load(open(vf))
        vt = v['visual']['visualType']; kinds[vt] = kinds.get(vt, 0) + 1
        pos = v['position']
        if pos['x'] < 0 or pos['y'] < 0 or pos['x'] + pos['width'] > CW + 1 or pos['y'] + pos['height'] > ph + 1:
            warns.append(f"{pid}/{vt}: out of canvas bounds {pos}")
        qs = v['visual'].get('query', {}).get('queryState', {})
        for sect in qs.values():
            for p in sect.get('projections', []):
                fld = p['field']
                if 'Column' in fld:
                    e = fld['Column']['Expression']['SourceRef']['Entity']; prop = fld['Column']['Property']
                    if e not in cols: issues.append(f"{pid}/{vt}: entity '{e}' missing")
                    elif prop not in cols[e]: issues.append(f"{pid}/{vt}: field '{e}.{prop}' missing")
                elif 'Measure' in fld:
                    e = fld['Measure']['Expression']['SourceRef']['Entity']; prop = fld['Measure']['Property']
                    if prop not in measure_names: issues.append(f"{pid}/{vt}: measure '{prop}' missing")
    per_page[pid] = kinds

# --- 4. coverage / orphan tables (informational) ---
used = set()
for vf in glob.glob(os.path.join(RP, "pages", "*", "visuals", "*", "visual.json")):
    v = json.load(open(vf)); qs = v['visual'].get('query', {}).get('queryState', {})
    for sect in qs.values():
        for p in sect.get('projections', []):
            f = p['field']
            for k in ('Column', 'Measure'):
                if k in f: used.add(f[k]['Expression']['SourceRef']['Entity'])
for t in M.TABLES:
    if t not in used: info.append(f"table '{t}' not shown on any page")

# --- report ---
print("="*64)
print(f"PAGES: {len(per_page)}   VISUALS: {total_vis}   TABLES: {len(M.TABLES)}   RELS: {len(M.RELATIONSHIPS)}   MEASURES: {len(M.MEASURES)}")
print("="*64)
for pid in [p[0] for p in __import__('generate').PAGES]:
    k = per_page.get(pid, {})
    print(f"  {pid:18} " + ", ".join(f"{n}×{c}" for n, c in sorted(k.items())))
print("="*64)
print(f"BLOCKING ISSUES: {len(issues)}")
for x in issues: print("  ✗", x)
print(f"WARNINGS: {len(warns)}")
for x in warns: print("  ⚠", x)
print(f"INFO: {len(info)}")
for x in info: print("  •", x)
print("="*64)
print("RESULT:", "FAIL — fix blocking issues" if issues else "PASS — no blocking issues")
