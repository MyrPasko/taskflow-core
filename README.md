# taskflow-core

`taskflow-core` is a lightweight workflow system for packet-first execution.

This repository is not a Taskmaster clone. It is a smaller system built around:

- one task per execution
- packet as source of truth
- exact-file context only
- delta notes instead of transcripts
- narrow operator to executor handoff

## Current Refactor Direction

The old source layout treated three workflow variants as separate bundles:

- `01-user-operator-codex-executor`
- `02-user-manager-codex-operator-claude-executor`
- `03-codex-operator-claude-executor`

The new source layout treats them as one system with three operating modes:

- `precision`: direct user-operated execution
- `prod`: manager -> Codex operator -> Claude executor
- `speed`: sponsor/approver -> Codex operator -> Claude executor

## Repository Shape

- `core/`: shared assets used by every mode
- `core/addons/claude-executor/`: shared Claude executor support for Claude-backed modes
- `modes/precision/`: precision-mode overlay
- `modes/prod/`: prod-mode overlay
- `modes/speed/`: speed-mode overlay
- `bundles/`: temporary legacy source layout kept during the PR split

## Installation

Install a mode from the normalized source layout:

```bash
./scripts/install-mode.sh <precision|prod|speed> /absolute/path/to/target-project
```

Use `--force` to overwrite an existing pipeline install.

## Repo Verification

These checks are for maintainers of this workflow system, not for installed projects:

- `./scripts/verify-bundle-installers.sh`: compare each legacy bundle installer against `scripts/install-mode.sh`
- `./scripts/check-stale-artifact-refs.sh`: fail on references to legacy `bundles/*/bundle/*` payload paths outside those payload directories
- `./scripts/smoke-new-task.sh`: verify new task scaffolding still creates the expected task files
- `./scripts/verify-repo.sh`: run the full lightweight verification suite

## Refactor Policy

This refactor is intended to land as narrow PRs:

1. introduce normalized source layout
2. switch installation to `core + mode overlay`
3. harden the task packet system
4. tighten mode-specific guardrails
5. improve the lightweight DB intake layer

Do not re-expand the system into a heavy planner runtime, broad repo-loading flow, or Taskmaster-style product surface.

## Merge Convention

For this project, merge commits should use a fixed format:

- commit message: exact PR title
- extended description: short bullet list of the changes included in the PR

Keep the description concrete. Do not use generic merge text.

## PR Review Convention

Every PR created by Codex must be self-reviewed before handoff.

Review standard:

- use an advanced reviewer mindset
- check correctness, regression risk, architecture fit, scope control, and verification quality
- surface weaknesses directly instead of smoothing them over
- call out what was not verified
- do not hide future break risks just because the current slice is small

If there are blocking issues, say so plainly.

If there are no blocking issues, say that directly too, but do not pretend the remaining risk is zero.

Codex may merge its own PRs when the implementation passes this review bar and is honestly considered merge-ready.
