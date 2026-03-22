# .taskflow

`.taskflow` is a lightweight execution layer for manager/operator to executor handoff.

It is intentionally smaller than Taskmaster:

- no heavy planner runtime
- no large MCP tool surface
- no always-on context loading
- one task packet per execution

## Core Files

- `tasks/<task-dir>/00-request.md`: raw task request from manager/operator
- `tasks/<task-dir>/01-plan.md`: operator-facing task and subtask plan
- `tasks/<task-dir>/02-packet.md`: compact executor packet
- `tasks/<task-dir>/03-notes.md`: implementation notes and deltas
- `tasks/<task-dir>/04-review.md`: review outcome, risks, verification
- `tasks/<task-dir>/status.txt`: current status

## Status Values

- `queued`
- `ready`
- `in_progress`
- `review`
- `blocked`
- `done`

## Principle

The executor should need only one compact packet plus exact file references.

`01-plan.md` is for planning, sequencing, and task boundaries.

Do not pass `00-request.md` or `01-plan.md` to the executor by default once `02-packet.md` exists.
