#!/usr/bin/env bash
set -euo pipefail
: "${DB_CONNECT:?Set DB_CONNECT, e.g. user/password@service}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; LOG_DIR="$ROOT/logs"; mkdir -p "$LOG_DIR"; LOG_FILE="$LOG_DIR/batch_$(date +%Y%m%d).log"
if [ ! -f "$ROOT/input/account.csv" ]; then echo "Account file missing: $ROOT/input/account.csv" | tee -a "$LOG_FILE"; exit 1; fi
{ echo '================================='; echo 'Banking Lineage Batch Started'; date; sqlplus -s "$DB_CONNECT" <<'SQL'
SET SERVEROUTPUT ON
EXEC generate_liquidity_report;
EXEC run_data_quality;
EXIT
SQL
echo 'Database processing successful'; date; echo '================================='; } | tee -a "$LOG_FILE"
