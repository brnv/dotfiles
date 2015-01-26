# shell settings
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="daveverwer"
plugins=(git)
source $ZSH/oh-my-zsh.sh
HISTFILE=~/.zsh_history
HISTSIZE=1500
eval $(dircolors .dotfiles/.dircolors.$(cat .dotfiles/.background))

# exports
export GOPATH=$HOME/.go
export PATH=$HOME/.bin:/usr/local/bin:$GOPATH/bin:$PATH
export DOTFILES=$HOME/.dotfiles
export GITHUB=$HOME/sources/github.com
export TERM=rxvt-unicode-256color
export ERLC=erlc
export EDITOR=vim

# user shortcuts
alias am=alsamixer
alias t="tree"
alias b="acpi"
alias ps="ps auxf"
alias -g sctl=systemctl
alias ssh='TERM=xterm ssh'

# pipe shortcuts
alias -g C="| cut"
alias -g G="| grep"
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"

# git aliases
alias gcl="git clone"
alias gs="git status -s"
alias gd="git diff"
alias ga="git add"
alias gdc="git diff --cached"
alias gcm="git commit -m"
alias gsh="git show"
alias gl="git log --graph --decorate --oneline --all"
alias gpo="git push origin"
alias gplo="git pull --rebase origin"
alias gpl="git pull --rebase"
alias grm="git rm"
alias gr="git reset"

# dotfiles editing
alias v="vim ~/.vimrc"
alias z="vim ~/.zshrc"

# zsh controls
alias h="bindkey L"
bindkey "^U" undo
bindkey "^T" prepend-sudo
bindkey "^B" backward-word
bindkey "^F" forward-word

# custom widgets
zle -N prepend-sudo prepend_sudo
function prepend_sudo() {
	if [ "$BUFFER" ]; then
		BUFFER="sudo "$BUFFER
	else
		BUFFER="sudo "$(fc -ln -1)
	fi
	CURSOR=$(($CURSOR+5))
}

zle -N word-prepend-dot-slash word_prepend_dot_slash
function word_prepend_dot_slash() {
	# todo
}

# Go android Tlen
alias gar="cd $GOPATH/src/github.com/seletskiy/go-android-rpc/"
alias tlen="cd $GOPATH/src/github.com/gophergala/tlen/"
alias alc="sudo adb logcat"
alias ad="sudo adb devices"
