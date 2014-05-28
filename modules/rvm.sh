# This loads the rvm configurations
if ! [[ $PATH = *$HOME/.rvm/bin* ]]; then
    export PATH="$HOME/.rvm/bin:$PATH"
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi
