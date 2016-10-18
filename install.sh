#!/bin/bash

set -u

export dotfiles=~/.dotfiles

set_link() {
    if [ -e $dotfiles/$@ ]; then
        from=$dotfiles/$@
        to=/home/`whoami`/$@
        command="ln -sf $from $to"
        echo $command
        exec 2>&1 $command &
    fi
}

cleanup() {
    rm ~/.msmtprc
    rm ~/.fonts
    rm ~/.local/share/fonts
    rm ~/.terminfo
    rm ~/.i3
    rm ~/.vim
    rm ~/.mcabber
    rm ~/bin
    rm ~/.Xresources.colors
    rm ~/.ardour-templates
    rm ~/.jack-templates
    rm ~/.guitarix
    rm ~/.mutt
    rm ~/.rack
    rm ~/.icons
    rm ~/.zsh
}

install_i3_config() {
    cp `pwd`/.i3/config.default `pwd`/.i3/config
    cat `pwd`/.i3/config.`cat ~/.workspaces` >> `pwd`/.i3/config
    cat `pwd`/.i3/config.`cat ~/.background` >> `pwd`/.i3/config
}

install() {
    export -f set_link
    git ls-files | grep -E "^\.|^bin" | cut -f1 -d / | uniq | sort | xargs -n1 -I{} bash -c "set_link {}"
}

post_install() {
    ln -sf ~/.fonts ~/.local/share/fonts
    fc-cache -f
    localectl set-locale LANG=en_US.utf8
    sound-setup
    xsetup
}

cleanup
install_i3_config
install
post_install
