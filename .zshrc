export HOMEBREW_PREFIX=$(brew --prefix)

. $HOMEBREW_PREFIX/opt/asdf/asdf.sh

fpath=(
  $fpath
  ~/.zsh/functions
  /usr/local/share/zsh/site-functions
)

# color term
export CLICOLOR=1
export LSCOLORS=Dxfxcxdxbxegedabadacad
export ZLS_COLORS=$LSCOLORS
export LC_CTYPE=en_US.UTF-8
export LESS=FRX

# Make things play nice with Ruby installs
# Reference: https://or-equals-til.herokuapp.com/posts/mu6pubhqia-getting-ruby-installed-on-macs-with-the-apple-m1
export RUBY_CONFIGURE_OPTS="--with-zlib-dir=/opt/homebrew/opt/zlib --with-openssl-dir=/opt/homebrew/opt/openssl@1.1 --with-readline-dir=/opt/homebrew/opt/readline --with-libyaml-dir=/opt/homebrew/opt/libyaml"
export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"

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

# Just say no to zle vim mode:
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

# remove duplicates in $PATH
typeset -aU path

command -v brew > /dev/null && [[ -s $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ]] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh

export RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/local/opt/readline --with-jemalloc=/usr/local/opt/jemalloc"

# Rails alises
alias ss='bundle exec rails server'
alias be="bundle exec"
alias fr='forego run'
alias resetdb="bundle exec rails db:drop && bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails db:seed"
alias groutes='groutes() { bundle exec rails routes | grep $1 }; groutes'
alias sc='bundle exec rails console'

# Phoenix aliases
alias im='iex -S mix'
alias pss='iex -S mix phx.server'
alias ho='mix hex.outdated'
alias proutes='proutes() { mix phx.routes | grep $1 }; proutes'

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
alias cdep='rm -rf deps _build assets/node_modules'
alias rdep='rm -rf deps _build assets/node_modules; mix deps.get; cd assets; npm install; cd ..'

# Git aliases
#
alias dci='git duet-commit'
alias drv='git duet-revert'
alias dmg='git duet-merge'
alias drb="git rebase -i --exec 'git duet-commit --amend'"
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
alias grs='git rebase --skip'
alias grc='git rebase --continue'
alias grm='git pull --rebase origin master'
alias prunemerged='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gst='git status'

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

alias rl='source ~/.zshrc; source ~/.vimrc; echo -e "ZSH and VIM config reloaded99"'

export PATH=$HOME/bin:$PATH
export PATH="$PATH:~/.gem/ruby/2.7.0/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Use fd as the searching tool for fzf
alias fd='fd -E ~/.ignore'
export FZF_DEFAULT_COMMAND='fd --type f -E ~/.ignore'

# Ruby/Rails functions
twiki () {
  bundle exec rails db:migrate && bundle exec rails db:migrate:redo && bundle exec rails db:test:prepare
}

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/bin/zsh-z.plugin.zsh

plugins=(… zsh-completions)

# Remember Elixir History
export ERL_AFLAGS="-kernel shell_history enabled"

# Import local zsh customizations, if present
zrcl="$HOME/.zshrc.local"
[[ ! -a $zrcl ]] || source $zrcl

eval "$(starship init zsh)"
eval "$(rbenv init -)"

export PNPM_HOME="/Users/joshuaplicque/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
