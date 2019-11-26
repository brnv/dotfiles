#!/bin/bash

set -x

exec >/tmp/log 2>&1

xsetup
sxhkd &
exec i3
