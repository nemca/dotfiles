export PATH="/usr/local/sbin:$PATH:/usr/local/go/bin"
export SHMUX_SSH_OPTS='-qxA'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -lh'
alias e='executer'
alias s='ssh'
alias tl='while :; do clear; executer --cache task list 2>&1| egrep "(^OCORBA|^CORBA|^ROOT)"; sleep 10; done'
#alias tmux='tmux attach || tmux new'
alias tm='tmux'
alias em='emacs'
#alias vim='mvim -v'
alias hz_activate='source ~/haze/bin/activate'
alias ipython='ipython --profile=nemca'

# Docker
eval "$(boot2docker shellinit >/dev/null 2>&1)"
export DOCKER_CERT_PATH="$HOME/.boot2docker/certs/boot2docker-vm/"
export DOCKER_TLS_VERIFY="$HOME/.boot2docker/certs/boot2docker-vm/"

NAME=`/usr/local/bin/whoami`
DOMAIN=`hostname -f | cut -d. -f1`
#DOMAIN="ari"
#COLOR_NAME="38;5;27"
COLOR_NAME="38;5;33"
COLOR_NAME_ROOT="31"
COLOR_DOMAIN="38;5;111"
#export PS1="\[\e[${COLOR_NAME}m\]${NAME}\[\e[${COLOR_DOMAIN}m\].${DOMAIN}\[\e[0m\]:\w$ "
if [[ $UID -ne 0 ]]; then
	export PS1="\[\e[${COLOR_NAME}m\]${DOMAIN} \[\e[0m\]\w $ "
else
	export PS1="\[\e[${COLOR_NAME_ROOT}m\]${DOMAIN} \[\e[0m\]\w # "
fi
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki
#export EDITOR="mvim -v"
export EDITOR="vim"
export PAGER="less"
export LESSCHARSET='UTF-8'
export GREP_COLOR='1;32'
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT='%F %T '

#export OS_AUTH_URL=http://identity.haze.yandex-team.ru/v3
export OS_AUTH_URL=https://identity.cloud.yandex-team.ru/v2.0
#export OS_AUTH_URL=https://identity.cloud.yandex-team.ru/v3
export OS_TENANT_NAME="root"
export OS_REGION_NAME="sas"
export OS_USERNAME="nemca"
export OS_PASSWORD=""

# Golang
#export GOPATH="/usr/local/go"
#export GOROOT="/usr/local/go"
#export GOBIN="/usr/local/go/bin"
#export GOPATH="/usr/local/go/:/Users/nemca/scripts/go"

# Mac
if [ -f /usr/local/Cellar/bash-completion/1.3/etc/bash_completion ]; then
    . /usr/local/Cellar/bash-completion/1.3/etc/bash_completion
fi
# Linux
if [[ -f "/etc/bash_completion" ]]; then
	    . /etc/bash_completion
fi

# ssh-agent
#if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval `ssh-agent -s` 1>/dev/null 2>&1
	ssh-add 1>/dev/null 2>&1
#fi
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

echo `curl -s -m 3 http://fucking-great-advice.ru/api/random |jq -r '.text'| w3m -dump -T text/html`
