#https://github.com/adi1090x/termite-style
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


function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# Shell variables
export OOO_FORCE_DESKTOP=gnome soffice
export BROWSER='brave'
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
export TERM=xterm-256color

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
[ -f ~/.bashrc.aliases ] && source ~/.bashrc.aliases

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
