# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/sean/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/sean/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/sean/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/sean/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Path to your oh-my-zsh installation.
export ZSH="/Users/sean/.oh-my-zsh"

ZSH_THEME="spaceship"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source ~/.env

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
# Vim mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

eval "$(op completion zsh)"; compdef _op op

# Aliases 
alias ls="ls -al --color=auto"
alias finder="open"
alias femu="firebase emulators:start"
alias vim="nvim"
alias npm="pnpm"

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
