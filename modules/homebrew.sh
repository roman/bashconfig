#!/bin/sh

# If HOMEBREW_HOME has length eq to zero
# we start with initialization, otherwise
# we skip
if [ -z $HOMEBREW_HOME ] && [ $platform = 'Darwin' ]; then
  export HOMEBREW_HOME=/usr/local

  # Adding Homebrew executables to the PATH
  if ! [[ $PATH = *$HOMEBREW_HOME/bin* ]]; then
    PATH="$HOMEBREW_HOME/bin:$HOMEBREW_HOME/sbin:$PATH"
    export PATH
  fi
fi
