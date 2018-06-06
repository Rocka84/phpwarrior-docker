#!/bin/bash

profile_dir="$(realpath "$HOME")/phpwarrior"
if [ "$1" == "-d" ]; then
	shift
	profile_dir="$1"
fi

if [ ! -d "$profile_dir" ]; then
	echo "The profile directory does not exist, would you like to create it? [Yn]"
	read -n 1 -s answer
	if [ "$answer" == "n" ] || [ "$answer" == "N" ]; then
		echo "Unable to continue without directory."
		exit 1
	fi
	mkdir -p "$profile_dir"
fi

pwd="$(realpath "$PWD")"
rel_pwd="${pwd##$profile_dir/}"

working_dir="/"
[ "$rel_pwd" != "$pwd" ] && working_dir="/phpwarrior/${rel_pwd}" 

exec docker run --rm \
	-v "$profile_dir":/phpwarrior \
	-w "$working_dir" \
	-it rocka84/phpwarrior-docker:latest 
