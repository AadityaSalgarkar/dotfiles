#!/bin/bash

# Get working directory from Claude environment or fallback to PWD
WORK_DIR="${CLAUDE_WORKING_DIRECTORY:-${PWD:-$(pwd)}}"

# Check if jj is installed and we're in a jj repository
if ! command -v jj >/dev/null 2>&1; then
    echo "Warning: jj (Jujutsu) is not installed. Skipping checkpoint."
    exit 0
fi

# Check for changes using jj diff and status
JJ_DIFF=$(jj diff --stat 2>&1)
JJ_STATUS=$(jj status --no-pager 2>&1)

# Skip if working copy is clean
if echo "$JJ_STATUS" | grep -q "working copy is clean"; then
    echo "No changes detected. Skipping checkpoint."
    exit 0
fi

# Create checkpoint with timestamp and session ID
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
DESCRIPTION="Code checkpoint - $TIMESTAMP (session: ${CLAUDE_SESSION_ID:-unknown})"
jj new
jj describe -m "$DESCRIPTION"
