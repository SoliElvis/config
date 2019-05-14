if [[ $- != *i* ]] ; then
# Shell is non-interactive. Be done now!
return
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
## Bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Colors
if [ -f ~/.dir_colors ]; then
eval `dircolors ~/.dir_colors`
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi



export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export BASH_IT_THEME='clean'
stty -ixon # disable XON/XOFF flow control (^s/^q)
complete -cf sudo # Tab complete for sudo

# shopt options
shopt -s cdspell # This will correct minor spelling errors in a cd command.
shopt -s histappend # Append to history rather than overwrite
shopt -s checkwinsize # Check window after each command
shopt -s dotglob # files beginning with . to be returned in the results of path-name expansion.

# set options
set -o noclobber # prevent overwriting files with cat
set -o ignoreeof # stops ctrl+d from logging me out

source /usr/bin/virtualenvwrapper.sh

export BASH_IT="/home/sole/.bash_it"
export GIT_HOSTING='git@git.domain.com'
unset MAILCHECK
export IRC_CLIENT='irssi'
export TODO="t"
export SCM_CHECK=true
#export SHORT_HOSTNAME=$(hostname -s)

#export SHORT_USER=${USER:0:8}
#export SHORT_TERM_LINE=true
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt
# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
