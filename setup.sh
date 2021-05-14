#!/usr/bin/env bash

create_symlinks() {
    gln -rsf vim/.vimrc ~
    gln -rsf tmux/.tmux.conf ~
}

configure_git() {
    gln -rsf git/.gitconfig ~
    gln -rsf git/.gitexclude ~
}

all() {
    create_symlinks
    configure_git
}

if [ -n "$1" ]; then
    $1;
else
    all;
fi
