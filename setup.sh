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

install_vim_plugins() {
    # install vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    vim +PlugInstall +qall
}

all() {
    create_symlinks
    configure_git
    install_vim_plugins
}

if [ -n "$1" ]; then
    $1;
else
    all;
fi
