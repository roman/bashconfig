#!/usr/bin

if [ -f "/usr/bin/vim" ]
then
  # Whe using only the "vim" command (without prefix path),
  # the exit status would always be different from zero,
  # by using the complete path, this problem is fixed!
  export GIT_EDITOR="/usr/bin/vim"

elif [ -f "/usr/local/bin/vim" ]
then
  export GIT_EDITOR="/usr/local/bin/vim"

# Likely to never be executed :-)
elif [ -f "/usr/bin/mate" ]
then
  export GIT_EDITOR="/usr/bin/mate -f"

fi
