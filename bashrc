# Terminal will have vi mode when <ESC> is pressed
set -o vi

# The OS we are currently using
platform=`uname`

modules="$HOME/.bash/modules"
# == General colors to use on the terminal
source $modules/colors.sh
# == Pimped prompt
source $modules/prompt.sh
# == Handy Aliases
source $modules/aliases.sh
# == RVM config
source $modules/rvm.sh
# == Java config
source $modules/java.sh
# == Ruby config
source $modules/ruby.sh
# == Vim config
source $modules/vim.sh
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
# == Load the EC2 config if available
if [ -e $modules/ec2.sh ]
then source $modules/ec2.sh
fi


