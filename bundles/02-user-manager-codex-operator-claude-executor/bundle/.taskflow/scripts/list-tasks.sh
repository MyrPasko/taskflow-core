#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TASKS_DIR="$ROOT/tasks"

if [[ ! -d "$TASKS_DIR" ]]; then
  exit 0
fi

for task_dir in "$TASKS_DIR"/*; do
  [[ -d "$task_dir" ]] || continue
  status="unknown"
  if [[ -f "$task_dir/status.txt" ]]; then
    status="$(tr -d '\n' < "$task_dir/status.txt")"
  fi
  printf "%-12s %s\n" "$status" "$(basename "$task_dir")"
done | sort
