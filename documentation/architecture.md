# Architecture

Source banking files land in staging, are promoted into constrained core Customer, Account, Loan, Deposit and Bank Transaction tables, then feed PL/SQL liquidity reporting. Metadata tables describe objects, columns and transformations. The lineage and impact procedures make the reporting path auditable.

`ACCOUNT.CURRENT_BALANCE → LIQUIDITY_REPORT.INFLOW_AMOUNT → LIQUIDITY_REPORT.LIQUIDITY_GAP → 30_DAY_LIQUIDITY_GAP`
