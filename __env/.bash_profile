#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Shell variables
export OOO_FORCE_DESKTOP=gnome soffice
export BROWSER='chromium'
export PAGER=less
export EDITOR=vim
export PATH=$PATH:$HOME/bin:/usr/local/bin:$HOME/.emacs.d/bin:$HOME/apps
export LESS='-R'
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
export SANE_DEFAULT_DEVICE="brother4:bus4;dev3"
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
export PYSPARK_SUBMIT_ARGS="--master local[2] pyspark-shell"
export JAVA_HOME="/usr/bin/java"
export PROJECT_HOME=$HOME/apps/
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
