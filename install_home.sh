#!/bin/bash

function set_link {
	if [ -e $DOTFILES/$@ ]; then
		FROM=$DOTFILES/$@
		TO=/home/`whoami`/.$@
		COMMAND="ln -sf $FROM $TO"
		echo $COMMAND
		exec 2>&1 $COMMAND &
	fi
}

if [[ ! -e $HOME/.oh-my-zsh ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

if [[ ! -e `pwd`/vim/bundle/vundle ]]; then
	mkdir -p `pwd`/vim/bundle/
    git clone https://github.com/gmarik/Vundle.vim.git `pwd`/vim/bundle/vundle
fi

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

cp `pwd`/i3/config.default `pwd`/i3/config
cat `pwd`/i3/config.`hostname` >> `pwd`/i3/config
ln -sf ./i3/status.`hostname` ./i3status.conf

export -f set_link
git ls-files | cut -f1 -d / | uniq | sort | xargs -n1 -I{} bash -c "set_link {}"

ln -sf ~/.fonts ~/.local/share/fonts
fc-cache -f

if [[ home = `hostname` ]]; then
	if [[ -e /dev/video1 ]]; then
		echo -n '3-5' | sudo tee /sys/bus/usb/drivers/usb/unbind
		sudo ln -sf /dev/video1 /dev/video0
	fi
fi

localectl set-locale LANG=en_US.utf8

~/.xsetup
echo done
