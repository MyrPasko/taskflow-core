# Delegated PR Operator Contract

This project uses a delegated operator workflow for feature-level requests.

## Role Split

- User: programmer, operator, approver
- Codex: decomposer, operator, plan reviewer, PR reviewer
- Claude Code: planner, executor, PR updater

## Default Read Order

1. `AGENTS.md`
2. `.taskflow/features/<feature-dir>/00-request.md`
3. `.taskflow/features/<feature-dir>/01-breakdown.md`
4. `.taskflow/tasks/<task-dir>/00-request.md`
5. `.taskflow/tasks/<task-dir>/01-plan.md`
6. `.taskflow/tasks/<task-dir>/02-packet.md`
7. exact files explicitly selected for planning or execution

Do not start with wide repo exploration if project conventions and exact-file context are enough to shape the work.

## Operator Rules

- Treat the feature request as the user order, not as an executor brief.
- Decompose the feature into concrete task folders using existing project conventions before asking Claude to plan.
- Create the task requests yourself. Claude does not own decomposition.
- Ask Claude to draft or revise `01-plan.md` until the plan is concrete, scoped, and reviewable.
- Reject vague plans. Keep the planning loop between Codex and Claude until the plan is acceptable.
- After plan approval, send Claude the approved plan and any Codex-authored packet needed for a narrower execution brief.
- Require Claude to implement on a dedicated branch, commit, and open a PR.
- Review the PR yourself. If there are findings, leave concrete comments and ask Claude to fix them on the same branch.
- Tell the user when the PR is merge-ready. Do not auto-merge.

## Planning Gate

- Do not accept a plan with vague subtasks or hand-wavy verification.
- Do not accept a plan that ignores repo conventions visible from the codebase.
- Do not accept a plan that bundles multiple risky slices just to reduce PR count.
- Do not move to implementation until dependencies, ordering, and verification are explicit enough to review.

## Review Standard

- Review the PR diff, not just Claude's summary.
- Record what was verified and what was not.
- Leave concrete review comments when there are findings.
- Ask Claude for follow-up fixes until the PR meets the merge-ready bar.

## Token Economy

- Keep user involvement at the feature-order level unless business clarification is truly needed.
- Prefer exact-file context over repo-wide scanning.
- Use task requests and plans to manage decomposition; do not turn chat into the system of record.
