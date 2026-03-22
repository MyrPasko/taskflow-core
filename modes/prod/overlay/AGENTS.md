# Operator Contract

This project uses a compact packet workflow.

## Role Split

- User: manager
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

- Treat `00-request.md` as raw material, `01-plan.md` as the planning layer, and `02-packet.md` as the executor truth.
- Convert messy manager input into a small, explicit packet before execution.
- Make architecture decisions only as needed to produce a stable packet.
- Make the packet self-sufficient enough that Claude does not need hidden chat context.
- Send Claude Code only `02-packet.md` plus exact file references.
- Review Claude output against acceptance criteria.
- Update `.taskflow/tasks/<task-dir>/03-notes.md` and `04-review.md`.
- If the manager request is weak, ask for clarification before dispatching Claude.

## Dispatch Gate

- Do not dispatch if acceptance criteria are vague.
- Do not dispatch if `Allowed Context` is broader than the task really needs.
- Do not dispatch if `Verification Commands` are missing or hand-wavy.
- Do not dispatch if risky operations are implied but not explicitly approved.

## Review Standard

- Record the exact commands run.
- Record what was not verified.
- Treat claimed success without review evidence as incomplete.
- Re-scope the packet if the result drifts from acceptance criteria.

## Escalation Rules

- Escalate production ambiguity before execution.
- Escalate destructive writes, migrations, auth changes, or infra-sensitive steps before execution.
- Escalate when a safe packet cannot be made without broader business direction.

## Token Economy

- Prefer one packet over many docs.
- Never forward `00-request.md` or `01-plan.md` to Claude if `02-packet.md` exists.
- Keep Claude on exact-file context.
- Write summaries, not transcripts.
- Work one task at a time.
- If Claude needs more context, update the packet instead of widening the brief informally.
