#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE_DIR="$ROOT/templates"
DB_DIR="$ROOT/db"

SOURCE_NAME="${1:-}"

if [[ -z "$SOURCE_NAME" ]]; then
  echo "Usage: ./.taskflow/scripts/new-db-source.sh analytics" >&2
  exit 1
fi

SOURCE_DIR="$DB_DIR/$SOURCE_NAME"

if [[ -e "$SOURCE_DIR" ]]; then
  echo "DB source already exists: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$SOURCE_DIR"

sed "s/{{SOURCE_NAME}}/$SOURCE_NAME/g" "$TEMPLATE_DIR/db-source.md" > "$SOURCE_DIR/01-profile.md"
cat > "$SOURCE_DIR/02-schema-notes.md" <<'EOF'
# Schema Notes

## Schemas

- schema:

## Core Tables Or Views

- table or view:
- purpose:

## Keys And Joins

- primary keys:
- foreign keys:
- common joins:

## Sensitive Fields

- pii:
- financial:
- secrets or tokens:

## Query Boundaries

- default filters:
- time windows:
- row-count cautions:

## Useful Paths

- migrations:
- ORM schema:
- dashboards:
- data dictionary:
EOF
cat > "$SOURCE_DIR/03-safe-queries.sql" <<'EOF'
-- Place approved read-only queries here.
-- Keep destructive statements out of this file.
-- For each query, include:
--   - purpose
--   - expected parameters
--   - required filters or limits
--   - risk notes for large scans or sensitive data

-- Example:
-- purpose: daily active users for the last 7 days
-- params: :start_date, :end_date
-- boundaries: grouped by day, no raw user export
-- risk: full scan if event_date index is missing
EOF
sed "s/{{SOURCE_NAME}}/$SOURCE_NAME/g" "$TEMPLATE_DIR/db-work-request.md" > "$SOURCE_DIR/04-work-request.md"

echo "Created $SOURCE_DIR"
