# Prod Mode

Prod mode is the production-oriented operator pipeline.

## Role Split

- user: manager
- Codex: operator, architect, reviewer
- Claude Code: executor

## Intent

Use this for live production codebases where quality is primary and speed is added carefully.

This mode should carry the strongest guardrails around packet quality, verification, and review discipline.

## Install

```bash
./scripts/install-mode.sh prod /absolute/path/to/target-project
```
