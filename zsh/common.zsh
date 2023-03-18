#### ZSH SETUP
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export EDITOR="nvim"

fpath=($HOME/.completion_zsh $fpath)

plugins=(
    # vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
    direnv
)

source $ZSH/oh-my-zsh.sh

#### CUSTOM SETTINGS

# need this option for compatibility between git and zsh
export LESS=-FRX

# for z command (cd replacement)
eval "$(zoxide init zsh)"
