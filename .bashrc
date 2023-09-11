alias vi=nvim
alias today="date +'%Y-%m-%d'"
alias yesterday="date -j -v -1d +'%Y-%m-%d'"
alias cdcasmo=$HOME/diegocasmo
alias cddotfiles=$HOME/.dotfiles
alias weather="curl wttr.in/Alto+Boquete"

# Git aliases
alias gs="git status"
alias gl="git log"
alias gd="git diff"
alias gdh="gd HEAD^ HEAD"

. $(brew --prefix nvm)/nvm.sh

alias mux="tmuxinator"
export EDITOR='vim'
export TERM=xterm-256color

export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH=~/.asdf/shims:$PATH

# Load local commands if any
[[ -a ~/.localrc ]] && source ~/.localrc
