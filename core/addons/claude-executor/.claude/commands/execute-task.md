Execute task packet `$ARGUMENTS`.

Steps:

1. Read `CLAUDE.md`.
2. Read `.taskflow/tasks/$ARGUMENTS/01-packet.md`.
3. Read only the files listed in `Allowed Context`, plus immediately adjacent files if strictly required.
4. Implement exactly the packet.
5. Update `.taskflow/tasks/$ARGUMENTS/02-notes.md` with short delta notes.
6. Update `.taskflow/tasks/$ARGUMENTS/03-review.md` with verification and risks.
7. Stop after finishing this one task.
