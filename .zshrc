source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh
    zgen load seletskiy/zsh-ssh-urxvt
    zgen load seletskiy/zsh-context-aliases
    zgen load kovetskiy/zsh-fastcd
    zgen load seletskiy/zsh-hijack
    zgen load seletskiy/zsh-autosuggestions
    zgen load seletskiy/zsh-syntax-highlighting
    zgen load kovetskiy/zsh-smart-ssh

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

source "${HOME}/.zsh/exports.zsh"

context-aliases:init
source "${HOME}/.zsh/sources.zsh"

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

jira-issue-create-schedule-current() {
    local label_date=$(date +'%Y-%B' | tr '[:upper:]' '[:lower:]')
    jira-issue-create -l schedule -l $label_date "$@"
}

jira-issue-create-schedule-next() {
    local label_date=$(date +'%Y-%B' --date='next month' \
        | tr '[:upper:]' '[:lower:]')
    jira-issue-create -l schedule -l $label_date "$@"
}
