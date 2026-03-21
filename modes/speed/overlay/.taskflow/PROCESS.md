# Process

## 1. Intake

Create a task folder and write the raw problem into `00-request.md`.

The request may be verbose. That is fine. It is not for the executor.

## 2. Compression

Codex converts the request into `01-packet.md`.

The packet should contain:

- target outcome
- exact scope
- acceptance criteria
- allowed context files
- commands to verify
- explicit non-goals

Keep the packet short. Aim for one screen or two, not a miniature novel.

## 3. Dispatch

Claude Code reads the packet and the exact referenced files only.

Claude must not do broad architecture work unless the packet says so.

## 4. Review

Codex records result, known risks, and verification in `03-review.md`.

## 5. Close or Re-scope

If accepted, move status to `done`.

If not accepted, update the packet instead of piling chat context on top of a weak brief.

## Token Rules

- Do not pass raw request docs to the executor if the packet already exists.
- Do not paste large diffs into notes.
- Prefer references to files and commands.
- Split work if the packet grows too large.
