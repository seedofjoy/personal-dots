#!/bin/bash 
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export PS1="\[\e[0;32m\]\w\[\e[0m\] $ "

case $OSTYPE in
    darwin*)
        # MySQL and Homebrew
        export PATH="/usr/local/mysql/bin:/usr/local/bin:$PATH"
        ;;
esac

#
# Aliases
#
alias ll='ls -alh'

alias mv='mv -v'
alias cp='cp -v'
alias cpr='cp -r'
alias mkdir='mkdir -v'

alias df="df -h"
alias du="du -h"

alias py='python'
alias ipy='ipython'
