# Prod Mode

Prod mode is the production-oriented operator pipeline.

## Role Split

- user: manager
- Codex: operator, architect, reviewer
- Claude Code: executor

## Intent

Use this for live production codebases where quality is primary and speed is added carefully.

This mode should carry the strongest guardrails around packet quality, verification, and review discipline.

## Guardrails

- do not dispatch without a tight packet and exact verification commands
- escalate risky operations, production ambiguity, and scope drift before execution
- require explicit review evidence, not just a success summary
- prefer slower clarity over fast packet churn

## Install

```bash
./scripts/install-mode.sh prod /absolute/path/to/target-project
```
