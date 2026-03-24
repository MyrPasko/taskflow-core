# Claude PR Workflow Addon

This addon contains Claude-facing command docs for modes where Claude plans, implements on a branch, opens a PR, and iterates on review feedback.

## Contents

- `.claude/commands/plan-task.md`
- `.claude/commands/implement-task.md`
- `.claude/commands/fix-pr-feedback.md`
- `.taskflow/claude-pr-workflow.md`

## Boundary

Keep this addon specific to delegated PR workflows.

If a rule is about generic packet execution, it belongs in `core/addons/claude-executor/` instead.
