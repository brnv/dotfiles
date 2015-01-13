#!/bin/bash

function set_link {
	if [ -e $DOTFILES/$@ ]; then
		FROM=$DOTFILES/$@
		TO=/home/`whoami`/$@
		COMMAND="ln -sf $FROM $TO"
		echo $COMMAND
		exec 2>&1 $COMMAND &
	fi
}

function cleanup {
	rm ~/.msmtprc
	rm ~/.fonts
	rm ~/.local/share/fonts
	rm ~/.terminfo
	rm ~/.i3
	rm ~/.vimrc
	rm ~/.vim
	rm ~/.mcabber
	rm ~/.muttrc
	rm ~/.bin
	rm ~/.Xresources.colors
}

function pre_install {
	if [[ ! -e $HOME/.oh-my-zsh ]]; then
	    git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
	fi
}

function install_i3_config {
	cp `pwd`/.i3/config.default `pwd`/.i3/config
	cat `pwd`/.i3/config.`hostname` >> `pwd`/.i3/config
}

function install {
	export -f set_link
	git ls-files | grep -Ev "^\w.*" | cut -f1 -d / | uniq | sort | xargs -n1 -I{} bash -c "set_link {}"
}

function post_install {
	ln -sf ~/.fonts ~/.local/share/fonts
	fc-cache -f
	localectl set-locale LANG=en_US.utf8
	xsetup
}

cleanup
pre_install
install_i3_config
install
post_install

echo done
