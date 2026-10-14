# Or Equals Development Environment

NeoVim with Tmux is our default development environment.
This configuration is optimized for Elixir, Ruby, and JavaScript development.

---

## Installations

The following tools are required to set up the development environment:

- [1Password](https://1password.com) - Password management tool.
- [Dash](https://kapeli.com/dash) - Quickly access documentation for various languages and frameworks.
- [iTerm](https://www.iterm2.com/) - Enhanced terminal emulator for a better command-line experience.

---

## Setup

Follow these steps to configure your development environment:

1. **Install the tools listed in the Installations section above.**

2. **Clone this repository and run the setup script:**

   ```sh
   git clone https://github.com/or-equals/dotfiles.git
   cd dotfiles
   ./setup.sh
   ```

   The setup script will:
   - Install necessary tools (e.g., NeoVim, Tmux, asdf, plugins).
   - Symlink configuration files to your home directory.
   - Install Claude Code and grok, and clone the factory plugin into `~/projects/factory`.
   - Keep going if a step fails, then list every failed step at the end.

   It's safe to re-run: steps that are already done are skipped.

3. **Create a localized Git configuration:**

   Create a file at `~/.gitconfig.local` with the following content:

   ```gitconfig
   [github]
     user = YourGitHubUsername
   [user]
     email = your@email.com
     name = FirstName LastName
   ```

   You can add additional Git configurations to this file as needed.

4. **Follow the list at the end of setup.**

   Setup installs your Vim plugins itself, then lists only what's left for you: creating `~/.gitconfig.local` if git doesn't know who you are yet, and signing in to Claude Code and grok.

---

## Features

This configuration provides a rich set of features to enhance your development workflow. Below is a summary of the key features, with links to configuration files for more details:

Below is an overview of many of the aliases, custom functions, and helpful features that come from these dotfiles. Think of this as a quick reference for the “goodies” provided, grouped by context.

---

## Shell & Zsh

### Aliases

<details>
<summary><strong>Rails & Ruby</strong></summary>

- **`ss`** – Runs the Rails server (`bundle exec rails server`).
- **`sc`** – Rails console (`bundle exec rails console`).
- **`be`** – Shortcut for `bundle exec`.
- **`rdb`** – Drops, creates, migrates, and seeds the database (`bin/rails db:drop db:create db:migrate && bin/rails db:seed`).
- **`zdb`** – Same as `rdb` but also runs `after_party:run` if your app uses that.
- **`groutes your_route`** – Searches for a route by name within `rails routes | grep`.
- **`twiki`** – Calls `db:migrate`, followed by `db:migrate:redo` and `db:test:prepare` in Rails (handy for quick DB resets).
</details>

<details>
<summary><strong>Phoenix & Elixir</strong></summary>

- **`im`** – Starts an IEx session with mix (`iex -S mix`).
- **`pss`** – Starts the Phoenix server (`mix phx.server`).
- **`ho`** – Lists outdated dependencies for your Elixir project (`mix hex.outdated`).
- **`proutes your_route`** – Searches for a route by name (`mix phx.routes | grep`).
</details>

<details>
<summary><strong>Filesystem / Navigation</strong></summary>

- **`..`** / **`cd..`** – Go up a directory.
- **`l`** – `ls -F -G -lah` (detailed list with colors).
- **`la`** – `ls -a` (show hidden files).
- **`ll`** – `ls -l` (long list).
- **`md`** – `mkdir -p` (create intermediate directories automatically).
- **`cdep`** – Remove Elixir + Node build artifacts (`rm -rf deps _build assets/node_modules`).
- **`rdep`** – Clears `deps`, `_build`, `assets/node_modules`, then runs `mix deps.get`, and re-installs Node dependencies.
</details>

<details>
<summary><strong>Git</strong></summary>

- **`gap`** – `git add -p` (interactive add).
- **`gb`** – `git branch`.
- **`gc`** – `git commit -v`.
- **`gco`** – `git checkout`.
- **`gd`** – `git diff`.
- **`gdc`** – `git diff --cached`.
- **`gdh`** – `git diff HEAD`.
- **`gl`** – `git pull`.
- **`gp`** – `git push`.
- **`gpr`** – `git pull --rebase`.
- **`gr`** – `git rebase`.
- **`gra`** – `git rebase --abort`.
- **`grc`** – `git rebase --continue`.
- **`gst`** – `git status`.
- **`gnap`** – A helper that adds all changes in “intent to add” mode, does partial interactive add, and then a `gref` (not in the snippet, but presumably a custom reference to commit or stash).
- **`glg`** – Graphical log (`git log --graph --oneline --decorate --color --all`).
- **`prunemerged`** – Removes branches that have been merged into your current branch.

</details>

<details>
<summary><strong>Docker</strong></summary>

- **`dcu`** – `docker compose up`.
- **`dcud`** – `docker compose up -d` (detached).
- **`dcd`** – `docker compose down`.
- **`dcs`** – `docker compose stop`.
- **`dcp`** – `docker compose ps`.
- **`dcl`** – `docker compose logs -f`.
- **`dcr`** – `docker compose run`.
- **`dce`** – `docker compose exec`.
</details>

<details>
<summary><strong>Zsh Other Goodies</strong></summary>

- **`rl`** – Reloads Zsh config by sourcing `~/.zshrc`.
- **`cat`** – Actually calls `bat`, for a colorized `cat` replacement.
- **`cd..`** – Same as `..`, moves up one directory.
- **`fd`** – [fd](https://github.com/sharkdp/fd) installed as an alternative to `find`.
- The environment sets a few paths for asdf, cargo (Rust), etc.

And much more—just check out the `.zshrc` for details!
</details>

---

## Vim/Neovim

### Key Plugin Highlights

- **[fzf.vim](https://github.com/junegunn/fzf.vim)** – Fuzzy finder integration.
  - `:Files` – Opens an fzf-based file finder.
  - `:Rg` / `:Rgg` – Searches with `ripgrep`, displayed in an fzf preview window.
  - `:Find` – Searches for the word under cursor in the project using `ripgrep`.

- **[vim-plug](https://github.com/junegunn/vim-plug)** – Plugin manager. `setup.sh` installs plugins; run `:PlugInstall` after adding new ones.

- **[tpope/vim-rails](https://github.com/tpope/vim-rails)**, [vim-bundler](https://github.com/tpope/vim-bundler), [vim-rake](https://github.com/tpope/vim-rake)** – Powerful Ruby & Rails enhancements.

- **[vim-elixir](https://github.com/elixir-editors/vim-elixir)** – Elixir syntax & indentation.


- **[maxbrunsfeld/vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack)** – Keeps a stack of past yanks, so you can cycle them.
  - Use `⌥+P` (option+P) or `shift+option+P` to cycle.


- **[rainbow_csv](https://github.com/mechatroner/rainbow_csv)** – Nice CSV highlighting.

- **[vim-rubocop](https://github.com/ngmy/vim-rubocop)** – RuboCop integration for Ruby code.

### Key Mappings / Features

- **Leader key** is mapped to <kbd>Space</kbd> in many places.
- **`<leader>t=`** – Align on `=`.
- **`<leader>w`** – Writes the file (`:w`).
- **`<leader>q`** – Quits and closes everything (`:wqa`).
- **`<leader>u`** – Toggles Gundo (undo tree visual).
- **`//`** – Clears search highlights.
- **`gsv`** – Reloads `.vimrc` on the fly (`:so ~/.vimrc`).
- **`gev`** – Edits the `.vimrc` in a new buffer (`:e ~/.vimrc`).
- **`<Tab>` / `<S-Tab>`** – Indentation-based shifts in normal/visual modes.
- **`Y`** – Now copies from cursor to the end of line (like `C` or `D`).
- **FZF**:
  - **`<leader>p`** – `:Files` (fuzzy file search).
  - **`RG something`** – search entire project for "something."

- **Pressing `CR`** in normal mode – Toggles highlight search off (`:noh`).

- **Auto-close pairs** for do/end vs. curly braces, etc. (via [vim-endwise](https://github.com/tpope/vim-endwise)).

And many more convenience or alignment commands (see `.vimrc` comments for specific details).

---

## Tmux

- **Prefix Key** – Changed to <kbd>Ctrl</kbd>+<kbd>z</kbd> (instead of the default `Ctrl+b`).
- **Copy/Paste** – Integrates with macOS clipboard.
  - `<prefix> + C-c` – Copies tmux selection to macOS clipboard.
  - `<prefix> + C-v` – Pastes from macOS clipboard into tmux.
- **Resize / Zoom**:
  - <kbd>Up Arrow</kbd> – Temporarily zoom a pane (`resize-pane -Z`).
  - <kbd>Down Arrow</kbd> – Same as above.
- **Window management**:
  - `<prefix> + |` – Split window vertically.
  - `<prefix> + h/j/k/l` – Move around panes.
- **Scrolling**
  - Mouse mode is on. Scroll with mouse wheel to go into copy-mode automatically.
- **History** – The scrollback buffer is extended to 100000 lines.

---

## Other Tools & Extras

- **asdf** is installed and configured for multiple languages (Elixir, Erlang, Flutter, Node.js, Python, Ruby, Rust, Postgres).
- **starship** prompt is enabled in `.zshrc`, giving a minimal, fast, configurable prompt.
- **`brew bundle`** in `setup.sh` automatically installs all the formulae from the `Brewfile`.
- **`nvim`** is the main editor; `vim` and `vi` are aliased to `nvim`.
- **Ripgrep** (`rg`) is used by default for searching within projects; integrated into Vim with `fzf`.
- **Bat** (`bat`) is used for colorful `cat` replacements.
- **Zsh Syntax Highlighting**, **Zsh Autosuggestions** are both loaded for a more user-friendly shell.

---

### Final Tips

1. **Install Vim Plugins**:
   - `setup.sh` installs all the plugins from `.vimrc`. Run `:PlugInstall` in `nvim` after adding new ones.

2. **`setup.sh`** does a lot:
   - Installs Homebrew (if not installed).
   - Installs all brew formulae & casks from the `Brewfile`.
   - Symlinks these dotfiles into `~/.` and ensures asdf is installed and updated.
   - Installs Claude Code, grok, and the factory plugin.

3. **Local Overrides**:
   - If you have local changes or environment-specific settings, place them in `~/.zshrc.local` (loaded at the bottom of `.zshrc`).

That’s it! Enjoy your streamlined environment for Ruby, Elixir, JavaScript, and more. If you get stuck, comb through `.zshrc` or `.vimrc` to see additional details and function definitions.
