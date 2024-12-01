# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

eval "$(starship init zsh)"

# Vim mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Scripts

# Raise file descriptor limit (mongo uses a lot of them)
ulimit -n 64000

## Source Other Files
source ~/.env
source ~/.zshlocal

# Aliases 
alias cd="z"
alias npm="pnpm"
alias ls="ls -al --color=auto"
alias vim="nvim"
alias finder="open"
alias gr='cd $(git rev-parse --show-toplevel)'
alias gu='git reset HEAD~1 --soft'
alias femu="firebase emulators:start"

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

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
