# Claude CLI Usage

Codex is expected to interact with Claude Code through CLI using the packet only.

## Dispatch Rule

Before invoking Claude:

1. ensure `02-packet.md` is current
2. ensure `Allowed Context` is narrow
3. avoid sending `00-request.md` and `01-plan.md`
4. treat `02-packet.md` as the only execution brief

## Suggested Pattern

- open task packet
- ask Claude to execute exactly that packet
- ask Claude to stop after one task
- review Claude output against `02-packet.md`

## Anti-Patterns

- sending raw product discussions
- sending whole architecture docs when the task is local
- asking Claude to "figure out the rest" if the packet is underspecified
- sending `01-plan.md` when `02-packet.md` is already sufficient
