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

# We want to be sure to run RubyMine on the 1.6 JDK. No longer
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home

# We want to run the latest Oracle distribution.
export JAVA_HOME=$(/usr/libexec/java_home)

plugins=(autojump brew gem git history-substring-search nulogy rake-fast richard sublime terminalapp vagrant zsh_reload)

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

# Add the Homebrew executables to the front of the standard OS X PATH
export PATH=/usr/local/bin:/usr/sbin:/sbin:$PATH

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

# JRuby performance improvements (optimised for development over production)
export JRUBY_OPTS='--1.9 --dev -G'

# Shows the current wi-fi password (you have to authenticate)
alias wifi='wifi-password -q'

# -----------------------------------------------------------------------------
# Pack Manager Development
# -----------------------------------------------------------------------------

export CPI_DIR=/Users/alistair/src/cpi
export PACKMANAGER_DIR=/Users/alistair/src/packmanager

PACKMANAGER_ALISTAIR=$PACKMANAGER_DIR/alistair
PACKMANAGER_DEV=$PACKMANAGER_DIR/dev
PACKMANAGER_RELEASE=$PACKMANAGER_DIR/release

# Handy way to get to the CPI directory
alias cpi='cd $CPI_DIR'

# Handy way to get to the packmanager dev and release directories
alias dev='cd $PACKMANAGER_DEV'
alias rel='cd $PACKMANAGER_RELEASE'

# Local binstubs from bundler
export PATH=./bin:$PATH

# Configure the Pack Manager node environment
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

nvm use 0.10 > /dev/null

function n() { node_modules/.bin/$@ ;}

# Start foreman with all processes running.
alias fsa='fs --procfile="$PACKMANAGER_ALISTAIR/Procfile.all" --root=.'

# Start foreman where the web server is running in debug in RubyMine.
alias fsd='fs --procfile="$PACKMANAGER_ALISTAIR/Procfile.debug" --root=.'

# -----------------------------------------------------------------------------
# SPOC Development
# -----------------------------------------------------------------------------

export SPOC_DIR=/Users/alistair/src/spoc

# Handy way to get to the spoc directory
alias spoc='cd $SPOC_DIR'

# Run RSpec tests except for the features
alias specs="rspec --exclude-pattern 'spec/features/**'"
