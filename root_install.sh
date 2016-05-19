#!/bin/bash

set -u

dotfiles=~/.dotfiles
hostname=`hostname`
dryrun=false

while getopts "r" key; do
    case "$key" in
        r)
            dryrun=true
            ;;
    esac
done

git-ls-files() {
    local dir=$1
    local gitdir=${2:-$dotfiles}
    local files=$(git --git-dir=$gitdir/.git ls-files "$dir")

    for file in $files; do
        file=$gitdir/$file

        if [ $(is-git-submodule $file) ]; then
            git-ls-files "" $file
        else
            echo $file
        fi
    done
}

is-git-submodule() {
    local dir=$1

    if [ -d $dir ] && [ -f $dir/.git ]; then
        echo 1
    else
        echo
    fi
}

remove-rootfs-prefix() {
    local file=$1
	sed 's/.*rootfs//' <<< $file
}

remove-hostname() {
    local file=$1
	sed -e "s/\.home$//" -e "s/\.work$//" <<< $file
}

format-root-file() {
    local file=$1

    file=$(remove-rootfs-prefix $file)
    file=$(remove-hostname $file)
    echo $file
}

should-copy() {
    local file=$1

    if [[ $file != *work ]] && [[ $file != *home ]]; then
        echo 1
    elif [[ $file == *"$hostname" ]]; then
        echo 1
    else
        echo
    fi
}

copy() {
	local source=$1
	local dest=$(format-root-file $source)

    echo sudo cp -ruT $source $dest

    if ! $dryrun; then
        sudo cp -ruT $source $dest
    fi
}

remove() {
    local file=$(format-root-file $1)

    echo sudo rm -rf $file

    if ! $dryrun; then
        sudo rm -rf $file
    fi
}

clear() {
    for file in $(git-ls-files rootfs); do
        remove $file
    done
}

install() {
    for file in $(git-ls-files rootfs); do
        if [ $(should-copy $file) ]; then
            copy $file
        fi
    done
}

if $dryrun; then
    echo list of commands to be executed
fi

clear

install
