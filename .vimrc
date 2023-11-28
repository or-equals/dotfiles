call plug#begin('~/.config/nvim')

set nocompatible  " We don't want vi compatibility.
set termguicolors " Enable true color support
set t_Co=256

" Ignore space key in normal mode
nnoremap <SPACE> <Nop>
" Ignore space key in visual mode
vnoremap <SPACE> <Nop>

"This unsets the "last search pattern" register by hitting return<Paste>
nnoremap <CR> :noh<CR><CR>

Plug 'dart-lang/dart-vim-plugin'
let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']
Plug 'thosakwe/vim-flutter'
" Use shortcuts gJ and gS to join and split, respectively
Plug 'AndrewRadev/splitjoin.vim' " Convert between do/end and {}
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'plicjo/ember-qunit-testing.vim'
let g:closetag_filenames = '*.html,*.xhtml,*.html.erb,*.eex'
Plug 'bfontaine/brewfile.vim' " Brewfile syntax highlighting
Plug 'blueyed/vim-diminactive' " Diable syntax highlight for inactive windows
let g:diminactive_use_syntax = 1
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-Vim'
Plug 'elixir-editors/vim-elixir'
Plug 'kana/vim-textobj-user'
Plug 'andyl/vim-textobj-elixir'
Plug 'elzr/vim-json'
Plug 'slim-template/vim-slim'
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-projectionist'
Plug 'kchmck/vim-coffee-script'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'joukevandermaas/vim-ember-hbs'
" Jade/Pug Templates
Plug 'digitaltoad/vim-pug'
Plug 'godlygeek/tabular' " Align text
nmap <Leader>t= :Tabularize /=<cr>
vmap <Leader>t= :Tabularize /=<cr>
nmap <Leader>t" :Tabularize /"<cr>
vmap <Leader>t" :Tabularize /"<cr>
nmap <Leader>t: :Tabularize /:\zs<cr>
vmap <Leader>t: :Tabularize /:\zs<cr>
nmap <Leader>t> :Tabularize /=>\zs<cr>
vmap <Leader>t> :Tabularize /=>\zs<cr>
nmap <Leader>t, :Tabularize /,\zs<cr>
vmap <Leader>t, :Tabularize /,\zs<cr>
Plug 'guns/xterm-color-table.vim' " View xterm colors with :XtermColorTable
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }
Plug 'juanibiapina/vim-lighttree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  let height = float2nr(&lines * 0.5)
  let width = float2nr(&columns * 0.6)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction
highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931
Plug 'jgdavey/tslime.vim', { 'branch': 'main' }
Plug 'jgdavey/vim-turbux', { 'branch': 'main' }
let g:turbux_runner  = 'tslime' " default: vimux OR tslime OR vim
let g:turbux_command_rspec  = 'bundle exec rspec'
let g:turbux_command_cucumber  = 'bundle exec cucumber'
" Browse git history with :GV
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar' " https://github.com/majutsushi/tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_ctags_bin = 'ctags'
nmap <end> :TagbarToggle<cr>
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'F:singleton methods',
        \ 'f:methods',
        \ 'a:aliases',
        \ 's:symbols',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'i:its',
        \ '?:unknown',
    \ ],
    \ 'kind2scope': { 'c' : 'class', 'm': 'class' },
    \ 'scope2kind': { 'class' : 'c' },
        \ }
Plug 'matze/vim-move' " Use modifier+j or modifier+k to move a line or selected lines
" On ergodox, this allows the left ctrl key to work as the move key
let g:move_key_modifier = 'C'
" Use paste values as a stack. option+P & shift+option+P will cycle thru
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
Plug 'mhinz/vim-startify' " Always update session on vim close
let g:startify_session_persistence = 1
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks', 'commands']
Plug 'tpope/vim-cucumber'
Plug 'hashrocket/vim-hashrocket'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['markdown', 'csv']
Plug 'ngmy/vim-rubocop'
" j and k keys move faster when held down
Plug 'rhysd/accelerated-jk'
nmap k <Plug>(accelerated_jk_gk)
nmap j <Plug>(accelerated_jk_gj)
"
" See git diff in commit window as another pane
Plug 'rhysd/committia.vim'
" Visualize your vim undo tree
Plug 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<cr>
let g:gundo_prefer_python3 = 1
Plug 'slashmili/alchemist.vim'
" Press `v` multiple times to expand the selected region in visual mode
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <leader>v <Plug>(expand_region_shrink)
Plug 'thoughtbot/vim-rspec'
Plug 'ervandew/supertab'
Plug 'jgdavey/vim-blockle'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-characterize' " Add Unicode character metadata when using ga
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'tonchis/vim-to-github'
Plug 'TovarishFin/vim-solidity'
Plug 'github/copilot.vim'

