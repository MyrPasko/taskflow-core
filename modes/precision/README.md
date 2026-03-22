# Precision Mode

Precision mode is the direct execution path.

## Role Split

- user: manager, operator, architect, reviewer
- Codex: executor

## Intent

Use this when correctness and tight human control matter more than throughput.

This mode should stay minimal. It is the safe baseline and training ground for packet discipline.

## Guardrails

- packet-only execution path
- no extra operator ceremony beyond packet, notes, and review
- lightweight but explicit verification record
- ask for a better packet instead of improvising a redesign

## Install

```bash
./scripts/install-mode.sh precision /absolute/path/to/target-project
```
