#!/bin/bash
set -euo pipefail

# PreToolUse hook that sends all bash commands to tmux sessions
# Sessions are named based on cwd hash for reusability

# Function to output JSON and exit
output_json() {
    local decision="$1"
    local cmd="${2:-}"
    local reason="${3:-}"

    if [ "$decision" = "allow" ]; then
        jq -n --arg cmd "$cmd" \
            '{permissionDecision: "allow", updatedInput: {command: $cmd}}'
    else
        jq -n --arg reason "$reason" \
            '{permissionDecision: "deny", denialReason: $reason}'
    fi
    exit 0
}

# Check dependencies
if ! command -v jq >/dev/null 2>&1; then
    echo '{"permissionDecision":"deny","denialReason":"jq not found"}' >&1
    exit 0
fi

if ! command -v tmux >/dev/null 2>&1; then
    echo '{"permissionDecision":"deny","denialReason":"tmux not found"}' >&1
    exit 0
fi

# Read and parse input
input=$(cat)

# Extract fields from JSON input
cwd=$(echo "$input" | jq -r '.cwd // empty')
command=$(echo "$input" | jq -r '.tool_input.command // empty')

# Validate required fields
if [ -z "$cwd" ] || [ -z "$command" ]; then
    output_json "deny" "" "Invalid hook input: missing cwd or command"
fi

# Fallback to /tmp if cwd doesn't exist
if [ ! -d "$cwd" ]; then
    cwd="/tmp"
fi

# Generate session name from cwd hash
# Use SHA256 hash, take first 8 characters
session_hash=$(printf '%s' "$cwd" | shasum -a 256 | cut -c1-8)
session_name="claude-${session_hash}"

# Ensure tmux session exists
if ! tmux has-session -t "$session_name" 2>/dev/null; then
    # Create new session in detached mode with specified cwd
    if ! tmux new-session -d -s "$session_name" -c "$cwd" 2>/dev/null; then
        output_json "deny" "" "Failed to create tmux session: $session_name"
    fi
fi

# Escape single quotes in command for tmux send-keys
# Replace ' with '"'"' to break out of single quotes, add escaped quote, re-enter single quotes
escaped_command=$(printf '%s' "$command" | sed "s/'/'\\\\''/g")

# Build wrapped command that:
# 1. Sends the original command to tmux session
# 2. Waits briefly for command to complete (0.2 seconds)
# 3. Captures the pane output
wrapped_command="tmux send-keys -t '$session_name' '$escaped_command' Enter && sleep 0.2 && tmux capture-pane -t '$session_name' -p"

# Return approval with modified command
output_json "allow" "$wrapped_command"
