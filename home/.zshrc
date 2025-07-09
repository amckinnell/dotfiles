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

# Increase file descripters limit from the default of 256. 
ulimit -n 4096

# Postgres App command line tools.
# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# We want to run the OpenJDK for java.
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# We want to run the latest Oracle distribution.
# export JAVA_HOME=`/usr/libexec/java_home`

# Add any java command line tools.
# JAVA_TOOLS_HOME=~/dev/java
# export PATH=$PATH:$JAVA_TOOLS_HOME/apache-maven-3.3.3/bin
# export PATH=$PATH:$JAVA_TOOLS_HOME/apache-ant-1.9.6/bin
# export PATH=$PATH:$JAVA_TOOLS_HOME/gradle-2.9/bin

BUNDLED_COMMANDS=(appraisal nucop overmind rails)
plugins=(brew bundler dash git history-substring-search kubectl nulogy sublime tldr z)

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
# export EDITOR="rubymine -w"

# Use Visual Studio Code as my text editor.
# export EDITOR="code -w"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Add my scripts to the front of the PATH
export PATH=~/dev/scripts:$PATH

# Opens gmail from the command line
alias amg='open -a "Safari" https://mail.google.com/mail/u/0/#inbox'
alias amn='open -a "Google Chrome" https://mail.google.com/mail/u/0/#inbox'

# The BFG repo cleaner (see https://rtyley.github.io/bfg-repo-cleaner/)
# alias bfg='java -jar $JAVA_TOOLS_HOME/bfg/bfg-1.12.8.jar'

# Clear oopsie .idea project
alias clear_idea='rm -rf .idea'

# Shows the branches that have been merged
alias lm=locally_merged

# Display the path one directory on each line
alias path='tr ":" "\n" <<< $PATH'

# Lurkers (see https://blog.testdouble.com/posts/2020-04-07-favorite-things/)
alias ls='eza'

# Shows the current wi-fi password (you have to authenticate)
# Install command line tool using 'brew install wifi-password'
alias wifi='wifi-password -q'

# Source from a file that will not go into my dotfiles repo
[ -f .zshrc_private ] && source .zshrc_private

# Go to the project root directory.
alias cdr='cd $(git rev-parse --show-toplevel)'

# Install the Homebrew Command Not Found tool
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
  source "$HB_CNF_HANDLER";
fi

# Various files to record log of my personal and work activities
alias al='subl ~/alistair_log.md'
alias awl='subl ~/alistair_work_log.md'


# -----------------------------------------------------------------------------
# General Development
# -----------------------------------------------------------------------------

alias dev='cd ~/dev'

# Makes my Nulogy SSH key available.
ssh-add ~/.ssh/nulogy_rsa 2>/dev/null;

# Choose openssl over native OS X libraries.
export PATH=/usr/local/opt/openssl/bin:$PATH

# Hide Thor deprecation warnings.
export THOR_SILENCE_DEPRECATION=1

# Speed up brew process boot time..
export HOMEBREW_BOOTSNAP=1

# Even less typing to open the files from the current branch in RubyMine.
alias mb='mine_branch'

# Override the gpf alias from the oh-my-zsh git plugin.
alias gpf='git push --force-with-lease'


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


# --------------------------------------
# Python environment
# --------------------------------------

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# -----------------------------------------------------------------------------
# PackManager Development
# -----------------------------------------------------------------------------

# Simplify interactions with AWS CLI
export AWS_PAGER=""

# Add to path for the rabbitmq-server
# export PATH=$PATH:/usr/local/sbin

# Add the libpq binaries to the path
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PACKMANAGER_DIR=~/src/packmanager

PACKMANAGER_ALISTAIR=$PACKMANAGER_DIR/alistair

# Handy ways to get to the packmanager directories
PACKMANAGER_HOME=~/src/packmanager

# Helps the Sales Demo Conversion project find PackManager
export PACKMANAGER_ROOT=$PACKMANAGER_DIR/main

# Create a Packmanager user
alias pm_user='rails nulogy:user_management:create_admin[alistairm@nulogy.com,Password1]'

# Start packmanager with all processes running
alias fsa='fs -f "$PACKMANAGER_ALISTAIR/Procfile.all" -d .'

# Disable the spring pre-loader
export DISABLE_SPRING=1

