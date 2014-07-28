#!/bin/bash

# Terminal will have vi mode when <ESC> is pressed
set -o emacs

# The OS we are currently using
platform=`uname`

unset PATH
export PATH="/usr/local/bin:/usr/bin:/bin"

modules="$HOME/.bash/modules"


## Cloud Services
#
# == Google Cloud Engine app
source $modules/google-cloud.sh
# == Load the EC2 config if available
if [ -e $modules/ec2.sh ]
then source $modules/ec2.sh
fi

## General
#
# == General colors to use on the terminal
source $modules/colors.sh
# == SSH - PGP keychain manager
source $modules/keychain.sh
# == Pimped prompt
source $modules/prompt.sh
# == Handy Aliases
source $modules/aliases.sh
# == Java config
source $modules/java.sh
# == Editor config
source $modules/emacs.sh
# == Git config
source $modules/git.sh
# == Git Completion utility
source $modules/git-completion.sh
# == Haskell config
source $modules/haskell.sh
# == Node.js config
source $modules/nodejs.sh
# == Homebrew config
source $modules/homebrew.sh
# == Home Binaries
source $modules/localbin.sh
# == Ruby config
source $modules/ruby.sh
# == RVM config
source $modules/rvm.sh
# == Virtualenv config
source $modules/virtualenv.sh
# == Hitch (Pair Programming)
source $modules/hitch.sh
# == Load the EC2 config if available
if [ -e $modules/aws.sh ]
then source $modules/aws.sh
fi

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
  return
fi

unset PROMPT_COMMAND
export SLIMERJSLAUNCHER=/Applications/Firefox.app/Contents/MacOS/firefox
