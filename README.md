# WEC CISTEM — Power BI Prototype

A Power BI replica of the **WEC CISTEM** MS Access client form (12 tabs), built as a
**read-only** report with **synthetic stub data**. Designed to later swap onto a live **MSSQL**
backend. Generated programmatically from a single Python definition so it's easy to extend.

> **Note:** Power BI is a read-only analytics tool — fields here *display* data, they are not
> editable inputs. A true editable data-entry form (like the original Access app) would be a web
> app / Power App, not Power BI.

---

## Quick start (after `git clone`)

Works on **macOS** and **Windows**. The generated `WEC-CISTEM.pbip` / `.SemanticModel` / `.Report`
are **committed**, so opening works with **no build step** — you only run the generator when you
change the definition.

**A) Just view/edit the report** (no Python needed — recommended):
1. Install **Power BI Desktop** (Windows): Microsoft Store, or https://aka.ms/pbidesktopstore.
2. Power BI Desktop → **File → Options and settings → Options → Preview features** → enable
   **Power BI Project (.pbip) save option** and **Store reports using enhanced metadata format (PBIR)**
   → restart Power BI Desktop.
3. Open **`WEC-CISTEM.pbip`** → **Refresh** when prompted → pick a client in the selector.
   - Keep the clone at a **short path** (e.g. `C:\WEC`) — Windows has a 260-char path limit.
   - On a **Mac**, run Power BI Desktop in a Windows VM (Parallels/UTM) — it's Windows-only.

**B) Regenerate / extend the model** (needs **Python 3.9+**, standard library only — no `pip install`):
- macOS / Linux:  `./build.sh`
- Windows (PowerShell):  `./build.ps1`
- or directly:  `python3 generate.py && python3 qa_check.py`  (`python` on Windows)

`qa_check.py` must print **PASS** before you reopen — it catches bad field references.

---

## What's in here

```
WEC-CISTEM.pbip                 ← open this in Power BI Desktop
WEC-CISTEM.SemanticModel/       ← data model (TMDL): tables, relationships, measures, INLINE stub data
WEC-CISTEM.Report/              ← report (PBIR): 12 pages, zoned layout, theme bundled in StaticResources
WEC-CISTEM-theme.json           ← the theme (also baked into the report; this copy is for manual reuse)
generate.py                     ← generator: emits the .pbip from the definition below
model_def.py                    ← SINGLE SOURCE OF TRUTH: tables, columns, relationships, measures, pages
qa_check.py                     ← static validator (field refs, relationships, layout bounds)
schema/                         ← real schema extracted from the source Access DB (reference)
README.md
```

The original Access DB (`WEBC 22Aug2025.mdb`) is **not** included (it holds real client PII).
Its structure is already captured in `model_def.py` and `schema/SCHEMA.md`. The data shown in the
prototype is **synthetic** (8 sample clients), generated in code — no real client data.

---

## Open it (no Python needed)

1. Install **Power BI Desktop** (Windows). Microsoft Store or https://aka.ms/pbidesktopstore.
2. Enable two preview features — **File → Options and settings → Options → Preview features**:
   - ✅ Power BI Project (.pbip) save option
   - ✅ Store reports using enhanced metadata format (PBIR)
   Click OK and restart Power BI Desktop.
3. **Extract this zip to a SHORT path** (e.g. `C:\WEC`) — Windows has a 260-char path limit and the
   report has deep folders.
4. Open `C:\WEC\WEC-CISTEM.pbip` → if prompted, **Refresh** to load the inline data.
5. Pick a client in the selector on any page to see that client's data.

## Build on top / extend it (needs Python 3.9+)

The report is *generated* — don't hand-edit the `.Report`/`.SemanticModel` folders; edit the
definition and regenerate.

1. Install **Python 3.9+** (https://www.python.org/downloads/ — tick "Add to PATH").
2. Edit the definition:
   - **`model_def.py`** — add/change tables, columns (with types), relationships, measures, sample clients.
   - **`generate.py`** — `PAGE_SECTIONS` (fields per tab), `PAGE_ZONE_GROUPS` (zones + columns per page),
     `HEADER` (slim header band), and `_theme()` (colors/fonts).
3. Regenerate + validate:
   ```
   python generate.py        # rewrites WEC-CISTEM.pbip / .SemanticModel / .Report / theme
   python qa_check.py         # validates every field/measure/relationship ref + layout — expect "PASS"
   ```
4. Reopen `WEC-CISTEM.pbip` in Power BI Desktop (restart Desktop to pick up external changes).

## Connect to MSSQL later (replace the stub data)

Each table's data currently lives in an **inline** Power Query partition (`#table(...)`) inside its
`WEC-CISTEM.SemanticModel/definition/tables/<Table>.tmdl`. To go live:
- Replace the inline `let Source = #table(...)` with `Sql.Database("<server>", "<db>")` + navigation
  to the real table (the live source names are in `schema/SCHEMA.md`, e.g. `Clients_remote`,
  `Loans_remote`, `dbo_ClientPhones`). Set Import or DirectQuery as needed.
- Or do it in Power BI Desktop via **Transform data** → change each query's source.

## Conventions / gotchas
- **Read-only**: no data entry; the client selector filters, it doesn't write back.
- Keep the project at a **short path** on Windows (260-char limit).
- The model/report formats are versioned (PBIP/PBIR, currently in preview) — keep Power BI Desktop updated.
- `qa_check.py` should always report **PASS** before you reopen — it catches bad field references that
  would otherwise show blank visuals or block opening.
