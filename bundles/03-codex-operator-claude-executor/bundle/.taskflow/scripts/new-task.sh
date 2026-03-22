#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE_DIR="$ROOT/templates"
TASKS_DIR="$ROOT/tasks"

TASK_ID="${1:-}"
SLUG="${2:-}"

if [[ -z "$TASK_ID" || -z "$SLUG" ]]; then
  echo "Usage: ./.taskflow/scripts/new-task.sh TASK-001 short-slug" >&2
  exit 1
fi

TASK_DIR="$TASKS_DIR/${TASK_ID}-${SLUG}"

if [[ -e "$TASK_DIR" ]]; then
  echo "Task already exists: $TASK_DIR" >&2
  exit 1
fi

mkdir -p "$TASK_DIR"

TITLE="${SLUG//-/ }"

sed "s/{{TASK_ID}}/$TASK_ID/g; s/{{TITLE}}/$TITLE/g" "$TEMPLATE_DIR/task-request.md" > "$TASK_DIR/00-request.md"
sed "s/{{TASK_ID}}/$TASK_ID/g" "$TEMPLATE_DIR/task-plan.md" > "$TASK_DIR/01-plan.md"
sed "s/{{TASK_ID}}/$TASK_ID/g" "$TEMPLATE_DIR/task-packet.md" > "$TASK_DIR/02-packet.md"
sed "s/{{TASK_ID}}/$TASK_ID/g" "$TEMPLATE_DIR/task-notes.md" > "$TASK_DIR/03-notes.md"
sed "s/{{TASK_ID}}/$TASK_ID/g" "$TEMPLATE_DIR/task-review.md" > "$TASK_DIR/04-review.md"
printf "queued\n" > "$TASK_DIR/status.txt"

echo "Created $TASK_DIR"
