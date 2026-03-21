#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_DIR="$ROOT/bundle"

FORCE=0
if [[ "${1:-}" == "--force" ]]; then
  FORCE=1
  shift
fi

TARGET="${1:-}"

if [[ -z "$TARGET" ]]; then
  echo "Usage: ./install.sh [--force] /absolute/path/to/target-project" >&2
  exit 1
fi

mkdir -p "$TARGET"

if [[ $FORCE -ne 1 ]]; then
  if [[ -e "$TARGET/AGENTS.md" || -e "$TARGET/.taskflow" || -e "$TARGET/CLAUDE.md" ]]; then
    echo "Target already contains pipeline files. Re-run with --force to overwrite." >&2
    exit 1
  fi
fi

cp -R "$BUNDLE_DIR"/. "$TARGET"/

if [[ -d "$TARGET/.taskflow/scripts" ]]; then
  find "$TARGET/.taskflow/scripts" -type f -name "*.sh" -exec chmod +x {} +
fi

echo "Installed bundle 01 into $TARGET"
