#!/usr/bin/env bash
# Regenerate the Power BI project (macOS / Linux). Requires Python 3.9+ (stdlib only, no deps).
set -euo pipefail
cd "$(dirname "$0")"
PY="${PYTHON:-python3}"
echo "Using: $($PY --version)"
$PY generate.py
$PY qa_check.py
echo "Done. Open WEC-CISTEM.pbip in Power BI Desktop (Windows)."
