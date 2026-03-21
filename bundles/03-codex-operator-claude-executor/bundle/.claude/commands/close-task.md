Close task packet `$ARGUMENTS`.

Steps:

1. Re-read `.taskflow/tasks/$ARGUMENTS/01-packet.md`.
2. Check each acceptance criterion against the code.
3. Run the verification commands from the packet.
4. Add a concise review note to `.taskflow/tasks/$ARGUMENTS/03-review.md`.
5. If complete, set status to `review`:
   `./.taskflow/scripts/set-status.sh $ARGUMENTS review`
