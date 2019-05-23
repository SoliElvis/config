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
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Shell variables
export OOO_FORCE_DESKTOP=gnome soffice
export BROWSER='chromium'
export PAGER=less
export EDITOR=vim
export LESS='-R'
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
export SANE_DEFAULT_DEVICE="brother4:bus4;dev3"
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
export PYSPARK_SUBMIT_ARGS="--master local[2] pyspark-shell"
export JAVA_HOME="/usr/bin/java"
export PROJECT_HOME="/home/sole/apps/"
export TERMINAL=termite

complete -cf sudo # Tab complete for sudo

# shopt options
shopt -s cdspell # This will correct minor spelling errors in a cd command.
shopt -s histappend # Append to history rather than overwrite
shopt -s checkwinsize # Check window after each command
# set options
set -o noclobber # prevent overwriting files with cat
set -o ignoreeof # stops ctrl+d from logging me out
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh
# Path to the bash it configuration
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
#source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
