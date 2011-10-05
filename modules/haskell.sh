#!/bin/sh

# If CABAL_HOME has length eq to zero
# we start with initialization, otherwise
# we skip
if [ -z $CABAL_HOME ]
then
  CABAL_HOME="$HOME/.cabal"
  export CABAL_HOME

fi

# If the cabal binary folder is not included
# in the PATH variable, include it.
if ! [[ $PATH = *$HOME/.cabal/bin* ]]
then
  # Adding Cabal executables to the PATH
  PATH="$HOME/.cabal/bin:$PATH"
  export PATH
fi
