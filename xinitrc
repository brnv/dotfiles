#!/bin/bash
urxvtd -q -o -f &
~/.xsetup

if [[ home = `hostname` ]]; then
	sudo dhcpcd enp2s0
fi

if [[ work = `hostname` ]]; then
	sudo dhcpcd eth0
fi

exec i3
