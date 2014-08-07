# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.bin:/usr/local/bin:$PATH
export DOTFILES=$HOME/.dotfiles/

alias am=alsamixer
alias gs=gss
export ERLC=erlc
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

alias -g sctl=systemctl
alias gpl="git pull --rebase"
alias gpo="git push origin"

alias ssh='TERM=xterm ssh'
export TERM=rxvt-unicode-256color
