# Speed Mode

Speed mode is the low-friction operator pipeline.

## Role Split

- user: sponsor, approver
- Codex: operator, architect, reviewer
- Claude Code: executor

## Intent

Use this for side projects where speed is primary and quality is added without dragging in heavy process.

This mode should keep packet quality high while reducing interaction overhead.

## Guardrails

- keep packet-first dispatch intact even when moving quickly
- allow compact planning and shorter review notes
- make reasonable local assumptions when risk is small and reversible
- still require explicit verification and residual-risk notes

## Install

```bash
./scripts/install-mode.sh speed /absolute/path/to/target-project
```
