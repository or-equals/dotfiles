#!/usr/bin/env sh

#######################################################
#
# Homebrew install & application installation
#
#######################################################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle --verbose
brew install --cask chromedriver
xattr -d com.apple.quarantine $(which chromedriver)

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
asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add flutter
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add python
asdf plugin-add ruby
asdf plugin-update elixir
asdf plugin-update flutter
asdf plugin-update nodejs
asdf plugin-update python
asdf plugin-update ruby

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
# Make a projects folder, and install npm and yarn
#
#######################################################
mkdir ~/projects
npm install -g npm
curl -o- -L https://yarnpkg.com/install.sh | bash
