#!/bin/sh

# If the home binary folder is not included
# in the PATH variable, include it.
if ! [[ $PATH = *$HOME/.bin* ]]
then
  PATH="$HOME/.bin:$PATH"
  export PATH
fi
