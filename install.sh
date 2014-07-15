#!/bin/bash

function set_link {
	if [ -e `pwd`/$@ ]; then
		FROM=`pwd`/$@
		TO=/home/`whoami`/.$@
		COMMAND="ln -sf $FROM $TO"
		echo $COMMAND
		exec 2>&1 $COMMAND &
	fi
}

set_link gitconfig

set_link xinitrc
set_link xsetup
set_link Xresources
set_link Xresources.light
set_link Xresources.dark

rm ~/.fonts
set_link fonts
fc-cache -rf

rm ~/.terminfo
set_link terminfo

cp `pwd`/i3/config.default `pwd`/i3/config
cat `pwd`/i3/config.`hostname` >> `pwd`/i3/config
rm ~/.i3
set_link i3

ln -sf ./i3/status.`hostname` ./i3status.conf
set_link i3status.conf

set_link zshrc

rm ~/.vimrc
set_link vimrc

mkdir -p `pwd`/vim/bundle/
if [[ ! -e `pwd`/vim/bundle/vundle ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git `pwd`/vim/bundle/vundle
fi
rm ~/.vim
set_link vim

#TODO user input for passwords/hosts/etc && pattern substitution for next files
mkdir -p `pwd`/mcabber/histo
rm ~/.mcabber
set_link mcabber

rm ~/.muttrc
set_link muttrc

rm ~/.msmtprc
set_link msmtprc

# all is done
echo installation done
~/.xsetup
