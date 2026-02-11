#!/bin/bash
# Hook to open plan files in MD_RENDER after Write tool executes

# Read JSON input from stdin
INPUT=$(cat)

# Extract file_path from tool_input using jq
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Check if file is in the plans directory
if [[ "$FILE_PATH" == /Users/aaditya/.claude/plans/* ]]; then
    ~/bin/mdrender "$FILE_PATH" 2>/dev/null &
fi

# Always exit 0 to not block Claude
exit 0
