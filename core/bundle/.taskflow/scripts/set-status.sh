#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TASKS_DIR="$ROOT/tasks"

TASK_REF="${1:-}"
STATUS="${2:-}"

if [[ -z "$TASK_REF" || -z "$STATUS" ]]; then
  echo "Usage: ./.taskflow/scripts/set-status.sh TASK-001-short-slug ready" >&2
  exit 1
fi

TASK_DIR="$TASKS_DIR/$TASK_REF"

if [[ ! -d "$TASK_DIR" ]]; then
  MATCH="$(find "$TASKS_DIR" -maxdepth 1 -type d -name "${TASK_REF}*" | head -n 1 || true)"
  TASK_DIR="${MATCH:-}"
fi

if [[ -z "$TASK_DIR" || ! -d "$TASK_DIR" ]]; then
  echo "Task not found: $TASK_REF" >&2
  exit 1
fi

printf "%s\n" "$STATUS" > "$TASK_DIR/status.txt"
echo "Updated $(basename "$TASK_DIR") -> $STATUS"
