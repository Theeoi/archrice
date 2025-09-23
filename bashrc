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
alias clear='clear -x'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

function git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1=
if [[ $SSH_CONNECTION ]]; then
    PS1+='\[\e[38;5;51;1m\]\u\[\e[22;2;2m\]@\[\e[22;1;1m\]\H\[\e[22m\]'
fi
PS1+=':\[\e[38;5;47;1m\]\w\[\e[0m\] \[\e[38;5;24m\]$(git_branch)\[\e[0m\] \[\e[38;5;214;1m\]>\[\e[0m\] '

# Ensure only one ssh-agent is running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

export AUDIT_NUM=$(cat ~/.cache/auditnum.txt)
fastfetch
