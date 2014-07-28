#!/bin/sh

### Git Prompt Utilities

# Displays the info of the git repo on the prompt
function perform_git_check {
    local result=$?

    local git_branch=`git branch 2> /dev/null`
    if [[ -n git_branch ]]; then
        local git_status=`git status 2> /dev/null`

        local branch=`prompt_git_current_branch "$git_branch"`
        local index_files=`prompt_git_is_there_files_on_index "$git_status"`
        local new_files=`prompt_git_is_there_new_files "$git_status"`
        local modified_files=`prompt_git_is_there_modified_files "$git_status"`
        echo "$branch$index_files$modified_files$new_files"
    fi

    exit $result
}

# Prints an exclamation (!) whenever
# there is a modified file (not on the index)
function prompt_git_is_there_modified_files {

    git_result=`echo "$1" | sed -n '/Changes not staged for commit:/p'`

    if [ -n "$git_result" ]; then
        printf "$LIGHT_RED_FG[!]$RESET"
    fi

    git_result=`echo "$1" | sed -n '/Changed but not updated:/p'`

    if [ -n "$git_result" ]; then
        printf "$LIGHT_RED_FG[!]$RESET"
    fi

}

# Prints an star (*) whenever
# there is a modified file (on the index)
function prompt_git_is_there_files_on_index {
    local git_result=`echo "$1" | sed -n '/Changes to be committed:/p'`

    if [[ -n "$git_result" ]]; then
        printf "$LIGHT_GREEN_FG[*]$RESET"
    fi
}

# Prints a question mark (?) whenever
# there is a not versioned file on the repo
function prompt_git_is_there_new_files {
    local git_result=`echo $1 | sed -n '/Untracked files:/p'`

    if [[ -n "$git_result" ]]; then
        printf "$LIGHT_YELLOW_FG[?]$RESET"
    fi
}


# Prints the current git branch on the repo, in
# case there is none, it simply returns an empty string
#
function prompt_git_current_branch {
    local result=`echo "$1" | sed -e '/^[^*]/d' -e 's/* \(.*\)/- git: \1 /'`
    printf "$LIGHT_GREEN_FG$result$RESET"
}

### Last Command utilities

# Returns an error stat code surrounded by brackets
# e.g => [127]
#
# In case there is no error stat, returns an empty
# string
#
function last_command_result {
    local result=$?

    if [[ $result -ne 0 ]]; then
        # print a green "$" sign if the last command was successful
        echo "（╯°□°）╯︵ ┻━┻  [$result] "
        echo ""
    fi

    exit $result
}

# Returns a color from the previous status code, if
# there was a failure, returns a red color, a green
# otherwise
function color_for_last_command_result {
    local result=$?

    if [[ $result -eq 0 ]]; then
        echo -e "$LIGHT_GREEN_FG"
    else
        echo -e "$LIGHT_RED_FG"
    fi

    exit $result
}

function color_for_user {
    local result=$?
    local user=`whoami`

    if [[ $user = 'vagrant' ]]; then
        echo -e "$LIGHT_MAGENTA_FG"
    fi

    exit $result
}

function get_current_gemset {
    local result=$?
    if [[ $(command -v rvm 2>&1 /dev/null) ]]; then
        local current_gemset=$(rvm-prompt i g)
        if [[ $(echo $current_gemset | grep '@') ]]; then
            printf "$LIGHT_MAGENTA_FG[$current_gemset]$RESET"
        fi
    fi
    exit $result
}

function get_current_virtualenv {
    local result=$?
    if [[ -e $VIRTUAL_ENV ]]; then
        printf "$LIGHT_GREEN_FG[`basename $VIRTUAL_ENV`]$RESET"
    fi
    exit $result
}

function get_ghc_sandboxed {
    local result=$?
    ls | grep 'cabal.sandbox.config' > /dev/null
    if [[ $? = 0 ]]; then
        printf "$LIGHT_YELLOW_FG[sandboxed]$RESET"
    fi
    exit $result
}

function print_env {
    local result=$?
    local env_string="$(get_ghc_sandboxed)$(get_current_virtualenv)$(get_current_gemset)"
    local env_string_size=${#env_string}
    if [[ $env_string_size -gt 0 ]]; then
        printf "$env_string "
    fi
    exit $?
}

# This prompt should print:
# username@host_name: path_relative_to_home [branch: git branch]
# [error_status_code] $

# In the prompt, we are adding \[\] to each color in order to escape
# invisible characters from the PROMPT, that way it won't get fucked
# up when having long lines or when deleting lines using <C-u>.
# More Info:
# http://www.faqs.org/docs/Linux-HOWTO/Bash-Prompt-HOWTO.html#NONPRINTINGCHARS
# Exception:
# We are not using this escaping on the git repo info, this is because
# the line they are in doesn't have any input, so we don't have to bother
# about that

#export PS1="\n\$(get_ghc_sandboxed)\$(get_current_virtualenv)\$(get_current_gemset) \$(color_for_user)\u$RESET@\h: \[$LIGHT_RED_FG\]\w\[$RESET\] \
export PS1="\n\$(print_env)\$(color_for_user)\u$RESET@\h: \[$LIGHT_RED_FG\]\w\[$RESET\] \
\$(perform_git_check)\n\
\[\$(color_for_last_command_result)\]\$(last_command_result)\$\[$RESET\] "
