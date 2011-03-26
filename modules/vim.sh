#!/bin/sh

# If VIM_HOME has length eq to zero
# we start with initialization, otherwise
# we skip
if [ -z $VIM_HOME ]
then 
  VIM_HOME="~/.vim"
  export VIM_HOME

  EDITOR="vim -f"
  export EDITOR
fi

