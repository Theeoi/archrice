#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

function git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\033[1;32m\]\u@\h\[\033[1;37m\] \W \[\033[0;36m\]$(git_branch)\[\033[1;32m\]->\[\033[00m\] '

fastfetch
