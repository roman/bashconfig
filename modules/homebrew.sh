#!/bin/sh

# If HOMEBREW_HOME has length eq to zero
# we start with initialization, otherwise
# we skip
if [ -z $HOMEBREW_HOME ]
then 
  # HOMEBREW_HOME="/usr/local"
  HOMEBREW_HOME="~/.homebrew"
  export HOMEBREW_HOME

  
  # Adding Homebrew executables to the PATH
  PATH="$HOMEBREW_HOME/bin:$HOMEBREW_HOME/sbin:$PATH"
  export PATH
fi


