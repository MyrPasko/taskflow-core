# Bundle 03: Codex Operator + Claude Executor

This bundle is for the mode where:

- Codex owns intake, architecture shaping, packet design, and review.
- Claude Code executes the packet.
- User intervenes mainly for approvals, business clarifications, and final direction.

The bundle is optimized for low token use:

- one task per execution
- one compact packet as the executor's source of truth
- Codex dispatches Claude with exact-file context only
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

2. Write a short request in `00-request.md`.
3. Let Codex shape the work in `01-plan.md`.
4. Let Codex produce `02-packet.md`.
5. Let Codex dispatch Claude from that packet.
6. Let Codex review and either close or re-scope the task.

## Less-Important DB Layer

Use:

```bash
./.taskflow/scripts/new-db-source.sh analytics
```

This creates a compact DB intake folder for schema notes, safe queries, and future executor packets.
