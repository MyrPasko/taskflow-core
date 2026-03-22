#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$ROOT/verify-bundle-installers.sh"
"$ROOT/check-stale-artifact-refs.sh"
"$ROOT/smoke-new-task.sh"

echo "Repo verification: OK"
