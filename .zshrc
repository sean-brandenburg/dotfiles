export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/dotnet
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/usr/local/scripts:$PATH"

export DOTNET_ROOT=$HOME/dotnet

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Raise file descriptor limit (mongo uses a lot of them)
ulimit -n 64000

# Aliases 
alias e="$EDITOR"
alias vim="$EDITOR"
alias npm="pnpm"
alias ls="ls -al --color=auto"
alias lg="lazygit"
alias gr='cd $(git rev-parse --show-toplevel)'
alias gu='git reset HEAD~1 --soft'
alias finder="open"

# pnpm
export PNPM_HOME="/Users/sean/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source ~/.env
source ~/.zshlocal
source ~/.zshscripts
