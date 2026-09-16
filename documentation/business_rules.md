# Business rules

- Active account balances are inflows in the liquidity explanation.
- Transactions marked `OUTFLOW` are aggregated as liquidity outflows.
- Liquidity gap equals inflows minus outflows; non-negative values are `SURPLUS`.
- Customer ID is mandatory and account balances should not be negative.
- Lineage metadata is maintained at column level; impact analysis traverses every downstream edge.
