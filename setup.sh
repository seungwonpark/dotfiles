#!/usr/bin/env bash

# if not macOS, then use native GNU commands
if [ `uname` != "Darwin" ]; then
    shopt -s expand_aliases
    alias gln='ln'
fi


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
