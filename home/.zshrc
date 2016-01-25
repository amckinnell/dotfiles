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

# We want to run the latest Oracle distribution.
export JAVA_HOME=$(/usr/libexec/java_home)

# Add any java command line tools.
JAVA_TOOLS_HOME=/Users/alistair/dev/java
export PATH=$PATH:$JAVA_TOOLS_HOME/apache-maven-3.3.3/bin
export PATH=$PATH:$JAVA_TOOLS_HOME/apache-ant-1.9.6/bin
export PATH=$PATH:$JAVA_TOOLS_HOME/gradle-2.9/bin

plugins=(autojump brew gem git history-substring-search nulogy \
  rake-fast richard sublime terminalapp vagrant zsh_reload)

source $ZSH/oh-my-zsh.sh

# Disable ZSH auto correction.
unsetopt correct

# Do not display duplicates of a line previously found.
setopt hist_find_no_dups

# Commands that start with a space are not added to history.
setopt hist_ignore_space

export EDITOR="subl -w"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Add my scripts to the front of the PATH
export PATH=/Users/alistair/dev/scripts:$PATH

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Ruby 1.9.x performance improvements (at a cost of increased memory)
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

# Ruby 2.1.x performance improvements (at a cost of increased memory)
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_GC_HEAP_FREE_SLOTS=200000
export RUBY_THREAD_VM_STACK_SIZE=2000000

# JRuby compatibility for Ruby 1.9 (not quite ready for Ruby 2.x)
export JRUBY_OPTS='--1.9'

# Shows the current wi-fi password (you have to authenticate)
alias wifi='wifi-password -q'

# The BFG repo cleaner (see https://rtyley.github.io/bfg-repo-cleaner/)
alias bfg='java -jar /Users/alistair/dev/java/bfg/bfg-1.12.8.jar'

# Opens gmail from the command line
alias amg='open -a "Safari" https://mail.google.com/mail/u/0/#inbox'
alias amn='open -a "Google Chrome" https://mail.google.com/mail/u/0/#inbox'

# Opens trello from the command line
alias amt='open -a "Google Chrome" https://trello.com'

# Shows the branches that have been merged.
alias lm=locally_merged

# Source from a file that will not go into my dotfiles repo
[ -f .zshrc_private ] && source .zshrc_private


# -----------------------------------------------------------------------------
# Pack Manager Development
# -----------------------------------------------------------------------------

export CPI_DIR=/Users/alistair/src/cpi
export PACKMANAGER_DIR=/Users/alistair/src/packmanager
export SLOC_DIR=$PACKMANAGER_DIR/sloc

PACKMANAGER_ALISTAIR=$PACKMANAGER_DIR/alistair
PACKMANAGER_MASTER=$PACKMANAGER_DIR/master
PACKMANAGER_RELEASE=$PACKMANAGER_DIR/release

# Handy way to get to the CPI directory
alias cpi='cd $CPI_DIR'

# Handy way to get to the packmanager master and release directories
# Note: we used to use dev instead of master as the development branch
alias dev='cd $PACKMANAGER_MASTER'
alias master='cd $PACKMANAGER_MASTER'
alias rel='cd $PACKMANAGER_RELEASE'

# Configure the Pack Manager node environment
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Removed since we want to use another version for PackPortal
# nvm use 0.10 > /dev/null

# Start foreman with all processes running.
alias fsa='fs -f "$PACKMANAGER_ALISTAIR/Procfile.all" -d .'

# Start foreman where the web server is running in debug in RubyMine.
alias fsd='fs -f "$PACKMANAGER_ALISTAIR/Procfile.resque" -d .'


# -----------------------------------------------------------------------------
# SPOC Development
# -----------------------------------------------------------------------------

export SPOC_DIR=/Users/alistair/src/spoc

# Handy way to get to the spoc directory
alias spoc='cd $SPOC_DIR'

# Run RSpec tests except for the features
alias specs="rspec --exclude-pattern 'spec/features/**'"


# -----------------------------------------------------------------------------
# Pack Portal Development
# -----------------------------------------------------------------------------

export PACKPORTAL_DIR=/Users/alistair/src/packportal

# Handy way to get to the packportal directory
alias pp='cd $PACKPORTAL_DIR'


# -----------------------------------------------------------------------------
# Pack Portal Prototype Development
# -----------------------------------------------------------------------------

export PACKPORTAL_PROTOTYPE_DIR=/Users/alistair/src/ppp

# Handy way to get to the packportal-prototype directory
alias ppp='cd $PACKPORTAL_PROTOTYPE_DIR'


# -----------------------------------------------------------------------------
# Rails Reference Development
# -----------------------------------------------------------------------------

export RAILS_REFERENCE_DIR=/Users/alistair/src/rails-reference

# Handy way to get to the rails-reference directory
alias rr='cd $RAILS_REFERENCE_DIR'


# -----------------------------------------------------------------------------
# Supports custom environments
# -----------------------------------------------------------------------------

eval "$(direnv hook zsh)"
