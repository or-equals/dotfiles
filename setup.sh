#!/usr/bin/env sh

setup_started_at=$(date +%s)
dotfiles=$(cd "$(dirname "$0")" && pwd)
failed_steps=""

esc=$(printf '\033')
reset="${esc}[0m"
bold="${esc}[1m"
dim="${esc}[2m"
red="${esc}[1;31m"
green="${esc}[1;32m"
yellow="${esc}[1;33m"
blue="${esc}[1;34m"

# Prints a section header
section() {
  printf '\n%s==>%s %s%s%s\n' "$blue" "$reset" "$bold" "$1" "$reset"
}

# Runs a command, recording its label if it fails so setup keeps going
step() {
  label=$1
  shift
  printf '  %s→ %s%s\n' "$dim" "$label" "$reset"
  if "$@"; then
    printf '  %s✔%s %s\n' "$green" "$reset" "$label"
  else
    printf '  %s✘ %s failed%s\n' "$red" "$label" "$reset"
    failed_steps="${failed_steps}${label}
"
  fi
}

# Downloads an install script before running it, so a failed download counts as a failure
run_installer() {
  installer=$(curl -fsSL "$1") || return
  /bin/bash -c "$installer"
}

#######################################################
#
# Homebrew & packages
#
#######################################################
section "Homebrew"
[ -x /opt/homebrew/bin/brew ] || step "Install Homebrew" run_installer https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
eval "$(/opt/homebrew/bin/brew shellenv)"
step "Install Brewfile packages" brew bundle --file="$dotfiles/Brewfile"

case "$SHELL" in
  */zsh) ;;
  *) step "Make zsh the default shell" chsh -s /bin/zsh ;;
esac

#######################################################
#
# Languages via asdf
#
#######################################################
section "Languages"
for plugin in elixir erlang flutter nodejs postgres python ruby rust
do
  step "asdf plugin $plugin" sh -c "asdf plugin add $plugin && asdf plugin update $plugin"
done

# Build Erlang against Homebrew's OpenSSL; kerl can't find it on its own
export KERL_CONFIGURE_OPTIONS="--with-ssl=$HOMEBREW_PREFIX/opt/openssl@3 --without-javac"
step "Install .tool-versions" sh -c "cd '$dotfiles' && asdf install"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
step "Upgrade npm" npm install -g npm

#######################################################
#
# Symlink dotfiles into ~
#
#######################################################
section "Dotfiles"
mkdir -p ~/.config/nvim ~/.zsh ~/bin ~/projects

ln -sfn "$dotfiles/.bundle" ~/.bundle
ln -sfn "$dotfiles/.zsh/functions" ~/.zsh/functions
ln -sf "$dotfiles/.config/nvim/init.vim" ~/.config/nvim/init.vim
ln -sf "$dotfiles/.config/starship.toml" ~/.config/starship.toml
ln -sf "$dotfiles/bin"/* ~/bin/

for file in .asdfrc .clippy.rb .default-gems .gemrc .gitconfig .gitignore \
  .ignore .irbrc .pryrc .railsrc .rspec .rubocop.yml .tmux.conf .tool-versions \
  .vimrc .zprofile .zshrc
do
  ln -sf "$dotfiles/$file" ~/"$file"
done
printf '  %s✔%s Linked into %s\n' "$green" "$reset" "$HOME"

#######################################################
#
# Neovim (after the symlinks, so it reads ~/.vimrc)
#
#######################################################
section "Neovim"
step "Install vim-plug" curl -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
step "Install pynvim" python -m pip install --quiet --upgrade pip pynvim
step "Install Vim plugins" nvim --headless "+PlugInstall --sync" +qa
step "Register remote plugins" nvim --headless +UpdateRemotePlugins +qa

#######################################################
#
# Coding agents
#
#######################################################
section "Coding agents"
[ -x ~/.local/bin/claude ] || step "Install Claude Code" run_installer https://claude.ai/install.sh
[ -x ~/.grok/bin/grok ] || step "Install grok" run_installer https://x.ai/cli/install.sh

factory=~/projects/factory
[ -d "$factory" ] || step "Clone factory plugin" git clone https://github.com/plicjo/factory.git "$factory"
~/.grok/bin/grok plugin list 2>/dev/null | grep -q "local: $factory\]" ||
  step "Install factory plugin into grok" ~/.grok/bin/grok plugin install "$factory" --trust

#######################################################
#
# Victory lap
#
#######################################################
elapsed=$(( $(date +%s) - setup_started_at ))
duration="${dim}in $((elapsed / 60))m $((elapsed % 60))s${reset}"

if [ -n "$failed_steps" ]; then
  printf '\n  %s⚠ Setup finished with failures%s %s\n' "$yellow" "$reset" "$duration"
  printf '%s' "$failed_steps" | while IFS= read -r label
  do
    printf '    - %s\n' "$label"
  done
  printf '  %s→ Scroll up for the errors, fix them, and re-run ./setup.sh.%s\n\n' "$bold" "$reset"
  exit 1
fi

echo
color=46
while IFS= read -r line
do
  printf '%s\n' "${esc}[38;5;${color}m${line}${reset}"
  color=$((color + 1))
done <<'BANNER'
  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
BANNER

printf '\n  %s✔ Machine setup complete%s %s\n\n' "$green" "$reset" "$duration"

# Only list what setup couldn't finish on its own
todo="Open a new terminal"
{ git config --global --includes user.name && git config --global --includes user.email; } >/dev/null ||
  todo="$todo
Create ${bold}~/.gitconfig.local${reset} with your name and email (see README). Git won't commit without them"
~/.local/bin/claude auth status 2>/dev/null | grep -q '"loggedIn": true' ||
  todo="$todo
Sign in to Claude Code: run ${bold}claude${reset}"
grep -q 'auth.x.ai' ~/.grok/auth.json 2>/dev/null ||
  todo="$todo
Sign in to grok: run ${bold}grok login${reset}"

printf '  %sLeft for you:%s\n' "$bold" "$reset"
n=1
printf '%s\n' "$todo" | while IFS= read -r item
do
  printf '    %d. %s\n' "$n" "$item"
  n=$((n + 1))
done
echo
