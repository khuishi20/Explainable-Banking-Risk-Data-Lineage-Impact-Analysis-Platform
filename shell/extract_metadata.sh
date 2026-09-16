#!/usr/bin/env bash
set -euo pipefail
: "${DB_CONNECT:?Set DB_CONNECT, e.g. user/password@service}"
sqlplus -s "$DB_CONNECT" <<'SQL'
SET LINESIZE 200
SELECT owner,object_name,object_type FROM all_objects WHERE owner=USER ORDER BY object_type,object_name;
SELECT owner,table_name,column_name,data_type FROM all_tab_columns WHERE owner=USER ORDER BY table_name,column_id;
EXIT
SQL
