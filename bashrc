export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:/usr/local/sbin"
export CDPATH="/Users/mbr/git/avito:/Users/mbr/go/src/github.com/mixanemca"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gg='git grep'
alias ll='ls -lh'

tmux() {
  if [[ -n ${1} ]]; then
    if ! ssh ${1} ls -1 \$HOME/.tmux.conf 1>/dev/null 2>&1; then
      scp $HOME/.tmux.conf ${1}: >/dev/null
    fi
    if ! ssh ${1} ls -1 \$HOME/.vimrc 1>/dev/null 2>&1; then
      scp $HOME/.vimrc-servers ${1}:.vimrc >/dev/null
    fi
    ssh -t ${1} "tmux attach || tmux new -s mbr"
  fi
}

export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWSTASHSTATE="true"
export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWCOLORHINTS="true"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
[[ -r "/opt/homebrew/etc/bash_completion.d/git-completion.bash" ]] && . "/opt/homebrew/etc/bash_completion.d/git-completion.bash"
[[ -r "/opt/homebrew/etc/bash_completion.d/git-prompt.sh" ]] && . "/opt/homebrew/etc/bash_completion.d/git-prompt.sh"

NAME=`whoami`
#DOMAIN=`hostname -f | cut -d. -f1`
DOMAIN="mira"
#COLOR_NAME="38;5;27"
COLOR_NAME="38;5;33"
COLOR_NAME_ROOT="31"
COLOR_DOMAIN="38;5;111"
if [[ $UID -ne 0 ]]; then
  export PS1="\[\e[${COLOR_NAME}m\]${DOMAIN} \[\e[0m\]\W \$(__git_ps1 \"(%s)\")$ "
else
  export PS1="\[\e[${COLOR_NAME_ROOT}m\]${DOMAIN} \[\e[0m\]\w # "
fi

export EDITOR="vim"
export PAGER="less"
export LESSCHARSET='UTF-8'
export GREP_COLOR='1;32'
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT='%F %T '
export GITIN_LINESIZE=20
export GITIN_SEARCHMODE="fuzzy" # https://github.com/isacikgoz/gitin

# GPG
GPG_TTY=$(tty)
export GPG_TTY

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

if [[ -r /etc/profile.d/rvm.sh ]]; then
  source /etc/profile.d/rvm.sh
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/opt/gnu-getopt/bin:$HOME/go/bin:$PATH:$HOME/.rvm/bin"
if [[ -r $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm
fi

complete -C /usr/local/bin/mc mc
complete -W "$(curl --connect-timeout 1 --max-time 2 -sk https://dnsaas-proxy.msk.avito.ru/zone/info/?zone=msk.avito.ru | jq -r '.rrsets | .[] | .name')" tmux pup

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

complete -C /usr/local/bin/consul consul
