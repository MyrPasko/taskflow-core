# Operator Contract

This project uses a compact packet workflow.

## Role Split

- User: manager
- Codex: operator, architect, reviewer
- Claude Code: executor

## Default Read Order

1. `AGENTS.md`
2. `.taskflow/tasks/<task-dir>/00-request.md`
3. `.taskflow/tasks/<task-dir>/01-plan.md`
4. `.taskflow/tasks/<task-dir>/02-packet.md`
5. exact files explicitly referenced by that packet

Do not start with wide repo exploration unless the packet requires it.

## Operator Rules

- Treat `00-request.md` as raw material, `01-plan.md` as the planning layer, and `02-packet.md` as the executor truth.
- Convert messy manager input into a small, explicit packet before execution.
- Make architecture decisions only as needed to produce a stable packet.
- Send Claude Code only `02-packet.md` plus exact file references.
- Review Claude output against acceptance criteria.
- Update `.taskflow/tasks/<task-dir>/03-notes.md` and `04-review.md`.
- If the manager request is weak, ask for clarification before dispatching Claude.

## Token Economy

- Prefer one packet over many docs.
- Never forward `00-request.md` or `01-plan.md` to Claude if `02-packet.md` exists.
- Keep Claude on exact-file context.
- Write summaries, not transcripts.
- Work one task at a time.
