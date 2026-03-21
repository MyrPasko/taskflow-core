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

## Tables

- table:

## Keys

- primary:
- foreign:

## Useful Paths

- migrations:
- ORM schema:
- dashboards:
EOF
cat > "$SOURCE_DIR/03-safe-queries.sql" <<'EOF'
-- Place approved read-only queries here.
-- Keep destructive statements out of this file.
EOF
sed "s/{{SOURCE_NAME}}/$SOURCE_NAME/g" "$TEMPLATE_DIR/db-work-request.md" > "$SOURCE_DIR/04-work-request.md"

echo "Created $SOURCE_DIR"
