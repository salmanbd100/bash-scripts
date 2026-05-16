# Bash Scripts

This repository contains a collection of simple bash scripts that demonstrate basic concepts of shell scripting.

## Scripts

### `basic/`

This directory contains scripts that cover fundamental bash concepts.

*   **`hello.sh`**: Prints "Hello, World" and the current date.
*   **`arguments.sh`**: Demonstrates how to use command-line arguments.
*   **`condition.sh`**: Shows how to use conditional statements (`if`, `elif`, `else`).
*   **`for_loop.sh`**: An example of a `for` loop.
*   **`while_loop.sh`**: An example of a `while` loop.
*   **`case_statements.sh`**: Demonstrates the use of `case` statements.
*   **`run_all.sh`**: A script that runs other scripts.

### `input/`

*   **`script.sh`**: Interactive login script that prompts for email and password.

### `logs/`

*   **`analyse-logs.sh`**: Log analysis script that searches for error patterns in log files and generates a report.

## How to Run

### Basic Scripts

To run any of the basic scripts, navigate to the `basic` directory and use the `bash` command:

```bash
cd basic
bash <script_name>.sh
```

For example:
```bash
cd basic
bash hello.sh
bash arguments.sh arg1 arg2 arg3
```

### Input Scripts

To run the interactive login script:

```bash
cd input
bash script.sh
```

### Log Analysis Script

To run the log analysis script:

```bash
cd logs
bash analyse-logs.sh
```

Note: Make sure you have log files (*.log) in the logs directory before running the analysis script.

## General Usage

You can also run scripts from the root directory by specifying the full path:

```bash
bash basic/hello.sh
bash input/script.sh
bash logs/analyse-logs.sh
```

---

## Formatting Code in VS Code

This repo uses [Beautysh](https://github.com/lovesegfault/beautysh) to format shell scripts.

### Setup

1. Install the [Beautysh](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-beautysh) VS Code extension, or install the formatter globally:
   ```bash
   pip install beautysh
   ```

2. Add the following to your VS Code `settings.json` (open with `Cmd+Shift+P` → "Open User Settings (JSON)"):
   ```json
   {
     "[shellscript]": {
       "editor.defaultFormatter": "ryanluker.vscode-beautysh",
       "editor.formatOnSave": true
     }
   }
   ```

3. To format a file manually: `Shift+Alt+F` (or `Shift+Option+F` on Mac).

4. To format all scripts at once from the terminal:
   ```bash
   beautysh **/*.sh
   ```

> The pre-commit hook in `.pre-commit-config.yaml` also runs Beautysh automatically before each commit.

---

## Standards for Writing New Scripts

Follow these conventions when adding a new script to this repo.

### File naming

- Use lowercase with hyphens: `my-script.sh`, `analyse-logs.sh`
- Be descriptive — the filename should convey what the script does

### Header

Every script must start with:

```bash
#!/bin/bash
```

### Variables

- Use `UPPER_SNAKE_CASE` for constants and environment-level variables
- Use `lower_snake_case` for local/loop variables
- Always quote variables to prevent word splitting: `"$VAR"`, `"$1"`

```bash
LOG_DIR="/path/to/logs"
for file in "$LOG_DIR"/*.log; do
    echo "Processing $file"
done
```

### Functions

- Name functions with `lower_snake_case`
- Keep functions short and single-purpose
- Declare local variables with `local`

```bash
print_greeting() {
    local name="$1"
    echo "Hello, $name"
}
```

### Error handling

- Exit on errors and unset variables at the top of every script:

```bash
set -euo pipefail
```

- Use `echo "Error: ..." >&2; exit 1` to surface meaningful failures

### Directory placement

| Type of script | Directory |
|---|---|
| Core concept demos | `basic/` |
| Interactive / user input | `input/` |
| Log processing | `logs/` |
| System maintenance | `my-script/` |

Create a new directory only if the script doesn't fit any existing category.
