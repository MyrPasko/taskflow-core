# Bundle 02: User Manager + Codex Operator + Claude Executor

This bundle is for the mode where:

- You own management and priorities.
- Codex owns packet design, architecture shaping, and review.
- Claude Code executes the packet.

The bundle is optimized for low token use:

- one task per execution
- one compact packet as the executor's source of truth
- Codex passes only the packet to Claude Code
- delta-only notes after execution

## Install

```bash
./install.sh /absolute/path/to/target-project
```

## What Gets Installed

- `AGENTS.md`
- `CLAUDE.md`
- `.claude/commands/`
- `.taskflow/`

## Minimal Workflow

1. Create a task folder:

   ```bash
   ./.taskflow/scripts/new-task.sh TASK-001 login-flow
   ```

2. Fill `00-request.md`.
3. Ask Codex to compress it into `01-packet.md`.
4. Let Codex send only that packet to Claude Code.
5. Let Codex review Claude's work and update `03-review.md`.

## Less-Important DB Layer

Use:

```bash
./.taskflow/scripts/new-db-source.sh analytics
```

This creates a compact DB intake folder for schema notes, safe queries, and future executor packets.
