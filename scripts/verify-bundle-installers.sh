#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d /tmp/taskflow-bundle-parity-XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

PAIRS=(
  "precision:bundles/01-user-operator-codex-executor/install.sh"
  "prod:bundles/02-user-manager-codex-operator-claude-executor/install.sh"
  "speed:bundles/03-codex-operator-claude-executor/install.sh"
)

for pair in "${PAIRS[@]}"; do
  mode="${pair%%:*}"
  bundle_install="${pair#*:}"
  direct_target="$TMP_DIR/$mode-direct"
  bundle_target="$TMP_DIR/$mode-bundle"

  "$ROOT/scripts/install-mode.sh" "$mode" "$direct_target" >/dev/null
  "$ROOT/$bundle_install" "$bundle_target" >/dev/null

  if ! diff -qr "$direct_target" "$bundle_target" >/dev/null; then
    echo "Bundle installer parity failed for mode: $mode" >&2
    diff -qr "$direct_target" "$bundle_target" >&2 || true
    exit 1
  fi
done

echo "Bundle installer parity: OK"
