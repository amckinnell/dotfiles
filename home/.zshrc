# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH_THEME="robbyrussell"
ZSH_THEME="alistair"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

setopt hist_find_no_dups hist_ignore_space

# export JAVA_HOME=$(/usr/libexec/java_home)

# We want to run RubyMine on the 1.6 JDK
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump brew bundler gem git history-substring-search nulogy rake-fast sublime terminalapp)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Configuration
export EDITOR="subl -w"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Add the Homebrew executables to the front of the standard OS X PATH
export PATH=/usr/local/bin:/usr/sbin:/sbin:$PATH

# Add my scripts to the front of the PATH
export PATH=/Users/alistair/dev/scripts:$PATH

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Data for each postgres database
export PGDATA=/usr/local/var/postgres postgres

# Create a timer from the command line. Get the command line tool from
# the extras download (see http://whimsicalifornia.com/timebar/)
# function timer() {
#   timebar --duration $(($1 * 60))
# }

# Fetch the latest dev and release code. Run the command: checkmerge 'release'
checkmerge() {
  git merge --no-ff --no-commit $1
  if [ "$?" = 0 ]
  then echo "Clean Merge!"
  else echo "Merge Errors!"
  fi
  git merge --abort
}

alias merged='git branch -a --merged | grep -v remotes'

# Ruby 1.9.x performance improvements (at a cost of increased memory)
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

# Ruby 2.1.x performance improvements (at a cost of increased memory)
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_GC_HEAP_FREE_SLOTS=200000

# Initialize autojump with tab completion (github.com/joelthelion/autojump)
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
autoload -U compinit && compinit


# -----------------------------------------------------------------------------
# Pack Manager Development
# -----------------------------------------------------------------------------
PACKMANAGER_DIR=/Users/alistair/src/packmanager

PACKMANAGER_DEV=$PACKMANAGER_DIR/dev
PACKMANAGER_RELEASE=$PACKMANAGER_DIR/release

# Handy way to get to the packmanager dev and release directories
alias dev='cd $PACKMANAGER_DEV'
alias rel='cd $PACKMANAGER_RELEASE'

# Local binstubs from bundler
export PATH=./bin:$PATH
