# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="alistair"

# Possible experiment
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Increase file descriptoers limit from the default of 256. 
ulimit -n 4096

# Postgres App command line tools.
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# We want to run the latest Oracle distribution.
export JAVA_HOME=`/usr/libexec/java_home`

# # Add any java command line tools.
# JAVA_TOOLS_HOME=~/dev/java
# export PATH=$PATH:$JAVA_TOOLS_HOME/apache-maven-3.3.3/bin
# export PATH=$PATH:$JAVA_TOOLS_HOME/apache-ant-1.9.6/bin
# export PATH=$PATH:$JAVA_TOOLS_HOME/gradle-2.9/bin

BUNDLED_COMMANDS=(nu query_each_schema rails rake rspec rubocop ruby screengem thor)
plugins=(brew bundler git gitfast history-substring-search nulogy rake-fast sublime z)

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

# Use RubyMine as my text editor.
# export EDITOR="mine -w"

# Use Visual Studio Code as my text editor.
# export EDITOR="code -w"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Add my scripts to the front of the PATH
export PATH=~/dev/scripts:$PATH

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Opens gmail from the command line
alias amg='open -a "Safari" https://mail.google.com/mail/u/0/#inbox'
alias amn='open -a "Google Chrome" https://mail.google.com/mail/u/0/#inbox'

# The BFG repo cleaner (see https://rtyley.github.io/bfg-repo-cleaner/)
alias bfg='java -jar $JAVA_TOOLS_HOME/bfg/bfg-1.12.8.jar'

# Clear oopsie .idea project
alias clear_idea='rm -rf .idea'

# Shows the branches that have been merged.
alias lm=locally_merged

# Lurkers (see https://blog.testdouble.com/posts/2020-04-07-favorite-things/)
alias ls='exa'

# Shows the current wi-fi password (you have to authenticate)
# Install command line tool using 'brew install wifi-password'
alias wifi='wifi-password -q'

# Configuration for ruby-build (a plugin for rbenv).
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Source from a file that will not go into my dotfiles repo
[ -f .zshrc_private ] && source .zshrc_private

# Open GitKraken from the command line
alias kraken='open -na "GitKraken" --args -p $(pwd)'

# Install the Homebrew Command Not Found tool
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
  source "$HB_CNF_HANDLER";
fi


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

# One-by-one commit for each file using the same message.
function commit_each() {
  if [ -z "$1" ]; then
    echo
    echo "  Usage:"
    echo "    commit_each <message>"
  else
    for file in $(git diff main --name-status | cut -f2); do 
      git commit -m "$1" -- $file
    done
  fi
}

# Hide Thor deprecation warnings.
export THOR_SILENCE_DEPRECATION=1

# Speed up brew process boot time..
export HOMEBREW_BOOTSNAP=1


# -----------------------------------------------------------------------------
# Highlight Source from Clipboard for Keynote or Pages
# -----------------------------------------------------------------------------

export HIGHLIGHT_DIR='~/dev/highlight'

alias highlight_for_keynote='pbpaste | highlight --out-format rtf --font-size 24 --font Menlo --plug-in "$HIGHLIGHT_DIR/rspec.lua" --config-file "$HIGHLIGHT_DIR/twilight.theme" --style twilight --src-lang ruby | pbcopy'
alias highlight_for_pages='pbpaste | highlight --out-format rtf --font-size 10 --font Menlo --src-lang ruby --line-numbers | pbcopy'


# -----------------------------------------------------------------------------
# Epic React Workshop
# -----------------------------------------------------------------------------

alias er_web="open https://epicreact.dev/learn/"


# -----------------------------------------------------------------------------
# Ops Core Development
# -----------------------------------------------------------------------------

# Simplify interactions with AWS CLI
export AWS_PAGER=""

# Add to path for the rabbitmq-server
export PATH=$PATH:/usr/local/sbin

export PACKMANAGER_DIR=~/src/packmanager

PACKMANAGER_ALISTAIR=$PACKMANAGER_DIR/alistair

# Handy ways to get to the packmanager directories
PACKMANAGER_HOME=~/src/packmanager

# Helps the Sales Demo Conversion project find PackManager
export PACKMANAGER_ROOT=$PACKMANAGER_DIR/main

# Regenerate the rubocop to do list.
alias regen='thor nucop:cli:regen_backlog'

# Create a Packmanager user
alias pm_user='rails nulogy:user_management:create_admin[alistairm@nulogy.com,Password1]'

# Start packmanager with all processes running
alias fsa='fs -f "$PACKMANAGER_ALISTAIR/Procfile.all" -d .'

