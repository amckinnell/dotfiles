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
export JAVA_HOME=$(/usr/libexec/java_home)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler gem git history-substring-search osx powder terminalapp zeus)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Configuration
export EDITOR="subl"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Add the Homebrew executables to the front of the PATH
export PATH=/usr/local/bin:$PATH

# Add my scripts to the front of the PATH
export PATH=/Users/alistair/dev/scripts:$PATH

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Data for each postgres database
export PGDATA=/usr/local/var/postgres postgres

# Create a timer from the command line
function timer() {
  timebar --duration $(($1 * 60))
}

# Ruby performance improvements (at a cost of increased memory)
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

# Initialize autojump with tab completion (github.com/joelthelion/autojump)
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
autoload -U compinit && compinit


# -----------------------------------------------------------------------------
# Pack Manager Development
# -----------------------------------------------------------------------------

export PACKMANAGER_DEV=/Users/alistair/src/packmanager/dev

# Handy way to get the the packmanager dev directory
alias dev='cd $PACKMANAGER_DEV'

# Local binstubs from bundler
export PATH=./bin:$PATH
