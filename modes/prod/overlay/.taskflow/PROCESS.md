# Process

## 1. Intake

Create a task folder and write the raw problem into `00-request.md`.

The request may be verbose. That is fine. It is not for the executor.

## 2. Planning

Codex turns the request into `01-plan.md`.

## 3. Compression

Codex converts the plan into `02-packet.md`.

The packet should contain:

- goal
- exact scope
- acceptance criteria
- allowed context files
- explicit non-goals
- short execution notes
- verification commands
- deliverable

Keep the packet short. Aim for one screen or two, not a miniature novel.

Before dispatch, confirm that the packet has exact verification commands and no unresolved production-risk ambiguity.

## 4. Dispatch

Claude Code reads the packet and the exact referenced files only.

Claude must not do broad architecture work unless the packet says so.
Do not send `00-request.md` or `01-plan.md` to Claude unless the packet explicitly requires them.

## 5. Review

Codex reviews result, known risks, and verification in `04-review.md`.

The review must record commands run, commands not run, and any residual production risk.

## 6. Close or Re-scope

If accepted, move status to `done`.

If not accepted, update the plan or packet instead of piling chat context on top of a weak brief.

## Token Rules

- Do not pass raw request docs or `01-plan.md` to the executor if `02-packet.md` already exists.
- Do not pass raw request docs or `01-plan.md` to Claude if `02-packet.md` already exists.
- Do not paste large diffs into notes.
- Prefer references to files and commands.
- Split work if the packet grows too large.
- If the packet is weak, stop and improve it instead of letting Claude infer the missing discipline.
