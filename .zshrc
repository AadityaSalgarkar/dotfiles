# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source secrets (not tracked by dotfiles repo)
if [ -f ~/.zsh_secrets ]; then source ~/.zsh_secrets; else echo "~/.zsh_secrets not found, gdl will not work"; fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git zsh-syntax-highlighting zsh-autocomplete zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function gdl {
    FILE="$1"
    curl -H "Authorization: token $GDL_GITHUB_TOKEN" \
    -H 'Accept: application/vnd.github.v4.raw' \
    -O \
    -L https://api.github.com/repos/adamnemecek/traceoid/contents/papers/"$FILE"

    open "$FILE"
}

alias p='python'
alias c='clear'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# literally the Tab key
bindkey $'\t' autosuggest-accept

. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"

# Function to check if the command ends with ".pdf" and run "gdl" if it fails
function handle_command_failure() {
  if [[ $1 == *.pdf ]]; then
    echo "Command failed. Retrying with 'gdl'..."
    gdl "$1"
  else
    echo "zsh: command not found: $1"
  fi
}

# Hook into command_not_found_handler for zsh
function command_not_found_handler() {
  handle_command_failure "$1"
  return 127  # Return standard "command not found" status code
}
if [ -e $HOME/.bash_aliases ]; then
      source $HOME/.bash_aliases
fi



. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(mcfly init zsh)"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/aaditya/.lmstudio/bin"
# End of LM Studio CLI section


# opencode
export PATH=/Users/aaditya/.opencode/bin:$PATH


# functions
google(){
   gemini -p "Search google for <query>$1</query> and summarize  results"
}
# ~/.zshrc

pip() {
  echo "pip not available, use 'uv pip' instead"
  return 127    # 127 is the standard "command not found" exit code
}
python() {
  echo "python not available, use 'uv run' instead"
  return 127    # 127 is the standard "command not found" exit code
}

# bun completions
[ -s "/Users/aaditya/.bun/_bun" ] && source "/Users/aaditya/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

files_as_text() {
  # If -h or --help is given, show documentation
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    cat <<'EOF'
files_as_text — dump entire code2prompt output to stdout

Usage:
  files_as_text [PATH]

Options:
  -h, --help    Show this help message and exit

Description:
  Runs code2prompt on the given directory (default: current),
  writes the generated prompt to stdout (via /dev/stdout),
  and disables clipboard copying so you can pipe it:
    files_as_text | your_other_command
EOF
    return 0
  fi

  # Otherwise run code2prompt on either the supplied path or "."
  local target="${1:-.}"
  code2prompt --output-file /dev/stdout --no-clipboard "$target"
}

export PATH="$HOME/.local/bin:$PATH"

alias claude="~/.local/bin/claude"
alias s="kitten ssh"

# --WCGW_ENVIRONMENT_START--
if [ -n "$IN_WCGW_ENVIRONMENT" ]; then
 PROMPT_COMMAND='printf "◉ $(pwd)──➤ \r\e[2K"'
 prmptcmdwcgw() { eval "$PROMPT_COMMAND" }
 add-zsh-hook -d precmd prmptcmdwcgw
 precmd_functions+=prmptcmdwcgw
fi
# --WCGW_ENVIRONMENT_END--

alias gpu='nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total --format=csv,noheader,nounits | awk -F", " '\''{printf "Util: %s%% | Temp: %s°C | Mem: %s/%s MiB\n", $1, $2, $3, $4}'\'''


check_gpu() {
    gpu
    echo ""
    echo "PID      Process                      Memory     GPU%"
    echo "-------  --------------------------  --------  ------"
    nvidia-smi --query-compute-apps=pid,process_name,used_memory --format=csv,noheader,nounits 2>/dev/null | while IFS=', ' read -r pid name mem; do
        gpu_pct=$(nvidia-smi pmon -c 1 2>/dev/null | awk -v p="$pid" '$2==p {print $4}' | head -1)
        gpu_pct=${gpu_pct:-"-"}
        name=$(basename "$name" | cut -c1-26)
        printf "%-7s  %-26s  %6s M  %5s%%\n" "$pid" "$name" "$mem" "$gpu_pct"
    done
}

alias ch='check_gpu'
alias gd='git difftool --no-symlinks --dir-diff'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export PATH="$HOME/bin:$PATH"
