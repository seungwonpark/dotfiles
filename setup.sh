#!/usr/bin/env bash

create_symlinks() {
    ln -rsf vim/.vimrc ~
    ln -rsf tmux/.tmux.conf ~
}

configure_git() {
    ln -rsf git/.gitconfig ~
    ln -rsf git/.gitexclude ~
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
    source aliases.sh
}

if [ -n "$1" ]; then
    $1;
else
    all;
fi
