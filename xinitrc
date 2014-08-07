#!/bin/bash
~/.xsetup

if [[ home = `hostname` ]]; then
	sudo dhcpcd enp2s0
fi

if [[ work = `hostname` ]]; then
	sudo dhcpcd eth0
fi

localectl set-locale LANG=en_US.utf8
localectl set-keymap ru

exec i3
