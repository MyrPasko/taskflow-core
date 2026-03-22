# Process

## 1. Intake

Create a task folder and write the raw problem into `00-request.md`.

The request may be verbose. That is fine. It is not for the executor.

## 2. Planning

Turn the request into `01-plan.md`.

## 3. Compression

Convert the plan into `02-packet.md`.

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

## 4. Execution

The executor reads the packet and the exact referenced files only.

The executor must not do broad architecture work unless the packet says so.
Do not pass `00-request.md` or `01-plan.md` unless the packet explicitly requires them.

This mode is intentionally direct: once the packet is ready, execute it without adding extra operator ceremony.

## 5. Review

Record result, known risks, and verification in `04-review.md`.

Keep the review short, but explicitly state what was run and what was not run.

## 6. Close or Re-scope

If accepted, move status to `done`.

If not accepted, update the plan or packet instead of piling chat context on top of a weak brief.

## Token Rules

- Do not pass raw request docs or `01-plan.md` to the executor if `02-packet.md` already exists.
- Do not paste large diffs into notes.
- Prefer references to files and commands.
- Split work if the packet grows too large.
- If the packet is weak, stop and tighten it instead of compensating with more chat.
