#!/bin/bash

xsetup

screens-setup

if [[ `hostname` == "home" ]]; then
    battery-life-checker &
fi

xclipboard-sync &

exec i3
