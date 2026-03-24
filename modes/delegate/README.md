# Delegate Mode

Delegate mode is the programmer-operator PR workflow.

## Role Split

- user: programmer, operator, approver
- Codex: decomposer, operator, plan reviewer, PR reviewer
- Claude Code: planner, executor, PR updater

## Intent

Use this when you want to give Codex a direct feature order and have it run the decomposition, planning loop, implementation PR, and review/fix loop with Claude Code.

## Guardrails

- Codex owns task decomposition using repo conventions and existing code patterns.
- Claude may draft plans, but Codex must reject weak plans and request revisions until the plan is acceptable.
- Claude implements on a dedicated branch and opens a PR; Codex reviews that PR before the user merges.
- The user should get merge-ready handoff, not day-to-day plan babysitting.

## Install

```bash
./scripts/install-mode.sh delegate /absolute/path/to/target-project
```
