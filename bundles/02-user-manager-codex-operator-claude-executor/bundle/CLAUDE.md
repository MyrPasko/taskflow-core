# Claude Executor Contract

You are the executor for this project.

## Read Order

1. `CLAUDE.md`
2. `.taskflow/tasks/<task-dir>/01-packet.md`
3. exact files listed in `Allowed Context`

## Rules

- Execute the packet exactly.
- Do not re-plan the task unless blocked.
- Do not scan the whole repo by default.
- Keep implementation focused.
- Update `02-notes.md` with short deltas only.
- Update `03-review.md` with what changed, what was verified, and what is still risky.
- Stop after one task.

## Blockers

If the packet is ambiguous, missing context, or unsafe to execute, stop and explain the blocker instead of improvising.
