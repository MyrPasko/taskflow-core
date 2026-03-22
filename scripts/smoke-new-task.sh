#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d /tmp/taskflow-new-task-smoke-XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

"$ROOT/scripts/install-mode.sh" precision "$TMP_DIR/project" >/dev/null

(
  cd "$TMP_DIR/project"
  ./.taskflow/scripts/new-task.sh TASK-001 smoke >/dev/null
)

TASK_DIR="$TMP_DIR/project/.taskflow/tasks/TASK-001-smoke"

required_files=(
  "00-request.md"
  "01-plan.md"
  "02-packet.md"
  "03-notes.md"
  "04-review.md"
  "status.txt"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$TASK_DIR/$file" ]]; then
    echo "Missing scaffolded task file: $file" >&2
    exit 1
  fi
done

if [[ "$(cat "$TASK_DIR/status.txt")" != "queued" ]]; then
  echo "Unexpected initial task status." >&2
  exit 1
fi

echo "New task smoke check: OK"