alias bamboohr='open https://nulogycorp.bamboohr.com/home/'

# Disable the spring pre-loader
export DISABLE_SPRING=1

# Use this browser for running acceptance specs and features
export CAPYBARA_DRIVER=chrome
# export CAPYBARA_DRIVER=selenium

# Caputure screenshots when running acceptance specs and features
export CAPYBARA_SCREENSHOT=1

alias use_chrome='export CAPYBARA_DRIVER=chrome'
alias use_chrome_headless='export CAPYBARA_DRIVER=chrome_headless'
alias use_firefox='export CAPYBARA_DRIVER=selenium'

# Rails Next directories
PACKMANAGER_RAILS_NEXT=$PACKMANAGER_DIR/rails_next

alias rails_next='cd $PACKMANAGER_RAILS_NEXT'

# Run locally with RAILS NEXT?
export RAILS_NEXT=false

# Use the ActiveRecord session store
export PM_USE_ACTIVERECORD_STORE=true

# Helpers for the migration to Rails Next
function env_rails_current() {
  unset RAILS_NEXT
  unset BUNDLE_GEMFILE
  echo -e '\033]50;SetProfile=Default\a'
}

function env_rails_next() {
  export RAILS_NEXT=true
  export BUNDLE_GEMFILE=Gemfile.next
  echo -e '\033]50;SetProfile=RailsNext\a'
}

function ruby_prompt() {
  rbenv version | cut -d' ' -f 1
}

function rails_next_prompt() {
  if [[ "$RAILS_NEXT" == "true" ]]; then
    echo "~"
  fi
}

function rails_next_deprecations() {
  $PACKMANAGER_HOME/main/development/rails_next/collect_rails_deprecation_warnings.rb "aa761ad6eed0e8c05519bbddb1036d6c711a5947" "$1"
}

function mine() {
  if [[ "$RAILS_NEXT" = true ]]; then
    export RUBYMINE_PROPERTIES=$HOME/src/rubymine_rails_next/idea.properties
    open -na /Applications/RubyMine.app $@
  else
    unset RUBYMINE_PROPERTIES
    /usr/local/bin/mine $@
  fi
}


alias rc='main && env_rails_current'
alias rn='main && env_rails_next'
alias rn_deprecations='rails_next_deprecations'

# Open better_errors links directly in open RubyMine.
export BETTER_ERRORS_EDITOR="x-mine://open?file=%{file}&line=%{line}"

# Flush memcached
alias flush_mem_cache_server="echo 'flush_all' | nc 127.0.0.1 11211"

# Enable logging in the browser
export PM_BROWSER_LOGGING=true

# Enable profiling tools in the browser (use 1 for enabled)
export PM_ENABLE_PROFILING=0

# Reduce the console noise in development by reducing the polling interval
export PM_POLLING_INTERVAL_IN_SECONDS=600

# Enable the database analysis gems
export PM_STATIC_DATABASE_ANALYSIS=true

# Enable the named release toggle for all sites
function enable_release_toggle() {
  rails r modules/generic/release_toggles_app/scripts/release_toggles_global.rb enable "$1"
}

# Run the Sales Demo verifier
alias verifier='./modules/generic/test_data_catalog/scripts/end_to_end_verification/end_to_end_verifier.rb'

# My push to buildkite with a local run of Rubocop.
alias build_branch='files_in_branch | xargs nucop diff && nucop diff_enforced && gpf && buildkite'

# A count of the remaining occurrences of current_account or current_site
function current_count() {
  rg --word-regexp --count-matches --type ruby 'current_(account|site)' | awk -F ':' '{s+=$2} END {print s}'
}

# Open the OSE2 team cloud resources
# alias ose2_figma='open https://www.figma.com/files/849777861029598570/project/27695145/OSE2'
# alias ose2_mission_control='open https://miro.com/app/board/o9J_lvrGbSI=/'
# alias ose2_mobbing='nutrella ose2_mobbing'
alias ose2_room='open https://nulogy.zoom.us/j/97005535516'
# alias ose2_timer='open https://mobti.me/ose2'

# Open the SF1 team cloud resources
alias sf1_board='nutrella sf1_board'
alias sf1_kanban='open https://nulogy-go.atlassian.net/jira/software/c/projects/PM/boards/171'
alias sf1_mission_control='open https://miro.com/app/board/o9J_lfmAm6U=/'
alias sf1_mobbing_room='open https://nulogy.zoom.us/j/7286849403'
alias sf1_team_room='open https://nulogy.zoom.us/j/7513224419\?pwd=MVkrOVN4alpZSWdrUmZxOTA5K2hCZz09'
alias sf1_timer='open https://mobti.me/sf1'

