#######################################################
#
# Environment
#
#######################################################
export CLICOLOR=1
export LSCOLORS=Dxfxcxdxbxegedabadacad
export ZLS_COLORS=$LSCOLORS
export LC_CTYPE=en_US.UTF-8
export LESS=FRX

(( ${+PAGER}  )) || export PAGER='less'
(( ${+EDITOR} )) || export EDITOR='vim'
export PSQL_EDITOR='vim -c"setf sql"'

# Remember Elixir shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# Build Erlang against Homebrew's OpenSSL; kerl can't find it on its own
export KERL_CONFIGURE_OPTIONS="--with-ssl=$HOMEBREW_PREFIX/opt/openssl@3 --without-javac"

export NODE_OPTIONS="--max-old-space-size=8192"

# Prevent errors from the spring gem during Rails development
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Silence Ruby's "literal string will be frozen in the future" warning
export RUBYOPT=-W0

# `mux <name>` looks for projects here
export SOURCE_DIR=~/projects

# Use fd as the searching tool for fzf
export FZF_DEFAULT_COMMAND='fd --type f -E ~/.ignore | sort'

#######################################################
#
# PATH
#
#######################################################
# remove duplicates in $PATH
typeset -aU path

export PATH="$HOME/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$(asdf where flutter)/bin"

#######################################################
#
# Shell options & history
#
#######################################################
setopt appendhistory extendedglob histignoredups nonomatch prompt_subst interactivecomments
setopt INC_APPEND_HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000

# make with the pretty colors
autoload colors; colors

#######################################################
#
# Key bindings
#
#######################################################
# Just say no to zle vim mode
bindkey -e

# external editor support
autoload edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Partial word history completion
bindkey '\ep' up-line-or-search
bindkey '\en' down-line-or-search
bindkey '\ew' kill-region

# Ctrl-Z toggles back to the suspended job
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

#######################################################
#
# Completion
#
#######################################################
fpath=(
  $fpath
  ~/.zsh/functions
  $HOMEBREW_PREFIX/share/zsh/site-functions
  $HOMEBREW_PREFIX/share/zsh-completions
)

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

# compinit runs at the very end, inside the grok installer block

#######################################################
#
# Aliases
#
#######################################################
# Files
alias ..='cd ..'
alias cd..='cd ..'
alias l="ls -F -G -lah"
alias la="ls -a"
alias ll='ls -l'
alias lsd='ls -ld *(-/DN)'
alias md='mkdir -p'
alias rd='rmdir'
alias cat='bat'
alias fd='fd -E ~/.ignore'

# Shell
alias rl='source ~/.zshrc; echo "ZSH config reloaded"'

# Vim
alias vi='nvim'
alias vim='nvim'

# Git
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
alias gnap='git add -N --ignore-removal . && gap'
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

# Rails
alias ss='bundle exec rails server'
alias be="bundle exec"
alias rdb="bin/rails db:drop db:create db:migrate && bin/rails db:seed"
alias zdb="bin/rails db:drop db:create db:migrate && bin/rails db:seed && bin/rake after_party:run"
alias groutes='groutes() { bundle exec rails routes | grep $1 }; groutes'
alias sc='bundle exec rails console'

# Phoenix
alias im='iex -S mix'
alias pss='mix phx.server'
alias ho='mix hex.outdated'
alias proutes='proutes() { mix phx.routes | grep $1 }; proutes'
alias cdep='rm -rf deps _build assets/node_modules'
alias rdep='rm -rf deps _build assets/node_modules; mix deps.get; cd assets; npm install; cd ..'

# Docker
alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dcd="docker compose down"
alias dcs="docker compose stop"
alias dcp="docker compose ps"
alias dcl="docker compose logs -f"
alias dcr="docker compose run"
alias dce="docker compose exec"

# Coding agents
alias cf='claude --plugin-dir ~/projects/factory'
alias cfw='CLAUDE_CONFIG_DIR=~/.claude FACTORY_GROK_SEAT= claude --plugin-dir ~/projects/factory'
alias cfp='CLAUDE_CONFIG_DIR=~/.claude-personal FACTORY_GROK_SEAT=1 claude --plugin-dir ~/projects/factory'

#######################################################
#
# Functions
#
#######################################################
# Run the latest migration, redo it, and prepare the test DB
twiki () {
  bundle exec rails db:migrate && bundle exec rails db:migrate:redo && bundle exec rails db:test:prepare
}

#######################################################
#
# Plugins & prompt
#
#######################################################
source ~/bin/zsh-z.plugin.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Import local zsh customizations, if present
zrcl="$HOME/.zshrc.local"
[[ ! -a $zrcl ]] || source $zrcl

eval "$(starship init zsh)"

# Must be sourced last so it can wrap every other widget
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Left exactly as the grok installer wrote it so re-installs recognize it
# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
autoload -Uz compinit && compinit -C
# <<< grok installer <<<
