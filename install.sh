#!/bin/bash

export dotfiles=~/.dotfiles

function set_link {
    if [ -e $dotfiles/$@ ]; then
        from=$dotfiles/$@
        to=/home/`whoami`/$@
        command="ln -sf $from $to"
        echo $command
        exec 2>&1 $command &
    fi
}

function cleanup {
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
}

function install_i3_config {
    cp `pwd`/.i3/config.default `pwd`/.i3/config
    cat `pwd`/.i3/config.`hostname` >> `pwd`/.i3/config
}

function install {
    export -f set_link
    git ls-files | grep -E "^\.|^bin" | cut -f1 -d / | uniq | sort | xargs -n1 -I{} bash -c "set_link {}"
}

function post_install {
    ln -sf ~/.fonts ~/.local/share/fonts
    fc-cache -f
    localectl set-locale LANG=en_US.utf8
    xsetup
    screens-setup
    sound-setup
    i3-msg restart
}

cleanup
install_i3_config
install
post_install

echo done
