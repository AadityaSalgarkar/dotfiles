alias gh-create-repo='repo_name=$(basename "$PWD"); \
    git_user=$(git config --global user.name); \
    echo "Repository Name: $repo_name"; \
    echo "GitHub User: $git_user"; \
    read -q "REPLY?Create a private GitHub repository and push? (y/n) "; echo; \
    if [[ $REPLY =~ ^[Yy]$ ]]; then \
        gh repo create "$repo_name" --private; \
        git remote add origin "git@github.com:$git_user/$repo_name.git"; \
        git push -u origin main; \
        echo "Repository $repo_name created and pushed successfully using SSH."; \
    else \
        echo "Operation canceled."; \
    fi'

uvinit() {
  # Initialize the UV environment.
  echo "Initializing UV virtual environment..."
  uv init && uv venv && source .venv/bin/activate

  # Sync dependencies based on available file.
  if [ -f "pyproject.toml" ]; then
    echo "pyproject.toml found. Syncing dependencies via uv sync..."
    uv sync
  elif [ -f "requirements.txt" ]; then
    echo "requirements.txt found. Installing dependencies..."
		uv add -r requirements.txt
  else
    echo "No dependency file (pyproject.toml or requirements.txt) found; skipping sync."
  fi
}

alias cpv='rsync -ah --info=progress2'

after() {
  if [ "$#" -lt 2 ]; then
    echo "Usage: after <process_pattern> <command...>"
    return 1
  fi
  local pattern="$1"
  shift
  local cmd="$@"
  echo "Waiting for process matching '$pattern' to finish..."
  # Loop until no process matches the pattern.
  while ps -p "$(pgrep -f "$pattern")" > /dev/null 2>&1; do
    sleep 1
  done
  echo "Process finished. Executing: $cmd"
  eval "$cmd"
}

alias mcpconf="vim /Users/aaditya/Library/Application\ Support/Claude/claude_desktop_config.json"
alias act="source .venv/bin/activate"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
alias pandock='docker run --rm --platform=linux/amd64 -v "$(pwd)":/data -u $(id -u):$(id -g) pandoc/extra'
