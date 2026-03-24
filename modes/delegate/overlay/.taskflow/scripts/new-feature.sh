#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE_DIR="$ROOT/templates"
FEATURES_DIR="$ROOT/features"

FEATURE_ID="${1:-}"
SLUG="${2:-}"

if [[ -z "$FEATURE_ID" || -z "$SLUG" ]]; then
  echo "Usage: ./.taskflow/scripts/new-feature.sh FEATURE-001 pacman" >&2
  exit 1
fi

FEATURE_DIR="$FEATURES_DIR/${FEATURE_ID}-${SLUG}"

if [[ -e "$FEATURE_DIR" ]]; then
  echo "Feature already exists: $FEATURE_DIR" >&2
  exit 1
fi

mkdir -p "$FEATURE_DIR"

TITLE="${SLUG//-/ }"

sed "s/{{FEATURE_ID}}/$FEATURE_ID/g; s/{{TITLE}}/$TITLE/g" "$TEMPLATE_DIR/feature-request.md" > "$FEATURE_DIR/00-request.md"
sed "s/{{FEATURE_ID}}/$FEATURE_ID/g" "$TEMPLATE_DIR/feature-breakdown.md" > "$FEATURE_DIR/01-breakdown.md"
printf "draft\n" > "$FEATURE_DIR/status.txt"

echo "Created $FEATURE_DIR"
