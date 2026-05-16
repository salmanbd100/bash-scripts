# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Running Scripts

```bash
# Run any script directly
bash basic/hello.sh
bash basic/arguments.sh arg1 arg2 arg3
bash input/script.sh
bash logs/analyse-logs.sh

# Run all basic demos
bash basic/run_all.sh
```

No build step, linter, or test suite — scripts run directly with `bash`.

## Repository Structure

- **`basic/`** — Standalone demos of core bash concepts: variables, arguments, conditionals, loops, case statements.
- **`input/`** — Interactive script that reads user input (email/password prompt).
- **`logs/`** — `analyse-logs.sh` scans `*.log` files for `ERROR`, `FATAL`, and `CRITICAL` patterns and writes a report to `log_analysis_report.txt`. Paths are hardcoded to the current machine's absolute path — update `LOG_DIR` and `REPORT_FILE` variables at the top of the script when moving it.
- **`my-script/`** — `cleanup-mac.sh` is a destructive Mac maintenance utility: clears npm/yarn/pnpm caches, VS Code/Cursor/Chrome/Claude/Notion/Warp caches, runs `docker system prune -af`, runs `brew cleanup`, empties Trash, and removes `node_modules`/`.next`/`dist`/`build` folders older than 14 days under `~/Documents`. Run with caution.