# Use this browser for running acceptance specs and features
export CAPYBARA_DRIVER=chrome
# export CAPYBARA_DRIVER=selenium

# Caputure screenshots when running acceptance specs and features
export CAPYBARA_SCREENSHOT=1

# Do not clear the test logs after each run
export PM_DEV_PRESERVE_TEST_LOG=1

alias use_chrome='export CAPYBARA_DRIVER=chrome'
alias use_chrome_headless='export CAPYBARA_DRIVER=chrome_headless'
alias use_firefox='export CAPYBARA_DRIVER=selenium'

alias outdated='./development/scripts/outdated_gems/outdated_gems.rb'

# Rails Next directories
PACKMANAGER_RAILS_NEXT=$PACKMANAGER_DIR/rails_next

alias rails_next='cd $PACKMANAGER_RAILS_NEXT'

# Run locally with RAILS NEXT?
export RAILS_NEXT=false

function ruby_prompt() {
  ruby --version | cut -d' ' -f 2
}

function rails_next_prompt() {
  if [[ "$RAILS_NEXT" == "true" ]]; then
    echo "~"
  fi
}

# Enable deprecations for local development.
export PM_DEV_ENABLE_DEPRECATIONS=true

# Enable static database analysis.
export PM_DEV_ENABLE_STATIC_DATABASE_ANALYSIS=true

export PM_DEV_ENABLE_BETTER_ERRORS_EDITOR="x-mine://open?file=%{file}&line=%{line}"

function rails_next_deprecations() {
  $PACKMANAGER_HOME/main/development/rails_upgrade/collect_rails_deprecation_warnings.rb "aa761ad6eed0e8c05519bbddb1036d6c711a5947" "$1"
}

function mine() {
  if [[ "$RAILS_NEXT" = true ]]; then
    export RUBYMINE_PROPERTIES=$HOME/src/rubymine_rails_next/idea.properties
  else
    unset RUBYMINE_PROPERTIES
  fi

  open -na /Applications/RubyMine.app $@
}

function mine_branch() {
  /Applications/RubyMine.app/Contents/MacOS/rubymine `git diff --name-only --diff-filter=d main` &>/dev/null
}

alias rc='main && env_rails_current'
alias rn='rails_next && env_rails_next'
alias rn_deprecations='rails_next_deprecations'

# Flush memcached
alias flush_mem_cache_server="echo 'flush_all' | nc 127.0.0.1 11211"

# Enable logging in the browser
export PM_DEV_BROWSER_LOGGING=true

# Enable profiling tools in the browser (use 1 for enabled)
export PM_DEV_ENABLE_PROFILING=0

# Reduce the console noise in development by increasing the polling interval
export PM_DEV_POLLING_INTERVAL_IN_SECONDS=600

# Enable the database analysis gems
export PM_DEV_STATIC_DATABASE_ANALYSIS=true

# Debugging tweaks
export CAPYBARA_MAX_WAIT_TIME=600
export PM_DEV_REQUEST_TIMEOUT_IN_MINUTES=10

# Enable bootsnap at startup
export PM_DEV_ENABLE_BOOTSNAP=true

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

# Open the SF3 team cloud resources
alias sf3_aws_console="open 'https://us-east-1.console.aws.amazon.com/console/home\?region\=us-east-1\#'"
alias sf3_aws_rds="open 'https://us-east-1.console.aws.amazon.com/rds/home\?region\=us-east-1\#'"
alias sf3_board='nutrella sf3_board'
alias sf3_engineering_initiatives="open 'https://docs.google.com/spreadsheets/d/179sAI9BfByHiKv2sIlDvQLwZIKlqpYn4zOUD2kFwfQU/edit#gid=40839495'"
alias sf3_health_check="open 'https://lucid.app/lucidspark/5783b82f-e663-494b-a377-45326062c660/edit?viewport_loc=-6315%2C-1266%2C10684%2C5198%2CUSVfsZ0KvO5c5&invitationId=inv_0a86b46d-00ae-4c79-ab80-4cecee42a619'"
alias sf3_kanban="open 'https://nulogy-go.atlassian.net/jira/software/c/projects/PM/boards/215?quickFilter=601'"
alias sf3_mission_control="open 'https://lucid.app/lucidspark/d379ca21-991d-4f6b-9276-f287afff2bd6/edit?page=FdOixYiDcHIf0&invitationId=inv_c3d6be92-9c2f-45b7-830e-a2ed73dee085#'"
alias sf3_mobtime="open 'https://mobti.me/sf3'"
alias sf3_rds="open 'https://us-east-1.console.aws.amazon.com/rds/home\?region\=us-east-1\#'"
alias sf3_replenishment="open 'https://docs.google.com/document/d/1F6QDYJyVzfvnpsx7bTitGksYhLtmlkfuVs05mgJV6SM/'"
alias sf3_room="open 'https://nulogy.zoom.us/j/99700778567?pwd=DraTPTaaaDEzO0aHMrd7YwRRw5TXiN.1'"
alias sf3_transient_specs="open 'https://docs.google.com/spreadsheets/d/1FNYGEKXfcGeHKqf62J6Lp9cLTSBXwXH9fZdjZ2gtx38/'"
alias sf3_translations="open 'https://trello.com/b/0gksZm7F/shop-floor-translation-process'"
alias sf3_trello='nutrella sf3_board'

