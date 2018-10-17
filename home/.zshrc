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

# Restore legacy forking behaviour. That is, pre High Sierra behaviour.
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Postgres App command line tools.
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# # We want to run the latest Oracle distribution.
# export JAVA_HOME=$(/usr/libexec/java_home)

# # Add any java command line tools.
# JAVA_TOOLS_HOME=/Users/alistair/dev/java
# export PATH=$PATH:$JAVA_TOOLS_HOME/apache-maven-3.3.3/bin
# export PATH=$PATH:$JAVA_TOOLS_HOME/apache-ant-1.9.6/bin
# export PATH=$PATH:$JAVA_TOOLS_HOME/gradle-2.9/bin

BUNDLED_COMMANDS=(rails rubocop)
plugins=(autojump brew bundler gem git history-substring-search nulogy \
  rake-fast richard sublime take terminalapp vagrant zsh-autosuggestions \
  zsh_reload)

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

# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS

# Configuration for the HSTR utility.
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors

# Use Sublime as my text editor.
export EDITOR="subl -w"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Add my scripts to the front of the PATH
export PATH=/Users/alistair/dev/scripts:$PATH

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Shows the current wi-fi password (you have to authenticate)
# Install command line tool using 'brew install wifi-password'
alias wifi='wifi-password -q'

# The BFG repo cleaner (see https://rtyley.github.io/bfg-repo-cleaner/)
alias bfg='java -jar $JAVA_TOOLS_HOME/bfg/bfg-1.12.8.jar'

# Opens gmail from the command line
alias amg='open -a "Safari" https://mail.google.com/mail/u/0/#inbox'
alias amn='open -a "Google Chrome" https://mail.google.com/mail/u/0/#inbox'

# Shows the branches that have been merged.
alias lm=locally_merged

# Open my list of useful commands.
alias uc='subl ~/useful_commands.txt'

# Source from a file that will not go into my dotfiles repo
[ -f .zshrc_private ] && source .zshrc_private


# -----------------------------------------------------------------------------
# General Development
# -----------------------------------------------------------------------------

alias dev='cd ~/dev'

# Makes my Nulogy SSH key available.
ssh-add ~/.ssh/nulogy_rsa 2>/dev/null;

# Makes it easier to switch between different versions of Xcode.
# alias xc8='sudo xcode-select -s /Applications/Xcode.8.app'
# alias xc9='sudo xcode-select -s /Applications/Xcode.9.app'

# Choose openssl over native OS X libraries.
export PATH=/usr/local/opt/openssl/bin:$PATH

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi


# -----------------------------------------------------------------------------
# Highlight Source from Clipboard for Keynote or Pages
# -----------------------------------------------------------------------------

export HIGHLIGHT_DIR='/Users/alistair/dev/highlight'

alias highlight_for_keynote='pbpaste | highlight --out-format rtf --font-size 24 --font Menlo --plug-in "$HIGHLIGHT_DIR/rspec.lua" --config-file "$HIGHLIGHT_DIR/twilight.theme" --style twilight --src-lang ruby | pbcopy'
alias highlight_for_pages='pbpaste | highlight --out-format rtf --font-size 10 --font Menlo --src-lang ruby --line-numbers | pbcopy'


# -----------------------------------------------------------------------------
# Pack Manager Development
# -----------------------------------------------------------------------------

# Add to path for rabbitmq-server.
export PATH=$PATH:/usr/local/sbin

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

# Create a Packmanager user
alias nu='rake nulogy:user_management:create_admin[alistairm@nulogy.com,Password1]'

# Reset the customer test data catalog
alias reset_catalog='SKIP_TEST_DEFAULTS_WHEN_CUSTOMER_TESTING=true rake db:reset nulogy:customer_test_data:catalog'

# Start packmanager with all processes running
alias fsa='fs -f "$PACKMANAGER_ALISTAIR/Procfile.all" -d .'

