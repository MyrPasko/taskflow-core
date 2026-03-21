# Bundle 01: User Operator + Codex Executor

This bundle is for the mode where:

- You own management, task intake, architecture, and review.
- Codex executes exactly the prepared packet.

The bundle is optimized for low token use:

- one task per execution
- one compact packet as the executor's source of truth
- no repo-wide scanning by default
- delta-only notes after execution

## Install

```bash
./install.sh /absolute/path/to/target-project
```

## What Gets Installed

- `AGENTS.md`
- `.taskflow/`

## Minimal Workflow

1. Create a task folder:

   ```bash
   ./.taskflow/scripts/new-task.sh TASK-001 login-flow
   ```

2. Fill `00-request.md` and then compress it into `01-packet.md`.
3. Ask Codex to execute the task from that packet only.
4. Let Codex update `02-notes.md`.
5. Review outcome in `03-review.md`.

## Less-Important DB Layer

Use:

```bash
./.taskflow/scripts/new-db-source.sh analytics
```

This creates a compact DB intake folder for schema notes, safe queries, and future executor packets.
