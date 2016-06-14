# vim: ft=zsh

# go
alias gog="go get"
alias gogu="go get -u"
alias goi="go install"
alias gor="go run"
alias gob="go build"

# bash
alias bg="bash get"

# user
alias am=alsamixer
alias bt="acpi"
alias psa="/bin/ps auxf"
alias -g sctl="sudo systemctl"
alias sus="sudo systemctl suspend"
alias yaourt="yaourt --noconfirm"
alias zi="sudo zpool import"
alias ze="sudo zpool export"
alias rr="rm -rf"
alias pwgen="pwgen 12 -y"
alias me="mysql uveliria-idfly-ru -e"
alias ym="./yii migrate"
alias pgrep="pgrep -f -a"
alias pkill="pkill -f"
alias ardour="ardour4"
alias task="python /usr/lib/python3.4/site-packages/t.py --task-dir ~/.tasks --list tasks"
alias t="translator"
alias kill9="kill -9"
alias i="issue"
alias m="mplayer -zoom"
alias rto='rtorrent "$(/usr/bin/ls --color=never -t ~/Downloads/*.torrent | head -n1)"'
alias sw="sudo wifi-menu"
alias ag="ag --hidden"
alias ipa="ip a"
alias sp="sudo pon"
alias spf="sudo poff"
alias pb="pkgbuilds"
alias e="execute-on-hosts"
alias sz="source ~/.zshrc"
alias A="alias"

# pacman
alias ps="sudo pacman -Sy --noconfirm"
alias pss="sudo pacman -S -s"
alias pqs="sudo pacman -Qs"
alias pq="sudo pacman -Q"
alias pqo="pacman -Qo"
alias pr="sudo pacman -R"

# yaourt
alias ys="yaourt -S --noconfirm"
alias yss="yaourt -Ss"

# pkgfile
alias pks="pkgfile -s"

# android tools
alias alc="adb logcat"
alias ad="adb devices"

# |
alias -g EO="2>&1"
alias -g G=" EO | grep"
alias -g L=" EO | less"
alias EN="2>/dev/null"

alias -g C="| cut"
alias -g H="| head"
alias -g T="| tail"
alias -g X="| xargs"
alias -g S="| sort"
alias -g U="| uniq"
alias -g W="| wc"

# dotfiles editing
alias v="vim ~/.vimrc"
alias z="vim ~/.zshrc"
alias za="vim ~/.zsh/zaliases.zsh"
alias vs="vim .vim/plugins/snippets/go.snippets"

# zsh controls
alias h="bindkey L"
bindkey "^U" undo
bindkey "^T" prepend-sudo

# docker
alias d="docker"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dr="docker run -i -t"
alias de="docker exec -i -t"
alias dl="docker logs"
alias dlf="docker logs --follow"
alias da="docker attach --no-stdin"
alias drm="docker rm"
alias dst="docker stop"
alias dbld="docker build -t"

# bitbucket
alias bpr="bitbucket pull-request"

# fastcd
alias vicd="fastcd ~/.vim/plugins/ 1"
alias gocd="fastcd ${GOPATH}/src/ 3"

# sources
source "${HOME}/.zsh/aliases/ssh.zsh"
source "${HOME}/.zsh/aliases/batrak.zsh"
source "${HOME}/.zsh/aliases/ash.zsh"
source "${HOME}/.zsh/aliases/git.zsh"
