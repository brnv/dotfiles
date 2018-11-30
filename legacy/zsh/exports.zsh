export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.dotfiles/deadfiles/bin:$PATH
export GITHUB=$HOME/sources/github.com
export TERM=screen-256color
export ERLC=erlc
export EDITOR=vim
export BACKGROUND=`cat ~/.background`
export BROWSER=i3-sensible-browser

if ! [ -z $TMUX ] && [ -z $TMUX_ID ]; then
    export TMUX_ID=$(tmux display-message -p "#S")
fi
