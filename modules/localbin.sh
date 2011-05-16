#!/bin/sh

# If the home binary folder is not included
# in the PATH variable, include it.
if ! [[ $PATH = *~/.bin* ]]
then
  PATH="~/.bin:$PATH"
  export PATH
fi
