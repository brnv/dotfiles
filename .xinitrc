#!/bin/bash

xsetup

if [[ `hostname` == "home" ]]; then
    battery-life-checker &
fi

exec i3
