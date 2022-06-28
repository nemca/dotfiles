# =============
#  ENVIRONMENT
# =============
BREWHOME="/usr/local"
if [[ "arm" == $(uname -p) ]]; then
    BREWHOME="/opt/homebrew"
fi
export PATH="${BREWHOME}/opt/coreutils/libexec/gnubin:$PATH"
export PATH="${BREWHOME}/opt/openssl@1.1/bin:$PATH"
export PATH="${BREWHOME}/opt/curl/bin:$PATH"
export PATH="${BREWHOME}/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="${BREWHOME}/opt/gnu-getopt/bin:$PATH"
export PATH="${BREWHOME}/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="${BREWHOME}/opt/grep/libexec/gnubin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="${BREWHOME}/bin:/opt/homebrew/sbin:$PATH"

export CDPATH="$HOME/git/nemca:$HOME/git/mixanemca:$HOME/go/src/github.com/mixanemca:$HOME/go/src/github.com/nemca:$HOME/git/p2p-org"

export LDFLAGS="-L${BREWHOME}/opt/openssl@1.1/lib"
export CPPFLAGS="-I${BREWHOME}/opt/openssl@1.1/include"

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export GREP_COLORS="ms=01;32:mc=01;32:sl=:cx=:fn=35:ln=32:bn=32:se=36"

export GPG_TTY=$(tty)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc-private ] && source ~/.zshrc-private

# Disable security to restrict multithreading
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# =============
#    ALIAS
# =============
alias ..='cd ..'
alias gg='git grep'
alias ll='ls -l'
alias ls='ls --color=auto --group-directories-first --si'
alias grep='grep --color=auto --devices=skip'
alias egrep='egrep --color=auto --devices=skip'
alias fgrep='fgrep --color=auto --devices=skip'

# =============
#    OPTIONS
# =============
setopt promptsubst
setopt interactivecomments
setopt histignoredups
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol

# =============
#    PROMPT
# =============
autoload -U colors && colors

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg_bold[blue]%}%c%{$reset_color%} $(git_prompt_info)${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get customzsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')

  if [[ "$(command git config --get customzsh.hide-dirty)" != "1" ]]; then
    FLAGS+='--ignore-submodules=dirty'
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi

  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# ===================
#    AUTOCOMPLETION
# ===================
# enable completion
autoload -Uz compinit
compinit

autoload bashcompinit
bashcompinit

zmodload -i zsh/complist

WORDCHARS=''

# autocompletion with an arrow-key driven interface
zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

zstyle '*' single-ignored show

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

complete -o nospace -C ${BREWHOME}/bin/consul consul
complete -o nospace -C ${BREWHOME}/bin/minio-client minio-client

# ===================
#    KEY BINDINGS
# ===================
# Use emacs-like key bindings by default:
bindkey -e

# [Ctrl-r] - Search backward incrementally for a specified string. The string
# may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward

if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
fi

if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi

if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# Alt+Shirt+3 for comment
bindkey '^[#' pound-insert

# ===================
#    MISC SETTINGS
# ===================

# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# ===================
#    PLUGINS
# ===================

# These are installed via github.com/fatih/dotfiles/Brewfile
source ${BREWHOME}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${BREWHOME}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ===================
#    MISC FUNCTIONS
# ===================
t() {
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

# The next line updates PATH for the Google Cloud SDK.
[ -f '/Users/mbr/gcp/google-cloud-sdk/path.zsh.inc' ] && source '/Users/mbr/gcp/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
[ -f '/Users/mbr/gcp/google-cloud-sdk/completion.zsh.inc' ] && source '/Users/mbr/gcp/google-cloud-sdk/completion.zsh.inc'