# Run the Automated Production Entry featurs and specs
alias ape_features='spring rails ape:features'
alias ape_specs='spring rails ape:specs'

# Open the Automated Production Entry UML class diagram
alias ape_uml='open /Users/alistairm/dev/umlgraph_tool/out/AutomatedProductionEntry.png'


# -----------------------------------------------------------------------------
# Sales Demo Development
# -----------------------------------------------------------------------------

alias sales_demo_pipeline='open https://buildkite.com/nulogy-corp/opscore-create-demo/builds\?branch=main'

# Handy way to get to the sales demo conversion directory
alias sales_demo_conversion='cd ~/src/sales_demo_conversion'

# Handy way to get to the sales demo directory
alias sales_demo='cd ~/src/sales-demo'



# -----------------------------------------------------------------------------
# QCloud Development
# -----------------------------------------------------------------------------

export QCLOUD_DIR=~/src/QCloud

# Handy way to get to the various QCloud directories
alias qcloud='cd $QCLOUD_DIR'

# Handy way to get to the various DQI directories
alias dqi='cd $QCLOUD_DIR'

# Run Rubocop on a diff between the specified commit and the current working directory.
#
# If no commit is specified the default is to diff against main. You can also pass
# any additional command line arguments along to rubocop.
#
# Examples:
#
#   rubodiff
#   rubodiff --auto-correct
#   rubodiff main --auto-correct
#   rubodiff production
#   rubodiff HEAD~6
#   rubodiff 0f477ae
#
function rubodiff() {
  if [ "$1" =~ ^--help ]; then
    echo Usage: rubodiff [commit-spec] [rubocop-options]
    return
  fi

  if [ ! $1 ]; then
    COMMIT_SPEC=main
    RUBOCOP_ARGS=
  elif [ $1 =~ ^- ]; then
    COMMIT_SPEC=main
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

# Counts the occurrences of the specified string (recursively from current dir).
function count() {
  ag --count $1 | cut -f 2 -d: | awk '{ s += $1 } END { print s }'
}

# Runs rubycritic on production code changed in the current feature branch.
critic_branch() {
  if [[ "$1" == "" ]]
  then
    branch=main
  else
    branch=$1
  fi

  git diff --name-only --diff-filter=d $branch | \
    grep -v '_spec.rb$' | xargs -r rubycritic
}

# An improved version of pmkill that handles the case where no processes are listening.
alias pmkill='rm -f tmp/pids/unicorn3000.pid; kill_processes_listening_on 3000,5555 &>/dev/null'

# List the git SHA for the build that is in production.
function build_tag() {
  curl https://packmanager.nulogy.net/test/build_tag
}

# An improved version of pmkill that handles the case where no processes are listening.
alias pmkill='rm -f tmp/pids/unicorn3000.pid; kill_processes_listening_on 3000,5555 &>/dev/null'

# Open our HR system
alias lattice='open https://nulogy.latticehq.com'


# -----------------------------------------------------------------------------
# Node Version Manager
# -----------------------------------------------------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

# Calling nvm use automatically in a directory with a .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
 local node_version="$(nvm version)"
 local nvmrc_path="$(nvm_find_nvmrc)"
 if [ -n "$nvmrc_path" ]; then
   local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
   if [ "$nvmrc_node_version" = "N/A" ]; then
     nvm install
   elif [ "$nvmrc_node_version" != "$node_version" ]; then
     nvm use
   fi
 elif [ "$node_version" != "$(nvm version default)" ]; then
   echo "Reverting to nvm default version"
   nvm use default
 fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


# -----------------------------------------------------------------------------
# Yarn Package Manager
# -----------------------------------------------------------------------------

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# ----------------------------------------------------------------------------
# ZSH Autosuggestions (instead of using the oh-my-zsh plugin)
# -----------------------------------------------------------------------------

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# -----------------------------------------------------------------------------
# Add the GNU command line tools to the front of the PATH
# -----------------------------------------------------------------------------

# This has been causing some issues runnin shared scripts. The commands are
# always available with a 'g' prefix.

# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"


# -----------------------------------------------------------------------------
# Odds and Sods
# -----------------------------------------------------------------------------

alias taxes='open /Users/alistairm/Dropbox/Taxes_with_Jason/taxes.numbers'
alias tracking='open https://www.canadapost-postescanada.ca/track-reperage/en#/search\?searchFor=8219549129494366'


# -----------------------------------------------------------------------------
# Supports custom environments using direnv
# -----------------------------------------------------------------------------

# Disabled for the moement...
# eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
