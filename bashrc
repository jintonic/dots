# ~/.bashrc: executed for non-login shells.

# If not running interactively, just export PATH
PATH=.:~/bin:$PATH
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history,
# and erase already existing duplicated lines
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="[ \t]*:&:l[lsa]:[bf]g:exit"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# color prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
else
  color_prompt=
fi

# Define colors
red="\[\e[0;31m\]"
RED="\[\e[1;31m\]"
green="\[\e[0;32m\]"
GREEN="\[\e[1;32m\]"
yellow="\[\e[0;33m\]"
YELLOW="\[\e[1;33m\]"
blue="\[\e[0;34m\]"
BLUE="\[\e[1;34m\]"
magenta="\[\e[0;35m\]"
MAGENTA="\[\e[1;35m\]"
cyan="\[\e[0;36m\]"
CYAN="\[\e[1;36m\]"
PLAIN="\[\e[0m\]"

if [ "$color_prompt" = yes ]; then
  PS1="${GREEN}\u@\H:${BLUE}\w\n${MAGENTA}[\!]${PLAIN} "
else
  PS1='\u@\H:\w\n[\!] '
fi
unset color_prompt

# set screen titles automatically
# PROMPT_COMMAND='echo -n -e "\033k\033\\"'
case "$TERM" in
  screen)
    PROMPT_COMMAND='echo -n -e "\033k\033\\"'
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -AlFh'
alias la='ls -Ah'
alias l='ls -CFh'

alias df='df -h'
alias du='du -h'

alias sd='screen -D -RR'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

alias t='task'
complete -o nospace -F _task t

export WWW_HOME=~/.w3m/bookmark.html
export LYNX_CFG=~/.lynx/lynx.cfg

if [ -f ~/.bash_local ]; then . ~/.bash_local; fi
