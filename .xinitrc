#!/bin/bash

xsetup

if [[ `hostname` == "home" ]]; then
    battery-life-checker &
fi

sxhkd &

exec i3
