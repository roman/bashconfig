#!/bin/sh

# If EMACS_HOME has length eq to zero we start with initialization,
# otherwise we skip
if [[ -z $EMACS_HOME ]]; then
    export EMACS_HOME="$HOME/.emacs.d"
    alias emacs_home="cd $EMACS_HOME"
fi

# Cask configuration
if ! [[ $PATH = *$HOME/.cask/bin* ]]; then
    export PATH="$HOME/.cask/bin:$PATH"
fi
