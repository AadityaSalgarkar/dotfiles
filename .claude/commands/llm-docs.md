---
description: Maintain .llm documentation structure using a subagent (separate context window)
---

Use the Task tool to spawn a maintainer subagent that will update the `.llm` documentation structure for this codebase. This runs in a separate context window to avoid cluttering the main conversation.

User arguments: $ARGUMENTS

Execute the following:

```
Task tool with subagent_type="maintainer"
```

Prompt for the subagent:

---

Analyze and update the `.llm` documentation structure for this codebase. Work systematically through the 9 optimization categories.

## User Request
$ARGUMENTS

If no specific request, perform a full update of all categories.

## Directory Structure to Create/Update

Create `.llm/` in the project root with these subdirectories:

### 1. metadata/
- `file_classification.json` - categorize files as implementation/interface/test
- `dependency_graph.json` - component dependencies in machine-readable format
- `error_patterns.json` - common errors and solutions

### 2. code_index/
- `call_graph.json` - function-to-function relationships
- `type_relationships.json` - type/interface inheritance
- `intent_classification.json` - what each code section does

### 3. debug_history/
- Log files with error→solution pairs
- Categorized by component and error type

### 4. patterns/
- Canonical implementation patterns from this codebase
- Error handling patterns
- Composition patterns

### 5. cheatsheets/
- Quick-reference guides per major component
- Common operations, pitfalls, gotchas

### 6. qa/
- Solved problems indexed by component/file/error type
- Include reasoning used to solve each

### 7. model_docs/
For each major component, create docs with:
- Purpose
- Schema (data structures)
- Patterns (usage patterns)
- Interfaces (public API)
- Invariants (what must remain true)
- Error states

### 8. delta/
- Semantic change logs
- API changes and implications
- Behavior changes not obvious from diffs

### 9. anchors/
- Identify key files needing UUID-based memory anchors
- Add anchor comments with semantic structure

## Output
Return a concise summary of:
- What directories/files were created
- What was updated
- Any issues encountered

---

After receiving the subagent's response, summarize the updates to the user.
