# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
# set -gx OMF_CONFIG "/Users/michael/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# alias vim='mvim -v'
alias vi='vim'
alias egrep='egrep --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias la='ls -la --sort=none'
alias weather-moscow='curl wttr.in/Moscow'
alias weather-bridgetown='curl wttr.in/Bridgetown'
alias chef-check='rubocop .; and foodcritic .'
alias ipy='ipython3'

set --export EDITOR vim
set --export PAGER less
set --export LESSCHARSET UTF-8
set --export GREP_COLOR '1;32'
set --export HISTCONTROL ignoredups
set --export HISTTIMEFORMAT '%F %T '
set --export LC_ALL en_US.UTF-8
set --export LANG en_US.UTF-8

# Set colors
set fish_color_autosuggestion "555 yellow"
set fish_color_command white
set fish_color_comment red
set fish_color_cwd 00875f
set fish_color_cwd_root red
set fish_color_end bcbcbc
set fish_color_error red --bold
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host cyan
set fish_color_match cyan
set fish_color_normal 5f5f5f
set fish_color_operator white
set fish_color_param normal
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_search_match --background=blue
set fish_color_selection --background=grey
set fish_color_status red
set fish_color_user cyan

# frees up ctrl-s and ctrl-q
stty -ixon -ixoff

# Golang
set --export GOROOT /usr/local/go
set --export GOBIN /usr/local/go/bin
set --export GOPATH /Users/michael/go:/usr/local/go

# PATH
set --export GNUBIN /usr/local/opt/gnu-tar/libexec/gnubin
set --export GNUBIN (brew --prefix coreutils)/libexec/gnubin
set --export PATH $GOBIN $GNUBIN $PATH

# MANPATH
# set --export GNUMANPATH /usr/local/opt/gnu-tar/libexec/gnuman
# set --export MANPATH $GNUMANPATH $MANPATH

# govc
set --export GOVC_URL spvcenter.vmware.northernlight.com
set --export GOVC_USERNAME 'nl\mbruskov'
set --export GOVC_PASSWORD Aeli9ohX
set --export GOVC_INSECURE 1
set --export GOVC_DATACENTER BDC

# govmomi (need nl-vmware-info)
set --export GOVMOMI_URL https://spvcenter.vmware.northernlight.com/sdk
set --export GOVMOMI_USERNAME 'nl\mbruskov'
set --export GOVMOMI_PASSWORD Aeli9ohX
set --export GOVMOMI_INSECURE true

# less colors for man pages
set --export LESS_TERMCAP_mb (printf "\033[01;31m")
set --export LESS_TERMCAP_md (printf "\033[01;38;5;74m")
set --export LESS_TERMCAP_me (printf "\033[0m")
set --export LESS_TERMCAP_se (printf "\033[0m")
set --export LESS_TERMCAP_so (printf "\033[38;5;016m\033[48;5;220m")
set --export LESS_TERMCAP_ue (printf "\033[0m")
set --export LESS_TERMCAP_us (printf "\033[04;38;5;146m")

# eval (chef shell-init fish)
