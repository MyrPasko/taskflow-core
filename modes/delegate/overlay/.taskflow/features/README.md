# Features

Use `.taskflow/features/` for feature-level requests that Codex will decompose into multiple tasks.

Each feature folder should contain:

- `00-request.md`: the programmer-operator request
- `01-breakdown.md`: Codex decomposition and task queue
- `status.txt`: feature-level status

Tasks still live under `.taskflow/tasks/`.
