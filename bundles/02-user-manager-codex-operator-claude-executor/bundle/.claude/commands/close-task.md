Close task packet `$ARGUMENTS`.

Steps:

1. Re-read `.taskflow/tasks/$ARGUMENTS/01-packet.md`.
2. Verify every acceptance criterion against the actual code.
3. Run the packet's verification commands if they were not run yet.
4. Add a concise outcome note to `.taskflow/tasks/$ARGUMENTS/03-review.md`.
5. If everything is complete, set status to `review` using:
   `./.taskflow/scripts/set-status.sh $ARGUMENTS review`
