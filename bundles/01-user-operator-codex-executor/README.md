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

2. Fill `00-request.md`.
3. Distill it into `01-plan.md` and then `02-packet.md`.
4. Ask Codex to execute the task from that packet only.
5. Let Codex update `03-notes.md`.
6. Review outcome in `04-review.md`.

## Less-Important DB Layer

Use:

```bash
./.taskflow/scripts/new-db-source.sh analytics
```

This creates a compact DB intake folder for schema notes, safe queries, and future executor packets.
