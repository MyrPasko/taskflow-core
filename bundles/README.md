# Execution Bundles

`bundles/` now exists as a compatibility surface only.

The shared workflow logic lives in:

- `core/`
- `modes/`
- `core/addons/claude-executor/`
- `scripts/install-mode.sh`

Each bundle directory should contain only:

- a short README
- an `install.sh` wrapper that points at `scripts/install-mode.sh`

Do not treat `bundles/` as the source layout for packet rules, mode behavior, or DB intake logic.
