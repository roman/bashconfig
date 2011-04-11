#!/bin/sh

# If GEM_HOME has length eq to zero
# we start with initialization, otherwise
# we skip
if [ -z $RUBY_INITIALIZED ] 
then
  RUBY_INITIALIZED='1'
  if [ -z $GEM_HOME ]
  then export GEM_HOME="$HOME/.gem"
  else export GEM_HOME="$GEM_HOME:$HOME/.gem"
  fi

  # Adding Rubygems executables to the PATH
  export PATH="$PATH:$HOME/.gem/bin"

fi

