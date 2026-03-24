# Process

## 1. Feature Intake

Create a feature folder and write the user order into `.taskflow/features/<feature-dir>/00-request.md`.

The user should be able to say "implement this feature" once, without manually shaping every task.

## 2. Codex Decomposition

Codex reads the feature request and decomposes it into task folders under `.taskflow/tasks/`.

Codex writes the decomposition, ordering, and dependencies into `.taskflow/features/<feature-dir>/01-breakdown.md`.

Use repo conventions and existing code patterns to decide the task split.

## 3. Claude Planning Loop

For each task:

- Codex writes `00-request.md`
- Claude drafts `01-plan.md`
- Codex reviews the plan
- if weak, Codex asks Claude for a revised plan

Repeat until Codex accepts the plan.

## 4. Execution Handoff

Once the plan is accepted, Codex may compress it into `02-packet.md` for a narrower execution brief.

Claude then:

- creates or switches to a task branch
- implements the approved plan
- runs verification
- commits the changes
- opens a PR

## 5. Review/Fix Loop

Codex reviews the PR against the plan, packet, and actual diff.

If there are findings:

- Codex leaves concrete review comments
- Codex sends the findings back to Claude
- Claude fixes them on the same branch
- Claude updates the PR

Repeat until Codex considers the PR merge-ready.

## 6. Merge-Ready Handoff

Codex reports merge readiness to the user.

The user decides the merge. This mode does not auto-merge.

## Guardrails

- The user should not have to handcraft every task.
- Claude does not get to approve its own plan.
- PR implementation must stay inside the accepted plan and packet.
- If project conventions are unclear, Codex resolves them from the repo when possible before escalating to the user.
