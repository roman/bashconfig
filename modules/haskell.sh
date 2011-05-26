#!/bin/sh

# If CABAL_HOME has length eq to zero
# we start with initialization, otherwise
# we skip
if [ -z $CABAL_HOME ]
then
  CABAL_HOME="$HOME/.cabal"
  export CABAL_HOME

  # Adding Cabal executables to the PATH
  PATH="$PATH:$HOME/.cabal/bin"
  export PATH
fi

