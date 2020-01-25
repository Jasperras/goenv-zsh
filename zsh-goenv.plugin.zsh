GITHUB="https://github.com"

[[ -z "$GOENV_HOME" ]] && export GOENV_HOME="$HOME/.goenv"

_zsh_goenv_install() {
    echo "Installing goenv..."
    git clone "${GITHUB}/syndbg/goenv.git"         "${GOENV_HOME}"
}

_zsh_goenv_load() {
    # export PATH
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$GOENV_HOME/bin:$PATH"
    eval "$(goenv init -)"
    export PATH="$GOROOT/bin:$PATH"
    export PATH="$PATH:$GOPATH/bin"
}

# install goenv if it isnt already installed
[[ ! -f "$GOENV_HOME/libexec/goenv" ]] && _zsh_goenv_install

# load goenv if it is installed
if [[ -f "$GOENV_HOME/libexec/goenv" ]]; then
    _zsh_goenv_load
fi
