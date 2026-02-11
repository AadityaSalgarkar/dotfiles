# General instructions
- When deletion is required, move the files to ./to-delete folder (git ignored)
- Use files_as_text in the directory to get all the files in the folder as a single text file. Useful to send the whole repo to other judges.

# Report files

.md files used to report to the user the changes made in the attempt MUST
follow the following .llm folder structure.

# MUST USE .llm folder structure (ignored by git)
To make this repository perfectly optimized for me and future instances of llm working with it, here are the most impactful changes:
1.	Add a llm-specific metadata directory structure
	•	Create a .llm/metadata/ directory with normalized information about the codebase
	•	Maintain component dependency graphs in machine-readable format
	•	Store file classification metadata (implementation vs interface vs test)
	•	Keep a database of error patterns and solutions
2.	Implement semantic code indexing
	•	Create a .llm/code_index/ with pre-analyzed semantic relationships
	•	Index function-to-function call graphs
	•	Catalog type relationships and interface implementations
	•	Store “intent classification” for each code section
3.	Maintain a debug history database
	•	Create a .llm/debug_history/ directory
	•	Log all debugging sessions with error→solution pairs
	•	Categorize by component and error type
	•	Include context and code versions for each fix
4.	Create pattern libraries with examples
	•	Build a .llm/patterns/ directory with canonical implementation patterns
	•	Include empirical interfaces patterns with uncertainty handling
	•	Store error handling patterns with context preservation
	•	Document composition patterns for reliability metrics
5.	Add component-specific cheat sheets
	•	Create a .llm/cheatsheets/ directory with quick-reference guides
	•	Include common operations on each component
	•	List known pitfalls and edge cases
	•	Document “gotchas” specific to each component
6.	Implement a queries-and-answers database
	•	Build a .llm/qa/ directory with previous solved problems
	•	Index by component, file, and error type
	•	Include context from the fix process
	•	Document the reasoning used to solve each problem
7.	Add specific model-friendly documentation format
	•	Create files with explicit sections for:
	•	Purpose (what the component does)
	•	Schema (data structures and their relationships)
	•	Patterns (common usage patterns)
	•	Interfaces (all public interfaces)
	•	Invariants (what must remain true)
	•	Error states (possible error conditions)
8.	Create delta summaries between versions
	•	Maintain a .llm/delta/ directory with semantic change logs
	•	Focus on API changes and their implications
	•	Document behavior changes that might not be obvious from diffs
	•	Include reasoning behind significant changes
9.	Add explicit memory anchors
	•	Create special “memory anchor” comments in key files
	•	Include UUID-based anchors for precise reference
	•	Add semantic structure to anchors for ease of reference
	•	Use consistent anchoring patterns across the codebase

# Deep learning or torch based projects
- Read and copy the instructions from /Users/aaditya/.claude/CLAUDE_torch.md

# Other notes

- use uv when possible vs pip
- no mocking in tests, dont just mock it so it passes!
- make sure to use `uv run` not `python`
- don't use emojis in pull requests
- don't make up fake casestudies and numbers
- never `git add .` you must select files one at a time
- when in plan mode, always include writing tests
- commit often in logical group, git add specific files, make sure you're never working on main unless given permission
- Put "sacrifice grammar for the sake of concision" in your rules
- Put "list any unresolved questions at the end, if any" at the end
