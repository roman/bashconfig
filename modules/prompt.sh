#!/bin/sh

# This function will show the current git branch we are standing on
function parse_git_branch {
  # we are getting the result of the previous command here to 
  # return it later on
  result=$? 

  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[branch: \1]/'

  exit $result
}

function last_command_result {
  result=$?
  if [ $result = 0 ]
  # print a green "$" sign if the last command was successful
  then printf "$LIGHT_GREEN_FG\$$RESET "
  # print the error status code and a red "$" sign if the last
  # command was not successful
  else printf "$LIGHT_RED_FG[$result] \$$RESET "
  fi
}

# This prompt should print:
# username@host_name: path_relative_to_home [branch: git branch]
# [error_status_code] $
PS1="\u@\h: $LIGHT_RED_FG\w$RESET $LIGHT_GREEN_FG\$(parse_git_branch)$RESET\n\$(last_command_result)"
export PS1

