# shell settings
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="daveverwer"
plugins=(git)
source $ZSH/oh-my-zsh.sh
HISTFILE=~/.zsh_history
HISTSIZE=1500
eval $(dircolors ~/.dircolors.$(cat ~/.background))

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# exports
export GOPATH=$HOME/.go
export PATH=$HOME/.bin:/usr/local/bin:$GOPATH/bin:$PATH
export GITHUB=$HOME/sources/github.com
export TERM=rxvt-unicode-256color
export ERLC=erlc
export EDITOR=vim

# go shortcuts
alias gog="go get"
alias goi="go install"
alias gor="go run"
alias gob="go build"

# user shortcuts
alias am=alsamixer
alias t="tree"
alias b="acpi"
alias ps="ps auxf"
alias -g sctl="sudo systemctl"
alias ssh='TERM=xterm ssh'
alias sus="sudo systemctl suspend"
alias yaourt="yaourt --noconfirm"
alias zi="sudo zpool import"
alias ze="sudo zpool export"
alias rr="rm -r"
alias pwgen="pwgen 12"
alias me="mysql uveliria-idfly-ru -e"
alias ym="./yii migrate"

# android tools
alias alc="sudo adb logcat"
alias ad="sudo adb devices"

# pipe shortcuts
alias -g C="| cut"
alias -g G="| grep"
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g X="| xargs"
alias -g S="| sort"
alias -g U="| uniq"
alias -g W="| wc"

# git aliases
alias gi="git init"
alias gcl="git clone"
alias gs="git status -s"
alias gd="git diff"
alias ga="git add"
alias gdc="git diff --cached"
alias gcm="git commit -m"
alias gcmi="git commit -m \"initial commit\""
alias gca="git commit --amend"
alias gsh="git show"
alias gl="git log --graph --decorate --oneline --all"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gplo="git pull --rebase origin"
alias gplos="git stash && git pull --rebase origin && git stash pop"
alias gpl="git pull --rebase"
alias grm="git rm"
alias grs="git reset"
alias gst="git stash"
alias gstp="git stash pop"
alias gr="git remote"
alias grb="git rebase"
alias grbo="git rebase --onto"

# dotfiles editing
alias v="vim ~/.vimrc"
alias z="vim ~/.zshrc"

# zsh controls
alias h="bindkey L"
bindkey "^U" undo
bindkey "^T" prepend-sudo
bindkey "^B" backward-word
#bindkey "^F" forward-word
bindkey '^F' fzf-file-widget

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

function gocd() {
	cd `find $GOPATH/src/ -name "$1*" -type d | head -n 1`
}