# Open the Crescent DTC Pilot team cloud resources
alias dtc_board="nutrella 'Crescent DTC Pilot'"
alias dtc_room="open https://nulogy.zoom.us/my/emilyshepherd"
alias dtc_trello="nutrella 'Crescent DTC Pilot'"

# Run the Automated Production Entry features and specs
# alias ape_features='spring rails ape:features'
# alias ape_specs='spring rails ape:specs'

# User Management
alias um_alistairm='rake "nulogy:user_management:create_admin[alistairm@nulogy.com]"'

# Index page for all Nulogy Okta apps
alias okta_apps='open https://nulogy.okta.com/app/UserHome'

# Kills the running gulp tasks that I created.
alias kill_gulp='killall -KILL -q -u $USER gulp'

# Kills all the running node tasks that I created.
alias kill_nodes='killall -KILL -q -u $USER node'

# Kills all the running ruby tasks that I created.
alias kill_rubies='killall -KILL -q -u $USER ruby'

# My favourite way to use Sentry
alias sentry='open https://sentry.io/organizations/nulogy/issues/\?environment=prod-eu\&environment=prod-na\&environment=prod-training\&statsPeriod=24h'

# Alias to the New Relic CLI (avoids a clash the newrelic binary from the newrelic_rpm gem)
alias nr=/opt/homebrew/bin/newrelic


# -----------------------------------------------------------------------------
# Query Each Schema
# -----------------------------------------------------------------------------

query_inline() {
  pushd ./development/scripts/query_each_schema
  query_each_schema using_inline_query --environment "$($1)" --query "$2"
  popd
}

query_with_file() {
  setopt local_traps 

  pushd ./development/scripts/query_each_schema
  query_each_schema using_query_file --environment "$($1)" --format-csv --from-file "$2"
  popd
}

db_na() {  echo na-production }
db_eu() {  echo eu-production }
db_training() { echo packmanager-training }


# -----------------------------------------------------------------------------
# Sales Demo Development
# -----------------------------------------------------------------------------

alias sales_demo_pipeline='open https://buildkite.com/nulogy-corp/opscore-create-demo/builds\?branch=main'

# Handy way to get to the sales demo conversion directory
alias sales_demo_conversion='cd ~/src/sales_demo_conversion'

# Handy way to get to the sales demo directory
alias sales_demo='cd ~/src/sales-demo'


# -----------------------------------------------------------------------------
# Production Scheduling Development
# -----------------------------------------------------------------------------

# Needed to seed your user in the local database:
export PRODUCTION_SCHEDULING_EMAIL=alistairm@nulogy.com

# Ensure you have a unique consumer for the message bus:
export MESSAGE_BUS_CONSUMER_GROUP_ID=alistairm-consumer-group


# -----------------------------------------------------------------------------
# Supplier Collaboration Development
# -----------------------------------------------------------------------------

export SSO_CLIENT_ID="dSOg9SRjJbyTcgegHKyKJKh6oXyZoSeQ"
export SSO_CLIENT_SECRET="2lyXujfXl9mqEBJu6DV2hHTbF-5yCQhHxqPotUXdDlZaw94J3al44sAY8I7BGmi7"


# -----------------------------------------------------------------------------
# Manage local development database
# -----------------------------------------------------------------------------