# Use chrome for running acceptance specs and features
export CAPYBARA_DRIVER=chrome

# Enable profiling tools in the browser
# export PM_ENABLE_PROFILING=1

# Disable the spring pre-loader
# export DISABLE_SPRING=1

# Run specs and fetaures with Google Chrome
export CAPYBARA_DRIVER=chrome

alias use_chrome='export CAPYBARA_DRIVER=chrome'
alias use_chrome_headless='export CAPYBARA_DRIVER=chrome_headless'

# My preferred way to integrate to master
alias integrate='thor nugit:integrate --rubocop --into master --delete-branches'

# Rails Next directories
PACKMANAGER_RAILS_NEXT=$PACKMANAGER_DIR/rails_next

alias rails_next='cd $PACKMANAGER_RAILS_NEXT'

# Helpers for the migration to Rails Next
function env_rails_current() {
  unset RAILS_NEXT
  echo -e '\033]50;SetProfile=Default\a'
}

function env_rails_next() {
  export RAILS_NEXT=true
  echo -e '\033]50;SetProfile=RailsNext\a'
}

function rails_prompt() {
  if [[ "$RAILS_NEXT" =~ "true" ]]; then
    echo `rails --version | sed -e "s/^Rails //"`-
  fi
}

function rails_next_prompt() {
  if [[ "$RAILS_NEXT" =~ "true" ]]; then
    printf "-"
  fi
}

alias rc='master && env_rails_current'
alias rn='rails_next && env_rails_next'

alias fitness='DISABLE_SPRING=1 rspec ./modules/fitness_functions/spec/unit/lib/component_dependencies_spec.rb'
alias rn_status='$PACKMANAGER_MASTER/development/rails_next/spec_status_summary_report_bash.sh'


# -----------------------------------------------------------------------------
# QCloud Development
# -----------------------------------------------------------------------------

export QCLOUD_DIR=/Users/alistair/src/qcloud

# Handy way to get to the various QCloud directories
alias qcloud='cd $QCLOUD_DIR'

# Run Rubocop on a diff between the specified commit and the current working directory.
#
# If no commit is specified the default is to diff against master. You can also pass
# any additional command line arguments along to rubocop.
#
# Examples:
#
#   rubodiff
#   rubodiff --auto-correct
#   rubodiff master --auto-correct
#   rubodiff release
#   rubodiff HEAD~6
#   rubodiff 0f477ae
#
function rubodiff() {
  if [ "$1" =~ ^--help ]; then
    echo Usage: rubodiff [commit-spec] [rubocop-options]
    return
  fi

  if [ ! $1 ]; then
    COMMIT_SPEC=master
    RUBOCOP_ARGS=
  elif [ $1 =~ ^- ]; then
    COMMIT_SPEC=master
    RUBOCOP_ARGS=$1
  else
    COMMIT_SPEC=$1
    RUBOCOP_ARGS=$2
  fi

  git diff $COMMIT_SPEC --diff-filter=d --name-only | \
    grep "\.rb$" | \
    xargs --no-run-if-empty rubocop --config .rubocop.backlog.yml $RUBOCOP_ARGS
}

# See Language & Region System Preference on OS X
export TWENTY_FOUR_HOUR_CLOCK=true


# -----------------------------------------------------------------------------
# Candidates for oh-my-zsh-plugins
# -----------------------------------------------------------------------------

# Counts the occurences of the specified string (recursively from current dir).
function count() {
  ag --count $1 | cut -f 2 -d: | awk '{ s += $1 } END { print s }'
}


# -----------------------------------------------------------------------------
# Node Version Manager
# -----------------------------------------------------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

npm config delete prefix

nvm use `cat $PACKMANAGER_MASTER/.nvmrc`


# -----------------------------------------------------------------------------
# Supports custom environments using direnv
# -----------------------------------------------------------------------------

# eval "$(direnv hook zsh)"
