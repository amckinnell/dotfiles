# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="alistair"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"


# -----------------------------------------------------------------------------
# Alistair's Tweaks
# -----------------------------------------------------------------------------

# Postgres App command line tools.
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# We want to run the latest Oracle distribution.
export JAVA_HOME=$(/usr/libexec/java_home)

# Add any java command line tools.
JAVA_TOOLS_HOME=/Users/alistair/dev/java
export PATH=$PATH:$JAVA_TOOLS_HOME/apache-maven-3.3.3/bin
export PATH=$PATH:$JAVA_TOOLS_HOME/apache-ant-1.9.6/bin
export PATH=$PATH:$JAVA_TOOLS_HOME/gradle-2.9/bin

plugins=(autojump brew bundler gem git history-substring-search nulogy \
  rake-fast richard sublime terminalapp vagrant zsh-autosuggestions zsh_reload)

source $ZSH/oh-my-zsh.sh

# Disable ZSH auto correction.
unsetopt CORRECT

# When a new command line being added to the history list duplicates an older
# one, the older command is removed from the list.
setopt HIST_IGNORE_ALL_DUPS

# Do not display duplicates of a line previously found.
setopt HIST_FIND_NO_DUPS

# Commands that start with a space are not added to history.
setopt HIST_IGNORE_SPACE

# When writing out the history, omit older commands that duplicate newer ones.
setopt HIST_SAVE_NO_DUPS

export EDITOR="subl -w"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Add my scripts to the front of the PATH
export PATH=/Users/alistair/dev/scripts:$PATH

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Shows the current wi-fi password (you have to authenticate)
alias wifi='wifi-password -q'

# The BFG repo cleaner (see https://rtyley.github.io/bfg-repo-cleaner/)
alias bfg='java -jar $JAVA_TOOLS_HOME/bfg/bfg-1.12.8.jar'

# Opens gmail from the command line
alias amg='open -a "Safari" https://mail.google.com/mail/u/0/#inbox'
alias amn='open -a "Google Chrome" https://mail.google.com/mail/u/0/#inbox'

# Shows the branches that have been merged.
alias lm=locally_merged

# Source from a file that will not go into my dotfiles repo
[ -f .zshrc_private ] && source .zshrc_private


# -----------------------------------------------------------------------------
# General Development
# -----------------------------------------------------------------------------

alias dev='cd ~/dev'

export MINGLE_BROWSER='Google Chrome'

# Makes my Nulogy SSH key available.
ssh-add ~/.ssh/nulogy_rsa 2>/dev/null;

# Makes it easier to switch between different versions of Xcode.
alias xc7='sudo xcode-select -s /Applications/Xcode.7.app'
alias xc8='sudo xcode-select -s /Applications/Xcode.8.app'

# Choose openssl over native OS X libraries.
export PATH=/usr/local/opt/openssl/bin:$PATH


# -----------------------------------------------------------------------------
# Pack Manager Development
# -----------------------------------------------------------------------------

export CPI_DIR=/Users/alistair/src/cpi
export PACKMANAGER_DIR=/Users/alistair/src/packmanager
export SLOC_DIR=$PACKMANAGER_DIR/sloc

PACKMANAGER_ALISTAIR=$PACKMANAGER_DIR/alistair
PACKMANAGER_MASTER=$PACKMANAGER_DIR/master
PACKMANAGER_RELEASE=$PACKMANAGER_DIR/release
PACKMANAGER_PRODUCTION=$PACKMANAGER_DIR/production

# Handy way to get to the CPI directory
alias cpi='cd $CPI_DIR'

# Handy way to get to the packmanager master and release directories
alias master='cd $PACKMANAGER_MASTER'
alias rel='cd $PACKMANAGER_RELEASE'
alias prod='cd $PACKMANAGER_PRODUCTION'

# Configure the Pack Manager node environment
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Start packmanager with all processes running
alias fsa='fs -f "$PACKMANAGER_ALISTAIR/Procfile.all" -d .'

# Start packmanager where the web server is running in debug in RubyMine
alias fsd='fs -f "$PACKMANAGER_ALISTAIR/Procfile.resque" -d .'

# Enable profiling tools in the browser
export PM_ENABLE_PROFILING=1

# Disable the spring pre-loader
# export DISABLE_SPRING=1


# -----------------------------------------------------------------------------
# QCloud Development
# -----------------------------------------------------------------------------

export QCLOUD_DIR=/Users/alistair/src/qcloud

# Handy way to get to the various QCloud directories
alias qcloud='cd $QCLOUD_DIR'


# -----------------------------------------------------------------------------
# Rails Reference Development
# -----------------------------------------------------------------------------

export RAILS_REFERENCE_DIR=/Users/alistair/src/rails-reference

# Handy way to get to the rails-reference directory
alias rr='cd $RAILS_REFERENCE_DIR'


# -----------------------------------------------------------------------------
# Candidates for oh-my-zsh-plugins
# -----------------------------------------------------------------------------

rspecdiff () {
  if [ "$1" =~ ^--help ]
  then
    echo Usage: rspecdiff [commit-spec] [rspec-options]
    return
  fi
  if [ ! $1 ]
  then
    COMMIT_SPEC=master
    RSPEC_ARGS=
  elif [ $1 =~ ^- ]
  then
    COMMIT_SPEC=master
    RSPEC_ARGS=$1
  else
    COMMIT_SPEC=$1
    RSPEC_ARGS=$2
  fi

  git diff $COMMIT_SPEC --diff-filter=d --name-only | \
    grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} "_spec\.rb$" | \
    xargs --no-run-if-empty bundle exec rspec $RSPEC_ARGS
}

# -----------------------------------------------------------------------------
# Supports custom environments
# -----------------------------------------------------------------------------
eval "$(direnv hook zsh)"
