# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
# saves each command right after it's been executed, not at the end of the session
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'
alias llt=' ls -lht'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable:\
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi
source /GWD/bioinfo/projects/cb-software/personal/ef884766/etc/profile.d/bash_completion.sh
source /GWD/bioinfo/projects/cb-software/personal/ef884766/etc/profile.d/git-completion.bash

# window title
export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"'

# prompt
export PS1='\[\e[1m\]┌─[\u@\h][\w]\n\[\e[1m\]└─[\$]\[\e[0m\] '

# bin
export PATH=/GWD/bioinfo/projects/cb-software/personal/ef884766/bin:$PATH

# lib
export LIBRARY_PATH=/GWD/bioinfo/projects/cb-software/personal/ef884766/lib64:/GWD/bioinfo/projects/cb-software/personal/ef884766/lib
export LD_LIBRARY_PATH=/GWD/bioinfo/projects/cb-software/personal/ef884766/lib64:/GWD/bioinfo/projects/cb-software/personal/ef884766/lib

# include
export C_INCLUDE_PATH=/GWD/bioinfo/projects/cb-software/personal/ef884766/include
export CPLUS_INCLUDE_PATH=/GWD/bioinfo/projects/cb-software/personal/ef884766/include

# man
export MANPATH=/GWD/bioinfo/projects/cb-software/personal/ef884766/share/man:$MANPATH

# flags
export CFLAGS="-I/GWD/bioinfo/projects/cb-software/personal/ef884766/include"
export CPPFLAGS="-I/GWD/bioinfo/projects/cb-software/personal/ef884766/include"
export LDFLAGS="-L/GWD/bioinfo/projects/cb-software/personal/ef884766/lib64 -L/GWD/bioinfo/projects/cb-software/personal/ef884766/lib" 

# Perlbrew
source /GWD/bioinfo/projects/cb-software/personal/ef884766/perl5/etc/bashrc

# R
#export R_LIBS_USER=/GWD/bioinfo/projects/cb-software/personal/ef884766/lib64/R/library

# Oracle Database (MetaBaseR)
export ORACLE_HOME=/GWD/bioinfo/share/oracle/current
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/GWD/bioinfo/projects/cb-software/personal/ef884766/opt/oracle

# Oracle Java (rJava)
export JAVA_HOME=/GWD/bioinfo/projects/cb-software/personal/ef884766/opt/jdk/jre
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/GWD/bioinfo/projects/cb-software/personal/ef884766/opt/jdk/jre/lib/amd64/server

# Sun Grid Engine
source /GWD/appbase/projects/lsf/SGE/6.2u5/default/common/settings.sh

# old bioinfo software
export PATH=$(echo $PATH | sed 's|/GWD/bioinfo/common/scripts:||')

# Vim-R-plugin
#alias vim='vim --servername VIM'

# z
source /GWD/bioinfo/projects/cb-software/personal/ef884766/etc/z/z.sh

# Fix backspace problem
stty erase ^?
# also for sqlite
alias sqlite3='stty erase ^H && sqlite3'

# Search back and forth
stty -ixon

# Set vim mode
set -o vi
bind -m vi-insert "\C-l":clear-screen

# set default permissions
umask 002

# Proxy configuration
source ~/.proxyrc
