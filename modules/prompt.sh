#!/bin/sh

# Shows the current git branch we are standing on, in 
# case there is none, it simply returns an empty string
#
function parse_git_branch {
  # we are getting the result of the previous command here to 
  # return it later on
  result=$? 

  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[branch: \1]/'

  exit $result
}

# Returns a Green '$' prompt if the last command was 
# successful (returned 0) or a red '$' prompt with the
# error status code otherwise
#
function last_command_result {
  result=$?
  if [ $result = 0 ]
  # print a green "$" sign if the last command was successful
  then echo "\[$LIGHT_GREEN_FG\]\$\[$RESET\] "
  # print the error status code and a red "$" sign if the last
  # command was not successful
  else echo "\[$LIGHT_RED_FG[$result] \$\]\[$RESET\] "
  fi
}

# This prompt should print:
# username@host_name: path_relative_to_home [branch: git branch]
# [error_status_code] $

# In the prompt, we are adding \[\] to each color in order to escape
# invisible characters in the PROMPT, that way it won't get fucked
# up when having long lines on when deleting lines using <C-u>.
# More Info:
# http://www.faqs.org/docs/Linux-HOWTO/Bash-Prompt-HOWTO.html#NONPRINTINGCHARS

PS1="\u@\h: \[$LIGHT_RED_FG\]\w\[$RESET\] \
\[$LIGHT_GREEN_FG\]`parse_git_branch`\[$RESET\]\n\
`last_command_result`"
export PS1

