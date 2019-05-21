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
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Shell variables
export OOO_FORCE_DESKTOP=gnome soffice
export BROWSER='chromium'
export PAGER=less
export EDITOR=vim
export PATH=$PATH:$HOME/bin:/usr/local/bin:/home/sole/.emacs.d/bin:$HOME/myScripts
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

alias tma="tmux attach -t"
alias apts="apt-cache search"
alias apti="sudo apt-get install"
alias j="jobs"
alias e="emacs &"
alias ftg="git status"

complete -cf sudo # Tab complete for sudo

# shopt options
shopt -s cdspell # This will correct minor spelling errors in a cd command.
shopt -s histappend # Append to history rather than overwrite
shopt -s checkwinsize # Check window after each command
shopt -s dotglob # files beginning with . to be returned in the results of path-name expansion.

# set options
set -o noclobber # prevent overwriting files with cat
set -o ignoreeof # stops ctrl+d from logging me out

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#source /usr/bin/virtualenvwrapper.sh


# Path to the bash it configuration
export BASH_IT="/home/fredoboileau/.bash_it" # Lock and Load a custom theme file.
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh


# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it
# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='clean'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
