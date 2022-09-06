alias tb="tensorboard --logdir . --bind_all --samples_per_plugin=images=100 --port"
alias jn="jupyter notebook --ip 0.0.0.0 --no-browser --port"
workon() {
    source "$HOME/venvs/$1/bin/activate"
}
