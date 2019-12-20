#!/usr/bin/env sh

#######################################################
#
# Homebrew install & application installation
#
#######################################################
if [ ! $(which brew) ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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
asdf plugin-add erlang
asdf plugin-add elixir
asdf plugin-add ruby
asdf plugin-add nodejs
asdf plugin-add python

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install
# asdf global python 3.6.2 2.7.13

#######################################################
#
# neovim/python stuff for TabNine
#
#######################################################
pip2 install --user --upgrade pip setuptools pynvim
pip3 install --user --upgrade pip setuptools pynvim

#######################################################
#
# Install Vim-Plug for Vim Plugin Management
#
#######################################################
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#######################################################
#
# Symlink all my files/folders
#
#######################################################
ln -sf "$(pwd)/.bundle" ~/.bundle
ln -sf "$(pwd)/.config/nvim/init.vim" ~/.config/nvim/init.vim
ln -sf "$(pwd)/.zsh/functions" ~/.zsh/functions
ln -sf "$(pwd)/bin/" ~/bin

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
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/.tool-versions" ~/.tool-versions
ln -sf "$(pwd)/.vimrc" ~/.vimrc
ln -sf "$(pwd)/.zshrc" ~/.zshrc

echo "Symlink or create your .zhrc.local file"

#######################################################
#
# Final tidbits
# Make a projects folder, an npm package for a pretty shell, and make sure Atom works on the command line
#
#######################################################
mkdir ~/projects
npm install -g spaceship-prompt
ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin/atom
