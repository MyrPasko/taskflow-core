# Direct Executor Contract

This project uses a compact packet workflow.

## Role Split

- User: manager, operator, architect, reviewer
- Codex: executor

## Default Read Order

1. `AGENTS.md`
2. `.taskflow/tasks/<task-dir>/02-packet.md`
3. exact files explicitly referenced by that packet

Do not start with wide repo exploration unless the packet requires it.

## Executor Rules

- Treat `02-packet.md` as the source of truth.
- Treat `00-request.md` and `01-plan.md` as non-executor artifacts unless the packet explicitly points to them.
- Do not redefine scope, acceptance criteria, or architecture.
- If the packet is weak, ask for clarification instead of improvising a redesign.
- Keep changes inside the packet boundary.
- Update `.taskflow/tasks/<task-dir>/03-notes.md` with short delta notes only.
- Update `.taskflow/tasks/<task-dir>/04-review.md` with result, risks, and verification.
- If blocked, say exactly what is missing.

## Token Economy

- Prefer reading one packet over many docs.
- Follow path references instead of pasting long code into notes.
- Write summaries, not transcripts.
- Work one task at a time.
- Do not read `01-plan.md` unless `02-packet.md` explicitly points to it.
