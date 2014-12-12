ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.bin:/usr/local/bin:$PATH
export DOTFILES=$HOME/.dotfiles
export GITHUB=$HOME/sources/github.com
export TERM=rxvt-unicode-256color
export ERLC=erlc
export EDITOR=vim

alias am=alsamixer
alias -g sctl=systemctl
alias ssh='TERM=xterm ssh'
alias ps="ps auxf"

alias gs=gss
alias gl="git log --graph --decorate --oneline --all"
alias gaa="git add --all"
alias gpo="git push origin"
alias gpl="git pull --rebase"
alias gpff="git pull --ff-only"
alias gplo="git pull --rebase origin"
alias gd="git diff"
alias gdc="git diff --cached"

HISTFILE=~/.zsh_history
HISTSIZE=1500
SAVEHIST=1500

zle -N prepend-sudo prepend_sudo
bindkey "^T" prepend-sudo
function prepend_sudo() {
	if [ "$BUFFER" ]; then
		BUFFER="sudo "$BUFFER
	else
		BUFFER="sudo "$(fc -ln -1)
	fi
	CURSOR=$(($CURSOR+5))
}

eval $(dircolors $DOTFILES/dircolors.$(cat $DOTFILES/background))
