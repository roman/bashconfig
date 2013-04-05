#!/bin/sh

# We configure the colors in the
# ls command, the behaviour changes
# depending on the platform
if [ $platform = 'Linux' ]
then
  alias ls='ls --color'
elif [ $platform = 'Darwin' ]
then 
  # Allow the ls command to have colors when displaying directories
  export CLICOLOR=1
  export LSCOLOR=ExFxCxDxBxegedabagacad
fi

export WHITE_UNDERSCORE_FG="\033[4;37m"
export LIGHT_RED_FG="\033[1;31m"
export LIGHT_GREEN_FG="\033[1;32m"
export LIGHT_BLACK_BG="\033[1;40m"
export LIGHT_YELLOW_FG="\033[1;33m"
export LIGHT_MAGENTA_FG="\033[1;35m"
export RESET="\033[0m"

