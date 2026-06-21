# Regenerate the Power BI project (Windows). Requires Python 3.9+ (stdlib only, no deps).
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot
$py = (Get-Command python -ErrorAction SilentlyContinue) ?? (Get-Command py -ErrorAction SilentlyContinue)
if (-not $py) { Write-Error "Python 3.9+ not found. Install from https://www.python.org/downloads/ (tick 'Add to PATH')."; exit 1 }
& $py.Source --version
& $py.Source generate.py
& $py.Source qa_check.py
Write-Host "Done. Open WEC-CISTEM.pbip in Power BI Desktop."
