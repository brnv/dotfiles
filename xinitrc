#!/bin/bash
urxvtd -q -o -f &
~/.xsetup

if [[ home = `hostname` ]]; then
	sudo dhcpcd enp2s0
fi

if [[ work = `hostname` ]]; then
	sudo dhcpcd eth0
fi

localectl set-locale LANG=en_US.utf8
localectl set-keymap "us, ru"
localectl set-x11-keymap "us, ru -option grp:caps_toggle"

exec i3
