#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CORE_DIR="$ROOT/core/bundle"
CLAUDE_ADDON_DIR="$ROOT/core/addons/claude-executor"
MODES_DIR="$ROOT/modes"

FORCE=0

if [[ "${1:-}" == "--force" ]]; then
  FORCE=1
  shift
fi

MODE="${1:-}"
TARGET="${2:-}"

if [[ -z "$MODE" || -z "$TARGET" ]]; then
  echo "Usage: ./scripts/install-mode.sh [--force] <precision|prod|speed> /absolute/path/to/target-project" >&2
  exit 1
fi

MODE_DIR="$MODES_DIR/$MODE/overlay"

if [[ ! -d "$MODE_DIR" ]]; then
  echo "Unknown mode: $MODE" >&2
  echo "Supported modes: precision, prod, speed" >&2
  exit 1
fi

INCLUDE_CLAUDE_ADDON=0
case "$MODE" in
  precision)
    ;;
  prod|speed)
    INCLUDE_CLAUDE_ADDON=1
    ;;
esac

mkdir -p "$TARGET"

if [[ $FORCE -ne 1 ]]; then
  if [[ -e "$TARGET/AGENTS.md" || -e "$TARGET/.taskflow" || -e "$TARGET/CLAUDE.md" || -e "$TARGET/.claude" ]]; then
    echo "Target already contains pipeline files. Re-run with --force to overwrite." >&2
    exit 1
  fi
else
  rm -rf "$TARGET/AGENTS.md" "$TARGET/CLAUDE.md" "$TARGET/.taskflow" "$TARGET/.claude"
fi

cp -R "$CORE_DIR"/. "$TARGET"/

if [[ $INCLUDE_CLAUDE_ADDON -eq 1 ]]; then
  cp "$CLAUDE_ADDON_DIR/CLAUDE.md" "$TARGET/CLAUDE.md"
  cp -R "$CLAUDE_ADDON_DIR/.claude" "$TARGET/.claude"
  cp "$CLAUDE_ADDON_DIR/.taskflow/claude-cli.md" "$TARGET/.taskflow/claude-cli.md"
fi

cp -R "$MODE_DIR"/. "$TARGET"/

if [[ -d "$TARGET/.taskflow/scripts" ]]; then
  find "$TARGET/.taskflow/scripts" -type f -name "*.sh" -exec chmod +x {} +
fi

echo "Installed mode $MODE into $TARGET"
