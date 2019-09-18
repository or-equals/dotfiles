# Dotfiles

I use NeoVim/Tmux/zsh for my development environment.

## Installations

* [1Password](https://1password.com) for password management.
* [Atom text editor](https://atom.io/) for global search and replace.
* [Dash](https://kapeli.com/dash) for quick documentation lookup.
* [Dropbox](https://www.dropbox.com) for file storage.
* [Patina](https://apps.apple.com/us/app/patina-paint-draw-and-sketch-with-ease/id942568098?mt=12) for basic image editing.
* [Paw](https://paw.cloud) as an API testing tool.
* [Postgres App](https://postgresapp.com/) for easy Postgres database management.
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) for searching inside of VIM.
* [Wunderlist](https://www.wunderlist.com/) for life management.
* [iTerm](https://www.iterm2.com/) for an improved terminal.

## Setup

Install all of the tools above.

I'd like to automate the following steps via a shell script.

Do the following steps:

```bash

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Dropbox and 1Password to get all the necessary passwords

# After installing git, clone this directory and place the files in the home directory.

# Install brew packages from the .Brewfile
brew bundle

# Authenticate with Github via SSH key
ssh-keygen -t rsa -C "plicjo@gmail.com"

# Paste the above output here: https://github.com/settings/keys

# Check to see if you're authenticated
ssh -T git@github.com

Download and install Vim Plug

brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions

chsh -s /bin/zsh

Make projects directory

# Install spaceship-prompt for a prettier shell
npm install -g spaceship-prompt

# Faster testing in Ember
https://gist.github.com/hjdivad/ea726b2caac4a8385788
```