" Global Find and Replace
Plug 'brooth/far.vim'
let g:far#source = 'rgnvim'

" Themes
Plug 'w0ng/vim-hybrid'
" Use <tab> key to step into the selections
inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"

" This plugin needs to be loaded last
Plug 'ryanoasis/vim-devicons' " Add icons to plugins
call plug#end()

set noreadonly
set autoindent                                     " Automatic indenting/formatting
set autoread                                       " Reload files changed outside of vim
set background=dark                                " Always use colors for dark color schemes
set backspace=indent,eol,start                     " Backspace configuration
set cindent
set encoding=utf-8                                 " Always UTF-8 enoding
set eol                                            " include a new line at EOF
set expandtab                                      " Expand tabs to spaces
set foldcolumn=2
set foldnestmax=12                                 " Deepest fold
set formatoptions+=j                               " Join comments better
set grepprg=rg\ --vimgrep\ --no-heading            " Use ripgrep for search
set guicursor=a:blinkon0-Cursor/Cursor             " Turn off blink for all modes
set guicursor+=i:blinkwait0-blinkon100-blinkoff100 " Turn on blinking in insert mode
set hidden                                         " Required for operations modifying multiple buffers like rename.
set history=10000                                  " Max history
set hlsearch                                       " Highlight matches
set ignorecase                                     " Ignore case when searching...
set incsearch                                      " Find the next match as we type
set lazyredraw                                     " Disable screen redraw when running macros, for performance
set matchtime=5                                    " Show matching bracket for 0.5 seconds
set mouse=                                         " Disable mouse
set noerrorbells                                   " No sounds
set nocursorcolumn                                 " Enable cursor column highlighting
set nofoldenable                                   " Don't fold files by default
set norelativenumber                               " Disable relative line numbers for performance
set noruler                                        " No ruler needed, because lightline
set noshowmode                                     " Disable current mode, handled by lightline
set nospell                                        " Turn spell checking off by default
set nowrap                                         " Don't wrap lines. Call `:set wrap` to change
set number                                         " Line numbers on
set numberwidth=5                                  " Use 5 characters for number well
set path+=**                                       " Search within subfolders by default
set path-=.git                                     " But ignore these folders
set path-=lib/node_modules
set path-=node_modules
set path-=frontend/dist
set path-=lock
set rtp+=/usr/local/opt/fzf                        " fzf.vim
set scrolloff=10                                   " Prevent scrolling past bottom line
set sessionoptions-=options                        " Disable options because sessions capture runtime path
set sessionoptions+=folds                          " Include folds between sessions
set showtabline=2                                  " Always show a tab line in vim https://stackoverflow.com/a/47129698/2892779
set shiftround                                     " Round indent of shifts
set shiftwidth=2                                   " Round indent to multiples of 2
set showmatch                                      " Briefly show matching brackets
set showcmd                                        " Show leader key and partial commands in the bottom right corner
set smartcase                                      " Don't ignore case if we type a capital
set smarttab                                       " Backspace should delete tabwidth of characters
set softtabstop=2
set splitbelow                                     " Open new split panes to right and bottom
set splitright                                     " Open new split panes to right and bottom
" set tabpagemax=6                                 " tabs
set tabstop=2
set title                                          " Set the title of the iTerm tab
set ttyfast
set viewoptions=cursor,curdir,folds,unix,slash
set viewdir=~/.vim/views
set viminfo^=!                                     " Add recently accessed projects menu (project plugin)
set visualbell                                     " No visual feedback
set nobackup
set noundofile

