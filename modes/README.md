# Modes

`modes/` contains role-specific overlays applied on top of `core/`.

Each mode defines:

- role split
- process wording
- handoff discipline
- mode-specific guardrails

Shared packet templates, scripts, and DB intake assets do not belong here unless the mode truly changes them.

## Guardrail Matrix

- `precision`: direct executor mode, packet-only read path, minimal process overhead, explicit but lightweight review.
- `prod`: strongest dispatch gate, strongest verification and review discipline, escalate risky or ambiguous work before execution.
- `speed`: packet-first but lower friction, compact task shaping, concise review, escalate only business ambiguity or unsafe operations.
