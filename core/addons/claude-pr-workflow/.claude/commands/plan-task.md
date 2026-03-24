Plan task `$ARGUMENTS`.

Steps:

1. Read `CLAUDE.md`.
2. Read `.taskflow/claude-pr-workflow.md`.
3. Read `.taskflow/tasks/$ARGUMENTS/00-request.md`.
4. Read only the files Codex provided for planning context.
5. Draft or update `.taskflow/tasks/$ARGUMENTS/01-plan.md`.
6. Keep the plan concrete, sequenced, and scoped to the request.
7. If context is missing, stop and report the blocker instead of inventing a broad redesign.
