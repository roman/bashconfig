#!/bin/sh

# If EMACS_HOME has length eq to zero
# we start with initialization, otherwise
# we skip
if [[ -z $EMACS_HOME ]]; then
  EMACS_HOME="$HOME/.emacs.d"
  export EMACS_HOME

  echo "$PATH" | grep '.cask/bin' > /dev/null
  if [[ $? = 1 ]]; then
      export PATH="$HOME/.cask/bin:$PATH"
  fi
fi
