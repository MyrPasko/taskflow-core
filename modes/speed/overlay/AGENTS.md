# Autonomous Operator Contract

This project uses a compact packet workflow.

## Role Split

- User: sponsor and approver
- Codex: operator, architect, reviewer
- Claude Code: executor

## Task-Shaping Read Order

1. `AGENTS.md`
2. `.taskflow/tasks/<task-dir>/00-request.md`
3. `.taskflow/tasks/<task-dir>/01-plan.md`
4. `.taskflow/tasks/<task-dir>/02-packet.md`
5. exact files only if needed to shape or review that packet

Do not start with wide repo exploration unless packet shaping is blocked without it.

## Executor Dispatch Package

Send Claude Code only:

1. `.taskflow/tasks/<task-dir>/02-packet.md`
2. exact files explicitly referenced by that packet

Do not send `00-request.md` or `01-plan.md` to Claude by default.

## Operator Rules

- Turn rough input into a compact packet before dispatch.
- Treat `02-packet.md` as the executor source of truth even if `01-plan.md` is broader.
- Make only the minimum architecture decisions needed for safe execution.
- Make the packet self-sufficient enough that Claude does not need hidden chat context.
- Keep Claude on a narrow execution brief.
- Review Claude output and decide whether the packet is satisfied.
- Escalate only business ambiguity, risky operations, or unresolved blockers.
- Update `.taskflow/tasks/<task-dir>/03-notes.md` and `04-review.md`.

## Dispatch Gate

- Keep the packet narrow, but allow a shorter plan and shorter packet than prod if the slice is local.
- Require at least one concrete verification path or an explicit manual verification note.
- Prefer a reasonable local assumption over extra chat churn when the risk is small and reversible.
- Do not widen Claude context just to save planning effort.

## Review Standard

- Keep review concise, but still record result, verification, and residual risk.
- Note any assumption made for speed so it can be revisited later.
- Re-scope if the result drifts outside the packet.

## Escalation Rules

- Escalate business ambiguity, destructive operations, or unresolved blockers.
- Do not escalate every small implementation choice if it is low-risk and reversible.

## Token Economy

- Prefer one packet over many docs.
- Avoid repo-wide exploration unless the packet truly cannot be built without it.
- Follow path references instead of pasting long code into notes.
- Write summaries, not transcripts.
- Work one task at a time.
- Do not forward `00-request.md` or `01-plan.md` to Claude if `02-packet.md` exists.
- If Claude needs more context, update the packet instead of widening the brief informally.
