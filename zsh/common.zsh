export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export EDITOR="if [ -z '$NVIM' ]; then nvim '$@'; else  nvr --remote-wait; fi"

fpath=($HOME/.completion_zsh $fpath)

plugins=(
    kubectl-autocomplete
    poetry
    fzf
    git
    docker
    ripgrep
    virtualenv
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

# prevent nested nvim sessions
vim() {
    if [ -z "$NVIM" ]; then
        nvim "$@"
    else
        nvr "$@"
    fi
}
