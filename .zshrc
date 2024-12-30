if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

bindkey -v # vim mode
# This prevents some laggyness, but makes it harder to do comands like 'dib' with multiple inputs
KEYTIMEOUT=1 # 10ms for key sequences 

bindkey '^r' history-search-backward
bindkey '^f' autosuggest-accept

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive match
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # show options with ls colors
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# oh-my-posh prompt (Don't run in default mac terminal because it doesn't support ANSI characters)
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $HOME/dotfiles/.config/ohmyposh/tokyonight.json)"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

 # Yazi configuration to cd to the directory you were last in when closing yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# Raise file descriptor limit (mongo uses a lot of them)
ulimit -n 64000

## Source Other Files
source ~/.env
source ~/.zshlocal

# Aliases 
alias e="$EDITOR"
alias npm="pnpm"
alias ls="ls -al --color=auto"
alias lg="lazygit"
alias gr='cd $(git rev-parse --show-toplevel)'
alias gu='git reset HEAD~1 --soft'
alias finder="open"

# Zoxide post script
eval "$(zoxide init zsh)"

mdb() {
    mlaunch kill --dir ~/db/data
    rm -r ~/db/data
    mlaunch --replicaset --port 27017 --dir ~/db/data/ --priority
    return 0
}
 
 mdbKill() {
     mlaunch kill --dir ~/db/data
     rm -r ~/db/data
     return 0
 }

