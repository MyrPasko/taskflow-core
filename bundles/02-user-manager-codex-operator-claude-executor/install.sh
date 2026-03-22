#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
MODE="prod"

if [[ "${1:-}" == "--force" ]]; then
  shift
  exec "$ROOT/scripts/install-mode.sh" --force "$MODE" "$@"
fi

exec "$ROOT/scripts/install-mode.sh" "$MODE" "$@"