function reset_candy_pack() {
  spring rails db:reset \
    nulogy:tdc:candy_pack:schedule:fs_variety_mix \
    "nulogy:user_management:create_admin[alistairm@nulogy.com,Candy Pack]" \
    "nulogy:tdc:move_nulogy_user_to_catalog[alistairm@nulogy.com,Candy Pack]"
  RAILS_ENV=test spring rails db:seed:replant
}


# -----------------------------------------------------------------------------
# QCloud Development
# -----------------------------------------------------------------------------

export QCLOUD_DIR=~/src/QCloud

# Handy way to get to the various QCloud directories
alias qcloud='cd $QCLOUD_DIR'

# Handy way to get to the various DQI directories
alias dqi='cd $QCLOUD_DIR'

# See Language & Region System Preference on OS X
export TWENTY_FOUR_HOUR_CLOCK=true


# -----------------------------------------------------------------------------
# Candidates for oh-my-zsh-plugins
# -----------------------------------------------------------------------------

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

# Counts the occurrences of the specified string (recursively from current dir).
function count() {
  ag --count $1 | cut -f 2 -d: | awk '{ s += $1 } END { print s }'
}

# Runs rubycritic on production code changed in the current feature branch.
function critic_branch() {
  if [[ "$1" == "" ]]
  then
    branch=main
  else
    branch=$1
  fi

  git diff --name-only --diff-filter=d $branch | \
    grep -v '_spec.rb$' | xargs -r rubycritic
}

# Runs rubycritic on the PackManaager codebase
function critic_packmanager() {
  find ./modules -type f -name '*.rb' ! -name '*_spec.rb*' ! -name '*.lock' ! -name 'Gemfile' ! -name 'routes.rb' | xargs rubycritic  --churn-after 2023-12-01
}

# Runs rubycritic on PackManager application records.
function critic_application_record() {
  rg --files-with-matches ' < ApplicationRecord' | xargs rubycritic --churn-after 2000-01-01
}

# List the git SHA for the build that is in production.
function build_tag() {
  curl https://app.nulogy.net/test/build_tag
}

# Open our Bamboo HR system
alias bamboohr='open https://nulogycorp.bamboohr.com/home/'

# Authorization for AWS
alias auth='docker run --rm -it --entrypoint='' -v ~/.aws/:/root/.aws -v ~/.kube/:/root/.kube public.ecr.aws/nulogy/nulogy-deployer:latest auth.sh'

# Best alias for pushing a branch
alias ngp="spring rspec modules/generic/nulogy_other_teams/spec/integration/nulogy_other_teams_spec.rb && nucop diff_enforced && (gpf || gpsup)"

function codegen() {
  rails private_graphql_api:generate_schema tng_graphql_api:generate_schema other_teams:update
}


# -----------------------------------------------------------------------------
# Yarn Package Manager
# -----------------------------------------------------------------------------

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# ----------------------------------------------------------------------------
# ZSH Autosuggestions (instead of using the oh-my-zsh plugin)
# -----------------------------------------------------------------------------

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# -----------------------------------------------------------------------------
# Add the GNU command line tools to the front of the PATH
# -----------------------------------------------------------------------------

# This has been causing some issues running shared scripts. The commands are
# always available with a 'g' prefix. Adjust as needed.

# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"


# -----------------------------------------------------------------------------
# Odds and Sods
# -----------------------------------------------------------------------------

# alias tracking='open https://www.canadapost-postescanada.ca/track-reperage/en#/search\?searchFor=8219549129494366'
# alias tracking='open https://tools.usps.com/go/TrackConfirmAction\?tLabels=CJ496029137US#'
# alias tracking='open https://www.canadapost-postescanada.ca/track-reperage/en#/details/CJ496029137US'

alias estate_log='open /Volumes/Alistair\ Local/Gwen\ Mckinnell\ Estate/log.md'


# -----------------------------------------------------------------------------
# Remove any duplicate entries from the path
# -----------------------------------------------------------------------------

export PATH=$(echo "$PATH" | awk -v RS=: -v ORS=: '!(a[$0]++)' | sed 's/:$//')


# -----------------------------------------------------------------------------
# Activate mise-en-place (https://mise.jdx.dev/)
# -----------------------------------------------------------------------------

eval "$(mise activate zsh)"
