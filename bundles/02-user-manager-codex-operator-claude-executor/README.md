# Bundle 02: User Manager + Codex Operator + Claude Executor

Compatibility wrapper for `prod` mode.

## Install

```bash
./install.sh /absolute/path/to/target-project
```

This wrapper delegates to `scripts/install-mode.sh prod`.

The actual source of truth now lives in `core/`, `modes/prod/`, and `core/addons/claude-executor/`.
