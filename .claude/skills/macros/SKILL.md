---
name: macros
description: Use proactively when about to run bash commands with 3+ pipes/flags, long Python snippets, or any command you expect to repeat. Creates reusable shell functions in .macros to save tokens and reduce errors.
---

# Reusable Bash Macros

Create reusable bash functions to save tokens and reduce errors when running complex or repeated commands.

## Auto-Sourcing

A PreToolUse hook automatically sources `.macros` before each Bash command when the file exists in the current directory. No manual sourcing needed after initial setup.

## Initialization

Before creating macros, initialize the macros file:
```bash
touch .macros
```

## When to Create a Macro

- A command has 3+ pipes or flags
- You need to run similar commands with different parameters
- A Python snippet needs to be run repeatedly

## Creating a Bash Macro

Use this pattern to add macros (avoids duplicates):
```bash
type FUNCNAME &>/dev/null || cat >> .macros << 'EOF'
# FUNCNAME [args] - description
FUNCNAME() {
  local arg="${1:-default}"
  # command here
}
EOF
```

Guidelines:
1. **Sensible Defaults**: Use `${1:-default}` pattern for optional args
2. **Short Names**: 2-5 chars (e.g., `gsc`, `tailj`, `pscores`)
3. **Brief Comment**: One-line usage hint above function

## Creating a Python Macro

Wrap Python operations in shell functions using `uv run`:
```bash
type FUNCNAME &>/dev/null || cat >> .macros << 'FUNC'
# FUNCNAME [args] - description
FUNCNAME() {
  uv run --with DEPS python3 << EOF
# python code here using ${1:-default} for args
EOF
}
FUNC
```

## Important Rules

- Use quoted heredoc (`<< 'EOF'`) to prevent premature variable expansion
- Use `type funcname &>/dev/null || ...` to avoid duplicates
- Hook auto-sources on each command, so manual re-sourcing is optional

## Instructions

When the user asks to create a macro or you identify a repeated complex command:

1. First ensure macros file is initialized
2. Create the function following the patterns above
3. Source the file to make it available
4. Test the macro works

$ARGUMENTS - Optional: description of what macro to create
