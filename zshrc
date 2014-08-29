ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.bin:/usr/local/bin:$PATH
export DOTFILES=$HOME/.dotfiles/
export GITHUB=$HOME/sources/github.com
export TERM=rxvt-unicode-256color
export ERLC=erlc
export EDITOR=vim

alias am=alsamixer
alias gs=gss
alias -g sctl=systemctl
alias gpl="git pull --rebase"
alias gplo="git pull --rebase origin"
alias gpo="git push origin"
alias ssh='TERM=xterm ssh'

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
