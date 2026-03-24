# Core

`core/` contains assets shared by every operating mode.

## Contents

- `bundle/.taskflow/`: shared taskflow files, scripts, templates, task docs, and DB intake docs
- `addons/claude-executor/`: shared Claude executor contract and CLI command docs for Claude-backed modes
- `addons/claude-pr-workflow/`: delegated planning, implementation, and PR-loop command docs for Claude-backed PR workflows

## Boundary

`core/` should contain only material that is genuinely mode-agnostic.

If a file changes because of role split, approval model, or guardrail strictness, it belongs in `modes/`, not here.
