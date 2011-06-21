#!/bin/sh

# Prints an exclamation (!) whenever
# there is a modified file (not on the index)
function prompt_git_is_there_modified_files {
  local result=$?
  
  git_result=`git status 2> /dev/null | sed -n '/Changes not staged for commit:/p'`
  
  if [ -n "$git_result" ]; then
    echo '!'
    exit $result
  fi

  git_result=`git status 2> /dev/null | sed -n '/Changed but not updated:/p'` 

  if [ -n "$git_result" ]; then
    echo '[!]'
    exit $result
  fi

  exit $result
}

# Prints an star (*) whenever
# there is a modified file (on the index)
function prompt_git_is_there_files_on_index {
  local result=$?

  git_result=`git status 2> /dev/null | sed -n '/Changes to be committed:/p'`

  if [ -n "$git_result" ]; then
    echo '[*]'
  fi

   
  exit $result
}

# Prints a question mark (?) whenever 
# there is a not versioned file on the repo
function prompt_git_is_there_new_files {
  local result=$?
  
  git_result=`git status 2> /dev/null | sed -n '/Untracked files:/p'`

  if [ -n "$git_result" ]; then
    echo '[?]'
  fi

  exit $result
}

# Prints the current git branch on the repo, in 
# case there is none, it simply returns an empty string
#
function prompt_git_current_branch {
  # we are getting the result of the previous command here to 
  # return it later on
  local result=$? 

  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/- git: \1 /'

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
\[$LIGHT_GREEN_FG\]\$(prompt_git_current_branch)\
\[$LIGHT_GREEN_FG\]\$(prompt_git_is_there_files_on_index)\[$RESET\]\
\[$LIGHT_RED_FG\]\$(prompt_git_is_there_modified_files)\[$RESET\]\
\[$LIGHT_YELLOW_FG\]\$(prompt_git_is_there_new_files)\[$RESET\]\
\[$LIGHT_GREEN_FG\]\[$RESET\]\n\
\[\$(color_for_last_command_result)\]\$(last_command_result)\$\[$RESET\] "

