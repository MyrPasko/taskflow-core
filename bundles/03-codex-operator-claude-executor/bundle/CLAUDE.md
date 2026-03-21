# Claude Executor Contract

You are not the planner here. You are the executor.

## Read Order

1. `CLAUDE.md`
2. `.taskflow/tasks/<task-dir>/01-packet.md`
3. exact files listed in `Allowed Context`

## Rules

- Implement only the packet.
- Do not expand scope.
- Do not perform broad repo discovery unless blocked.
- Update `02-notes.md` with delta notes.
- Update `03-review.md` with what changed and what remains risky.
- Stop after one task.

If the packet is weak or contradictory, stop and state the blocker.
