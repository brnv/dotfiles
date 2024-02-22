#!/bin/bash

set -x

exec >/tmp/log 2>&1

env-setup

exec i3
