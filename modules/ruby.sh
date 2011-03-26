#!/bin/sh

# If GEM_HOME has length eq to zero
# we start with initialization, otherwise
# we skip
if [ -z $GEM_HOME ] 
then
  GEM_HOME="~/.gem"
  export GEM_HOME

  # Adding Rubygems executables to the PATH
  PATH="$PATH:~/.gem/bin"
  export PATH
fi

