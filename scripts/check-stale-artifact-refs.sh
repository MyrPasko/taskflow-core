#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT"

if rg -n 'bundles/.*/bundle/' \
  --glob '!bundles/*/bundle/**' \
  --glob '!.git/**' \
  --glob '!scripts/check-stale-artifact-refs.sh' \
  core modes bundles scripts; then
  echo "Found stale references to legacy bundle payload paths." >&2
  exit 1
fi

echo "Stale artifact references: OK"
