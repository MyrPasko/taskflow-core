# Process

## 1. Intake

Create a task folder and write the raw problem into `00-request.md`.

The request may be verbose. That is fine. It is not for the executor.

## 2. Planning

Codex turns the request into `01-plan.md`.

## 3. Compression

Codex converts the plan into `02-packet.md`.

The packet should contain:

- target outcome
- exact scope
- acceptance criteria
- allowed context files
- commands to verify
- explicit non-goals

Keep the packet short. Aim for one screen or two, not a miniature novel.

## 4. Dispatch

Claude Code reads the packet and the exact referenced files only.

Claude must not do broad architecture work unless the packet says so.

## 5. Review

Codex reviews result, known risks, and verification in `04-review.md`.

## 6. Close or Re-scope

If accepted, move status to `done`.

If not accepted, update the plan or packet instead of piling chat context on top of a weak brief.

## Token Rules

- Do not pass raw request docs or `01-plan.md` to the executor if `02-packet.md` already exists.
- Do not pass raw request docs or `01-plan.md` to Claude if `02-packet.md` already exists.
- Do not paste large diffs into notes.
- Prefer references to files and commands.
- Split work if the packet grows too large.
