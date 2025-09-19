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
