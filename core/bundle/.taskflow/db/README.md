# DB Intake

This is the lightweight DB interaction layer.

It is intentionally modest:

- store connection metadata without secrets
- capture schema notes
- keep approved safe queries
- create DB-specific work requests before involving an executor
- keep safety boundaries explicit without adding a runtime integration layer

It is intentionally not:

- a secret store
- an always-on DB runtime
- an integration framework
- a replacement for migrations or database admin tooling

## Folder Shape

Each source gets:

- `01-profile.md`
- `02-schema-notes.md`
- `03-safe-queries.sql`
- `04-work-request.md`

Use the files like this:

- `01-profile.md`: connection metadata, ownership, and safety model
- `02-schema-notes.md`: schemas, keys, sensitive fields, and useful code paths
- `03-safe-queries.sql`: approved read-only query shapes with comments
- `04-work-request.md`: the exact DB task to execute against the approved source files

## Safety Model

- default to read-only exploration
- require explicit approval before any write path
- keep destructive statements out of `03-safe-queries.sql`
- record data sensitivity and query-cost concerns before execution
- prefer bounded queries over open-ended scans

## Secret Handling

Never place secrets in this directory.

Reference env var names only.
