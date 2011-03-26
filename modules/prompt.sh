#!/bin/sh

# Shows the current git branch we are standing on, in 
# case there is none, it simply returns an empty string
#
function parse_git_branch {
  # we are getting the result of the previous command here to 
  # return it later on
  local result=$? 

  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[branch: \1]/'

  exit $result
}

# Returns an error stat code surrounded by brackets
# e.g => [127]
# 
# In case there is no error stat, returns an empty 
# string
#
function last_command_result {
  local result=$?

  if [ $result -ne 0 ]
  # print a green "$" sign if the last command was successful
  then echo "[$result] "
  else echo ""
  fi

  exit $result
}

# Returns a color from the previous status code, if 
# there was a failure, returns a red color, a green
# otherwise
function color_for_last_command_result {
  local result=$?

  if [ $result -eq 0 ]
  then echo -e "$LIGHT_GREEN_FG"
  else echo -e "$LIGHT_RED_FG"
  fi

  exit $result
}

# This prompt should print:
# username@host_name: path_relative_to_home [branch: git branch]
# [error_status_code] $

# In the prompt, we are adding \[\] to each color in order to escape
# invisible characters from the PROMPT, that way it won't get fucked
# up when having long lines or when deleting lines using <C-u>.
# More Info:
# http://www.faqs.org/docs/Linux-HOWTO/Bash-Prompt-HOWTO.html#NONPRINTINGCHARS

export PS1="\u@\h: \[$LIGHT_RED_FG\]\w\[$RESET\] \
\[$LIGHT_GREEN_FG\]\$(parse_git_branch)\[$RESET\]\n\
\[\$(color_for_last_command_result)\]\$(last_command_result)\$\[$RESET\] "

