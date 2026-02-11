#!/bin/bash
# PreToolUse hook: prepend 'source .macros' to bash commands if .macros exists

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
CWD=$(echo "$INPUT" | jq -r '.cwd // "."')

# Check if .macros exists in cwd
if [ -f "$CWD/.macros" ]; then
    WRAPPED="source .macros 2>/dev/null; $COMMAND"
    jq -n --arg cmd "$WRAPPED" '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "allow", updatedInput: {command: $cmd}}}'
else
    echo '{"hookSpecificOutput": {"hookEventName": "PreToolUse", "permissionDecision": "allow"}}'
fi
