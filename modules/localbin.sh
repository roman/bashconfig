#!/bin/sh

# If the home binary folder is not included
# in the PATH variable, include it.
if ! [[ $PATH = *$HOME/.bin* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
