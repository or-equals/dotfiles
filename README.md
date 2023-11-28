# Or Equals Development Environment

NeoVim with Tmux is our default development environment.
This configuration is optimized for Elixir/Ruby/Javascript development.

## Installations

* [1Password](https://1password.com) for password management.
* [Dash](https://kapeli.com/dash) for quick documentation lookup.
* [Postgres App](https://postgresapp.com/) for easy Postgres database management.
* [iTerm](https://www.iterm2.com/) for an improved terminal.

## Setup
1. Install all of the tools above.

2. Clone this repository and run the setup script.
```
git clone https://github.com/or-equals/dotfiles.git
cd dotfiles
./setup.sh
```
3. Create a localized git config here `~/.gitconfig.local`
Populate with the following:

```
[github]
  user = YourUser
[user]
  email = your@email.com
  name = FirstName Lastname
```
3. Fire up vim and install the plugins with `:PlugInstall`
4. Make sure all the remote Neovim plugins are installed with `:UpdateRemotePlugins`
