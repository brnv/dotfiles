#!/bin/bash

xsetup

screens-setup

if [[ `hostname` == "home" ]]; then
    battery-life-checker &
fi

exec i3
