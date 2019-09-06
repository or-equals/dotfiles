. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

fpath=(
  $fpath
  ~/.rvm/scripts/zsh/Completion
  ~/.zsh/functions
  /usr/local/share/zsh/site-functions
)

# color term
export CLICOLOR=1
export LSCOLORS=Dxfxcxdxbxegedabadacad
export ZLS_COLORS=$LSCOLORS
export LC_CTYPE=en_US.UTF-8
export LESS=FRX

# make with the nice completion
autoload -U compinit; compinit

# Completion for kill-like commands
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:ssh:*' tag-order hosts users
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zshcache

# make with the pretty colors
autoload colors; colors

# just say no to zle vim mode:
bindkey -e

# options
setopt appendhistory extendedglob histignoredups nonomatch prompt_subst interactivecomments

# Bindings
# external editor support
autoload edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Partial word history completion
bindkey '\ep' up-line-or-search
bindkey '\en' down-line-or-search
bindkey '\ew' kill-region

if [ -z "$TMUX" ]; then
  fg-widget() {
    stty icanon echo pendin -inlcr < /dev/tty
    stty discard '^O' dsusp '^Y' lnext '^V' quit '^\' susp '^Z' < /dev/tty
    zle reset-prompt
    if jobs %- >/dev/null 2>&1; then
      fg %-
    else
      fg
    fi
  }

  zle -N fg-widget
  bindkey -M emacs "^Z" fg-widget
  bindkey -M vicmd "^Z" fg-widget
  bindkey -M viins "^Z" fg-widget
fi

# prompt
p=
if [ -n "$SSH_CONNECTION" ]; then
  p='%{$fg_bold[yellow]%}%n@%m'
else
  p='%{$fg_bold[green]%}%n@%m'
fi

# show non-success exit code in right prompt
RPROMPT="%(?..{%{$fg[red]%}%?%{$reset_color%}})"

# history
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# default apps
(( ${+PAGER}   )) || export PAGER='less'
(( ${+EDITOR}  )) || export EDITOR='vim'
export PSQL_EDITOR='vim -c"setf sql"'

# set cd autocompletion to commonly visited directories
cdpath=(~ ~/src $DEV_DIR $SOURCE_DIR)

# remove duplicates in $PATH
typeset -aU path

command -v brew > /dev/null && [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/local/opt/readline --with-jemalloc=/usr/local/opt/jemalloc"

alias hcd="cd ~/projects"
alias ss='rails server'
alias be="bundle exec"
alias resetdb="rake db:drop && rake db:create && rake db:migrate && rake db:seed"
alias groutes='rake routes | grep $@'
alias sc='rails console'

# File management aliases
#
alias ..='cd ..'
alias cd..='cd ..'
alias l="ls -F -G -lah"
alias la="ls -a"
alias ll='ls -l'
alias lsd='ls -ld *(-/DN)'
alias md='mkdir -p'
alias rd='rmdir'

# Git aliases
#
alias gap='git add -p'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gcl='git clean -f -d'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gl='git pull'
alias glg='git log --graph --oneline --decorate --color --all'
alias glod='git log --oneline --decorate'
alias glp='git log -p'
alias gnap='git add -N --ignore-removal . && gap && gref'
alias gp='git push'
alias gplease='git push --force-with-lease'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grim='git rebase -i master'
alias gst='git status'
alias reset-authors='git commit --amend --reset-author -C HEAD'

# Docker aliases
#
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"
alias dcs="docker-compose stop"
alias dcp="docker-compose ps"
alias dcl="docker-compose logs -f"
alias dcr="docker-compose run"
alias dce="docker-compose exec"

# Vim aliases
alias vi='nvim'
alias vim='nvim'

export PATH="/usr/local/opt/gettext/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Ruby/Rails functions
#
twiki () {
  rake db:migrate && rake db:migrate:redo && rake db:test:prepare
}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(… zsh-completions)

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
