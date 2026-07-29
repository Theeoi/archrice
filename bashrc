#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"
export CODEX_HOME="$XDG_CONFIG_HOME/codex"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'
alias clear='clear -x && fastfetch'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

function git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1=
if [[ $SSH_CONNECTION ]]; then
    PS1+='\[\e[38;5;51;1m\]\u\[\e[22;2;2m\]@\[\e[22;1;1m\]\H\[\e[22m\]'
fi
PS1+=':\[\e[38;5;47;1m\]\w\[\e[0m\] \[\e[38;5;24m\]$(git_branch)\[\e[0m\] \[\e[38;5;214;1m\]>\[\e[0m\] '

# Ensure only one ssh-agent is running
agent_env="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/ssh-agent.env"

ssh_agent_is_available() {
    [[ -S "${SSH_AUTH_SOCK:-}" ]] || return 1

    ssh-add -l >/dev/null 2>&1
    local status=$?

    ((status == 0 || status == 1))
}

if [[ -r "$agent_env" ]]; then
    source "$agent_env" >/dev/null
fi

if ! ssh_agent_is_available; then
    rm -f -- "$agent_env"
    ssh-agent -t 1h >"$agent_env"
    source "$agent_env" >/dev/null
fi

unset agent_env
unset -f ssh_agent_is_available

# Startup default tmux session every time
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    if ! systemctl --user is-active --quiet tmux.service; then
        systemctl --user start tmux.service
    fi
    exec tmux new-session -A -s "${USER}" >/dev/null 2>&1
fi

export AUDIT_NUM=$(cat ~/.cache/auditnum.txt)
fastfetch