" tt toggles between current and last tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <leader>tn :tabnew<cr> " Open a new tab
" Opens a new tab with the current buffer's path
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

colorscheme hybrid             " https://github.com/w0ng/vim-hybrid

" ========== Indent ==========
" Using vim-ruby, indent per work convention
let g:ruby_indent_access_modifier_style="normal"

map <leader>7 mzgg=G`z " Format file with indention settings
" htt://vim.wikia.com/wiki/Fix_indentation

filetype plugin on
filetype indent on

" ========== Folds ==========
" http://vim.wikia.com/wiki/Folding
"
" Indent automatically, but also allow manual folds
let ruby_foldable_groups = 'if def class module case %'
augroup AutoSaveFolds " http://vim.wikia.com/wiki/Make_views_automatic
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup END

" https://github.com/neovim/neovim/issues/1936#issuecomment-309311829
augroup ReloadFiles
  au FocusGained * :checktime
augroup END

augroup vimrc_autocmd
  " Automatically clears out the current group of commands
  autocmd!
  " https://stackoverflow.com/a/19031285/2892779

  " Remove trailing whitespace from certain files
  autocmd FileType rb,js,haml,coffee,* autocmd BufWritePre <buffer> %s/\s\+$//e

  " Allow Dockerfile to be commented
  " https://github.com/tpope/vim-commentary#faq
  autocmd FileType Dockerfile setlocal commentstring=#\ %s

  " Make fzf quit quickly when esc is pressed
  " https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577
  autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
augroup END

" ========== Completion ==========
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Display tabs & trailing spaces visually
set list listchars=tab:»·,trail:·,nbsp:·

syntax on " Basic syntax
syntax enable " Basic syntax

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:multicursor_insert_maps = 1
let g:multicursor_normal_maps = 1

" Explore shortcut
let g:netrw_liststyle=3

" Use :help instead of f1
map <f1> <esc>
imap <f1> <esc>
nmap <f1> <esc>
cmap <f1> <esc>

" Macros
" Use Q as a default macro. This lets you quickly create a macro with qq, then
" quit it with q, then replay it back with Q
noremap Q @q

" Use tab and shift-tab to cycle through windows
nnoremap <tab> <c-w>w
nnoremap <s-tab> <c-w>W

" <ctrl>w or <ctrl>s to save a file
noremap <leader>w :w<cr>

" Clear search highlighting by pressing //
noremap // :noh<cr>

" <Space> q to quit everything, even NERDTree
noremap <leader>q :wqa<cr>

" LightTree is an in-window file explorer
map <leader>e :LightTree<cr>

" bind F to ripgrep word under cursor
nnoremap K :Find <cr>
nnoremap <leader>p :Files<cr>

" ripgrep customization
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore --ignore-global --hidden --no-follow --color "always"
  \ -g "!.git/*"
  \ -g "!.elixir_ls/*"
  \ -g "!spec/vcr/*"
  \ '

" https://github.com/junegunn/fzf.vim/issues/419#issuecomment-479687537
" command! -bang -nargs=* Rg
" \ call fzf#vim#grep(
" \    g:rg_command
" \    . (len(<q-args>) > 0 ? shellescape(<q-args>) : '""'), 1,
" \ <bang>0 ? fzf#vim#with_preview('up:60%')
" \         : fzf#vim#with_preview('right:50%:hidden', '?'),
" \ <bang>0)


let g:rg_case_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore --ignore-global --hidden --no-follow --color "always"
  \ -g "!.git/*"
  \ -g "!.elixir_ls/*"
  \ -g "!spec/vcr/*"
  \ '

command! -bang -nargs=* Rgg
\ call fzf#vim#grep(
\    g:rg_case_command
\    . shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%')
\         : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

" Use a preview window with the Files command
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" This command is used with a shortcut key below to find all occurences of the
" word beneath the cursor
command! -bang -nargs=* Find
\ call fzf#vim#grep(g:rg_command .shellescape(expand('<cword>')), 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%')
\         : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" ALE
" https://github.com/statico/dotfiles/blob/202e30b23e5216ffb6526cce66a0ef4fa7070456/.vim/vimrc#L400-L404
" Enable completion where available
" let g:ale_completion_enabled = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
" Always leave sign gutter column open
let g:ale_sign_column_always = 1
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
highlight ALEWarning ctermbg=LightGreen
"
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

" Shows a decimal & hex value of the currently selected character
function! LightLineCharacter() abort
  let dec = char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))
  return dec . "/0x" . printf('%x', dec)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Full filename path. Requires fugitive
" https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

augroup AleStuff
  autocmd User ALELint call s:MaybeUpdateLightline()
augroup END

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" https://github.com/vredniy/vim-rubyhashes
function! ConvertRocketToNewSyntax()
  " %s/'\([^=,'"]*\)' =>/\1:/gc
  let range="'<,'>"

  silent exe range."yank"
  let selected = @@

  let new_hashes_text = substitute(selected, ':\(\w\+\)\s*=>\s*', '\1: ', 'g')

  silent exe "norm! :".range."change\<cr>".new_hashes_text
endfunction

vmap <leader>h :<C-U>call ConvertRocketToNewSyntax()<cr>

" Map ESC in terminal mode to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Disable these keys in normal mode because it makes my cursor jump all over
" the place when I hit the wrong keys
nmap { <ESC>
nmap } <ESC>

" Yank into the system clipboard
vmap <leader>y "+y

" Open definition in a new vertical split
nmap <C-\> :vsplit <cr>:exec("tag ".expand("<cword>"))<cr>

nmap <c-\> <c-w><c-]><c-w>T

" Disable Shift + up/down arrow. It makes me jump around and I don't want to
nnoremap <S-Up> <Nop>
nnoremap <S-Down> <Nop>
vnoremap <S-Up> <Nop>
vnoremap <S-Down> <Nop>
inoremap <S-Up> <Nop>
inoremap <S-Down> <Nop>

" Call _ before a brace on a visual selection to add wrapped pair
vnoremap _( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap _[ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap _< <Esc>`>a><Esc>`<i<<Esc>
vnoremap _{ <Esc>`>a}<Esc>`<i{<Esc>

" Navigate between splits easier
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
vnoremap <c-j> <c-w>j
vnoremap <c-k> <c-w>k
vnoremap <c-h> <c-w>h
vnoremap <c-l> <c-w>l

highlight Search cterm=NONE guibg=#00ffdf guifg=#ffffff " Change highlight color
highlight IncSearch cterm=NONE guibg=#00ffdf guifg=#ffffff " Change highlight color in incremental searches
highlight Cursor guifg=Black guibg=#df00af gui=reverse

" Change line numbers so they're readable https://stackoverflow.com/a/32128209/2892779
highlight LineNr term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE gui=NONE guifg=Grey80 guibg=NONE

" Make comment colors stand out more
highlight Comment term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE gui=NONE guifg=Grey50 guibg=NONE

" Edit/save and automatically reload vimrc file
" https://stackoverflow.com/a/39294493/2892779
nnoremap gev :e ~/.vimrc<cr>
nnoremap gsv :so ~/.vimrc<cr>
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost ~/.vimrc nested source % | tabdo e
    " Change cwd on file open
    " autocmd BufEnter * silent! lcd %:p:h
  augroup END
endif " has autocmd

" Change the local window current directory to that of current file
nmap <leader>cd lcd %:p:h

" Visual select shift mappings
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap > >gv
vnoremap < <gv

iabbrev bpry      require 'pry'; binding.pry;
iabbrev ipry      require IEx; IEx.pry;

" copy to end of line
nnoremap Y y$

" Replace old school ruby hashes with modern day syntax
nnoremap hs :%s/:\([^ ]*\)\(\s*\)=>/\1:/g
nnoremap hq :%s/\"\([^"]*\)\"/'\1'/g

" Set elixir syntax for files
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir
