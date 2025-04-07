# Alistair's Settings

# Prompt
PS1="\[\e[1;30;47m\]| \w @ \h (\u) \n| => \[\e[0m\]"
PS2="\[\e[1;30;47m\]| => \[\e[0m\]"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Bash History (Source: http://stackoverflow.com/questions/68372/what-is-your-single-most-favorite-command-line-trick-using-bash Answer 47)

# No duplicates saved to history; Commands that start with a space are not saved to history
export HISTCONTROL="erasedups:ignoreboth"

# Specify how much history to keep
export HISTFILESIZE=500000
export HISTSIZE=100000

# Specify commands to exclude from history
export HISTIGNORE="exit:pwd:history"

# Save to history after each command finishes
# export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Append to history
shopt -s histappend

# Configuration
export EDITOR="subl"

# Java Tools
export JAVA_HOME=$(/usr/libexec/java_home)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
