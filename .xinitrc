#!/bin/bash

xsetup

if [[ `hostname` == "home" ]]; then
    battery-life-checker &
fi

sxhkd &

sudo ~/bin/iptables_tor_setup

exec i3
