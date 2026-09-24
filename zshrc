# ------------------------------
# Zinit Plugin Manager Setup
# ------------------------------

# Define where Zinit will store itself and its plugins.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if it’s not already installed.
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# ------------------------------
# Themes and Plugins via Zinit
# ------------------------------

# Starship prompt (minimal and fast)
zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Syntax highlighting, completions, autosuggestions, and fzf-tab for fuzzy completion
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load zsh completion system
autoload -Uz compinit && compinit

# Common Oh-My-Zsh snippets (git aliases, sudo shortcuts, command-not-found helper)
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# ------------------------------
# Keybindings
# ------------------------------
bindkey -e                     # Use emacs-style keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# ------------------------------
# History Configuration
# ------------------------------
HISTSIZE=5000                  # Max number of lines kept in memory
HISTFILE=~/.zsh_history        # File where history is stored
SAVEHIST=$HISTSIZE
setopt appendhistory           # Append to history file instead of overwriting
setopt sharehistory            # Share history between sessions
setopt hist_ignore_space       # Ignore commands starting with a space
setopt hist_ignore_all_dups    # Remove all older duplicates
setopt hist_save_no_dups       # Don’t save duplicates in history file
setopt hist_ignore_dups        # Ignore duplicate commands
setopt hist_find_no_dups       # Don’t show duplicate matches during search

# ------------------------------
# Completion Styling
# ------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# ------------------------------
# Aliases
# ------------------------------
alias ip='ip -c'
alias lsd="lsd -F"
alias ls="lsd -F"

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias python="python3"
alias bat="batcat"
alias vim="nvim"

# ------------------------------
# FZF Keybindings and Autocomplete
# ------------------------------

# Make sure you have installed fzf with:
#   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#   ~/.fzf/install

autoload -U +X bashcompinit && bashcompinit
export PATH="$PATH:$HOME/packer/"

# pipx-managed CLIs (uv, uvx, pipx, ruff, netlab) — must be on PATH before
# the uv/uvx completion hooks below
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
  eval "$(uvx --generate-shell-completion zsh)"
fi

# fzf key bindings and fuzzy completion. `fzf --zsh` needs fzf >= 0.48;
# older Ubuntu builds fall back to the bundled scripts.
if fzf --zsh >/dev/null 2>&1; then
  source <(fzf --zsh)
elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/completion.zsh
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

eval "$(register-python-argcomplete pipx)"
