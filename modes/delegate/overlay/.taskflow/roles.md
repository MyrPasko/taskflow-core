# Roles

## Bundle 04

- User gives feature orders and merge decisions.
- Codex owns feature decomposition, task request shaping, plan review, and PR review.
- Claude Code drafts plans, implements tasks on branches, and updates PRs after feedback.

## Handoff Standard

- feature request: user order for Codex
- task request: Codex brief for Claude planning
- task plan: Claude draft until Codex accepts it
- task packet: optional Codex execution compression
- PR: Claude implementation artifact, reviewed by Codex

## Mode Guardrails

- Codex owns decomposition quality
- Claude owns branch-level execution
- merge-ready status comes from Codex review, not Claude self-report
