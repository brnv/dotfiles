#!/bin/bash

[[ -f /tmp/autologin ]] && rm /tmp/autologin && exec startx
