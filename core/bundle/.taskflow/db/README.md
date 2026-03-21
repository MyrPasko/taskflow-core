# DB Intake

This is the lightweight DB interaction layer.

It is intentionally modest:

- store connection metadata without secrets
- capture schema notes
- keep approved safe queries
- create DB-specific work requests before involving an executor

## Folder Shape

Each source gets:

- `01-profile.md`
- `02-schema-notes.md`
- `03-safe-queries.sql`
- `04-work-request.md`

## Secret Handling

Never place secrets in this directory.

Reference env var names only.
