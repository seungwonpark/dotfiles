#!/usr/bin/env bash

create_symlinks() {
    gln -rsf vim/.vimrc ~/.vimrc
}

all() {
    create_symlinks
}

if [ -n "$1" ]; then
    $1;
else
    all;
fi
