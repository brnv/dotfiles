source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh
    zgen load seletskiy/zsh-ssh-urxvt
    zgen load seletskiy/zsh-context-aliases
    zgen load kovetskiy/zsh-fastcd
    zgen load seletskiy/zsh-hijack
    zgen load seletskiy/zsh-autosuggestions
    zgen load seletskiy/zsh-syntax-highlighting

    zgen save
fi

plugins=(git)

if [ `cat ~/.background` = 'dark' ]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'
else
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'
fi


HISTFILE=~/.zsh_history
HISTSIZE=1500
eval $(dircolors ~/.dircolors.$(cat ~/.background))

[ -f /etc/profile.d/fzf.zsh ] && source /etc/profile.d/fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# exports
export GOPATH=$HOME/.go
export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.dotfiles/deadfiles/bin:$PATH
export GITHUB=$HOME/sources/github.com
export TERM=rxvt-unicode-256color
export ERLC=erlc
export EDITOR=vim

source ~/.zaliases

#ZSH_THEME="daveverwer"
PROMPT='%{$fg[red]%}%m%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %(!.#.$) '
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

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
