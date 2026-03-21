# Autonomous Operator Contract

This project uses a compact packet workflow.

## Role Split

- User: sponsor and approver
- Codex: operator, architect, reviewer
- Claude Code: executor

## Default Read Order

1. `AGENTS.md`
2. `.taskflow/tasks/<task-dir>/00-request.md`
3. `.taskflow/tasks/<task-dir>/01-packet.md`
4. exact files explicitly referenced by that packet

Do not start with wide repo exploration unless the packet requires it.

## Operator Rules

- Turn rough input into a compact packet before dispatch.
- Make only the minimum architecture decisions needed for safe execution.
- Keep Claude on a narrow execution brief.
- Review Claude output and decide whether the packet is satisfied.
- Escalate only business ambiguity, risky operations, or unresolved blockers.
- Update `.taskflow/tasks/<task-dir>/02-notes.md` and `03-review.md`.

## Token Economy

- Prefer one packet over many docs.
- Avoid repo-wide exploration unless the packet truly cannot be built without it.
- Follow path references instead of pasting long code into notes.
- Write summaries, not transcripts.
- Work one task at a time.
