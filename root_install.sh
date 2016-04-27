#!/bin/bash

function filenames_to_copy {
	git ls-files `pwd`/rootfs
}

function get_root_related_filename {
	echo $@ | cut -f6- -d "/" | xargs -II echo /I
}

function copy_file {
	from=`pwd`/`cat`
	to=$(get_root_related_filename $from)
	echo sudo cp $from $to
	sudo cp -ruT $from $to
}

for file in $(filenames_to_copy); do
	echo $file | copy_file 2>&1
done
