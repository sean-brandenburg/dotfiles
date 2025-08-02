export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/dotnet
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/usr/local/scripts:$PATH"
export PATH=$GOPATH/bin:$PATH
export PATH=$GOBIN:$PATH

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
alias t="tmux"
alias npm="pnpm"
alias ls="ls -al --color=auto"
alias lg="lazygit"
alias gr='cd $(git rev-parse --show-toplevel)'
alias gu='git reset HEAD~1 --soft'
alias finder="open"
alias sall="source ~/.zshrc && source ~/.zshenv && source ~/.zshlocal"

# To allow for rails to source the cpp headers it needs
alias bundle='CPPFLAGS="-I/opt/homebrew/include" LDFLAGS="-L/opt/homebrew/lib" PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig" bundle'
alias gem='CPPFLAGS="-I/opt/homebrew/include" LDFLAGS="-L/opt/homebrew/lib" PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig" gem'

alias sall="source ~/.zshrc && source ~/.zshenv && source ~/.zshlocal"

# pnpm
export PNPM_HOME="/Users/sean/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source ~/.zshenv
source ~/.env
source ~/.zshlocal
source ~/.zshscripts
