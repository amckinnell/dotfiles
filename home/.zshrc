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
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

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

# JRuby compatibility for Ruby 1.9 (not quite ready for Ruby 2.x)
export JRUBY_OPTS='--1.9'

# Ruby 2.1.x performance improvements (at a cost of increased memory)
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_GC_HEAP_FREE_SLOTS=200000
export RUBY_THREAD_VM_STACK_SIZE=2000000

# Shows the current wi-fi password (you have to authenticate)
alias wifi='wifi-password -q'

# The BFG repo cleaner (see https://rtyley.github.io/bfg-repo-cleaner/)
alias bfg='java -jar $JAVA_TOOLS_HOME/bfg/bfg-1.12.8.jar'

# Opens gmail from the command line
alias amg='open -a "Safari" https://mail.google.com/mail/u/0/#inbox'
alias amn='open -a "Google Chrome" https://mail.google.com/mail/u/0/#inbox'

# Script to improve readability of whiteboard captures.
whiteboard () {
  convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize \
    -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"
}

# Shows the branches that have been merged.
alias lm=locally_merged

# Source from a file that will not go into my dotfiles repo
[ -f .zshrc_private ] && source .zshrc_private


# -----------------------------------------------------------------------------
# General Development
# -----------------------------------------------------------------------------

alias dev='cd ~/dev'


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
alias master='cd $PACKMANAGER_MASTER'
alias rel='cd $PACKMANAGER_RELEASE'

# Configure the Pack Manager node environment
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Start packmanager with all processes running.
alias fsa='fs -f "$PACKMANAGER_ALISTAIR/Procfile.all" -d .'

# Start packmanager where the web server is running in debug in RubyMine.
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
# Nulogy Go Development
# -----------------------------------------------------------------------------

export GO_DIR=/Users/alistair/src/go

# Handy way to get to the go directory
alias go='cd $GO_DIR'


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
