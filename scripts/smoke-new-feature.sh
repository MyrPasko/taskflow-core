#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d /tmp/taskflow-new-feature-smoke-XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

"$ROOT/scripts/install-mode.sh" delegate "$TMP_DIR/project" >/dev/null

(
  cd "$TMP_DIR/project"
  ./.taskflow/scripts/new-feature.sh FEATURE-001 pacman >/dev/null
)

FEATURE_DIR="$TMP_DIR/project/.taskflow/features/FEATURE-001-pacman"

required_files=(
  "00-request.md"
  "01-breakdown.md"
  "status.txt"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$FEATURE_DIR/$file" ]]; then
    echo "Missing scaffolded feature file: $file" >&2
    exit 1
  fi
done

if [[ "$(cat "$FEATURE_DIR/status.txt")" != "draft" ]]; then
  echo "Unexpected initial feature status." >&2
  exit 1
fi

echo "New feature smoke check: OK"
