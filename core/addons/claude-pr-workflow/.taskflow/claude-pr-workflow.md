# Claude PR Workflow

Use this workflow when Codex is delegating planning, implementation, and PR iteration to Claude Code.

## Planning Loop

1. Claude reads the task request plus exact context selected by Codex.
2. Claude drafts or updates `01-plan.md`.
3. Codex reviews the plan.
4. If the plan is weak, Codex asks Claude for a revised `01-plan.md`.
5. Do not move to implementation until Codex accepts the plan.

## Implementation Loop

1. Claude reads the approved `01-plan.md`.
2. Codex may also provide `02-packet.md` as the execution brief if a narrower handoff is needed.
3. Claude creates or switches to a dedicated branch for the task.
4. Claude implements the task, runs the requested verification, commits, and opens a PR.
5. Claude records the PR link and verification outcome in task notes or review docs.

## Review/Fix Loop

1. Codex reviews the PR with a strict engineering bar.
2. If there are findings, Codex leaves concrete review comments and sends the findings back to Claude.
3. Claude fixes the findings on the same branch, reruns verification, and updates the PR.
4. Repeat until Codex considers the PR merge-ready.

## Guardrails

- Do not ask the user to manually mediate each plan revision if Codex can resolve it from repo conventions.
- Do not open a PR from a weak plan.
- Do not auto-merge. Codex reports readiness; the user decides the merge.
- If git or PR tooling is unavailable, stop and report the blocker instead of pretending the loop completed.
