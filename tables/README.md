# Tables

This directory stores reusable table fragments that are included from chapter files with `\input{tables/...}`.

Use ordinary `table` environments for standard tables. For dense experiment result tables, call `\nbucompacttable` immediately before the `tabular`, `tabularx`, or `longtable` environment and add a source comment explaining why the compact exception is needed.
