#!/usr/bin/env sh

setup_started_at=$(date +%s)

#######################################################
#
# Homebrew install & application installation
#
#######################################################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle --verbose

#######################################################
#
# zsh as the default shell
#
#######################################################
echo $SHELL | grep -v zsh | while read
do
  chsh -s /usr/local/bin/zsh
done

#######################################################
#
# Xcode & cli tools
#
#######################################################
xcode-select --install

#######################################################
#
# asdf for programming language version management
#
#######################################################
asdf plugin add elixir
asdf plugin add erlang
asdf plugin add flutter
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add postgres
asdf plugin add python
asdf plugin add ruby
asdf plugin add rust
asdf plugin update elixir
asdf plugin update flutter
asdf plugin update nodejs
asdf plugin update postgres
asdf plugin update python
asdf plugin update ruby
asdf plugin update rust

asdf install

#######################################################
#
# Install Vim-Plug for Vim Plugin Management
# Install pynvim for Vim integration with Python
#
#######################################################
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
python -m pip install --upgrade pip pynvim

#######################################################
#
# Symlink all my files/folders
#
#######################################################
ln -sf "$(pwd)/.bundle" ~/.bundle
mkdir ~/.config
mkdir ~/.config/nvim
ln -sf "$(pwd)/.config/nvim/init.vim" ~/.config/nvim/init.vim
ln -sf "$(pwd)/.config/starship.toml" ~/.config/starship.toml
ln -sf "$(pwd)/.zsh/functions" ~/.zsh/functions
mkdir ~/bin
ln -sf "$(pwd)/bin"/* ~/bin/
ln -sf "$(pwd)/.asdfrc" ~/.asdfrc
ln -sf "$(pwd)/.clippy.rb" ~/.clippy.rb
ln -sf "$(pwd)/.ctags" ~/.ctags
ln -sf "$(pwd)/.default-gems" ~/.default-gems
ln -sf "$(pwd)/.gemrc" ~/.gemrc
ln -sf "$(pwd)/.gitconfig" ~/.gitconfig
ln -sf "$(pwd)/.gitignore" ~/.gitignore
ln -sf "$(pwd)/.ignore" ~/.ignore
ln -sf "$(pwd)/.irbrc" ~/.irbrc
ln -sf "$(pwd)/.pryrc" ~/.pryrc
ln -sf "$(pwd)/.railsrc" ~/.railsrc
ln -sf "$(pwd)/.rspec" ~/.rspec
ln -sf "$(pwd)/.rubocop.yml" ~/.rubocop.yml
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/.tool-versions" ~/.tool-versions
ln -sf "$(pwd)/.vimrc" ~/.vimrc
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.zprofile" ~/.zprofile

echo "Symlink or create your .zshrc.local file"

#######################################################
#
# Final tidbits
# Make a projects folder, and install npm
#
#######################################################
mkdir ~/projects
npm install -g npm

#######################################################
#
# Victory lap
#
#######################################################
esc=$(printf '\033')
reset="${esc}[0m"
bold="${esc}[1m"
green="${esc}[1;32m"
dim="${esc}[2m"

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

elapsed=$(( $(date +%s) - setup_started_at ))
printf '\n  %s✔ Machine setup complete%s %sin %dm %ds%s\n' "$green" "$reset" "$dim" $((elapsed / 60)) $((elapsed % 60)) "$reset"
printf '  %s→ Open a new terminal and go build something.%s\n\n' "$bold" "$reset"
