call plug#begin('~/.config/nvim')


set nocompatible  " We don't want vi compatibility.
set termguicolors " Enable true color support
set t_Co=256

" let mapleader=" " " Use the space key as a leader
" Ignore space key in normal mode
nnoremap <SPACE> <Nop>
" Ignore space key in visual mode
vnoremap <SPACE> <Nop>

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'

" Install vim-plug if it's not present
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" DO NOT USE PLUGINS. These are not maintained
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags' " Automatically generate tags files
" Plug 'chun-yang/auto-pairs'
" Plug 'Townk/vim-autoclose' " Automatically close bracket pairs
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use shortcuts gJ and gS to join and split, respectively
Plug 'AndrewRadev/splitjoin.vim' " Convert between do/end and {}

Plug 'airblade/vim-gitgutter'

Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.html.erb,*.eex'

Plug 'arnar/vim-matchopen' " Highlight the last opened tag

Plug 'bfontaine/brewfile.vim' " Brewfile syntax highlighting

Plug 'blueyed/vim-diminactive' " Diable syntax highlight for inactive windows
let g:diminactive_use_syntax = 1

Plug 'bronson/vim-trailing-whitespace'

Plug 'editorconfig/editorconfig-Vim'
Plug 'elixir-editors/vim-elixir'
Plug 'elzr/vim-json'
Plug 'rizzatti/dash.vim'
Plug 'mustache/vim-mustache-handlebars'
nnoremap <leader>d :Dash<cr>

" Plug 'ervandew/supertab' " Supertab, an omnicomplete popup menu
" http://vim.wikia.com/wiki/Omni_completion_popup_menu
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<C-N>"

Plug 'francoiscabrol/ranger.vim'

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
Plug 'juanibiapina/vim-lighttree'
Plug 'junegunn/fzf.vim'

" Browse git history with :GV
Plug 'junegunn/gv.vim'

Plug 'junegunn/vim-easy-align'

" Plug 'ludovicchabant/vim-gutentags' " Tag management
" let g:gutentags_ctags_exclude=['.git', 'node_modules/**/*', 'tmp', 'frontend/**/*']
" let g:gutentags_gtags_options_file="~/.ctags"
" let g:gutentags_trace = 1

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

Plug 'mustache/vim-mustache-handlebars'
" Plug 'mxw/vim-jsx'
Plug 'ngmy/vim-rubocop'
Plug 'pangloss/vim-javascript'
" Plug 'jason0x43/vim-js-indent'

" Plug 'Raimondi/delimitMate' " Add automatic delimiters ([<{, quotes, etc

" j and k keys move faster when held down
Plug 'rhysd/accelerated-jk'
nmap k <Plug>(accelerated_jk_gk)
nmap j <Plug>(accelerated_jk_gj)

" See git diff in commit window as another pane
Plug 'rhysd/committia.vim'

Plug 'rizzatti/dash.vim'
nnoremap <leader>d :Dash<cr>

Plug 'sheerun/vim-polyglot'

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
Plug 'jgdavey/tslime.vim'
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" let g:rspec_command = "Dispatch rspec {spec}"

Plug 'tomtom/tcomment_vim'

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
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'sukima/vim-javascript-imports'
Plug 'tonchis/vim-to-github'

Plug 'Yggdroot/indentLine' " Display thin vertical lines at code indentation levels

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'baskerville/bubblegum'
Plug 'nanotech/jellybeans.vim'
Plug 'squarefrog/tomorrow-night.vim'
Plug 'w0ng/vim-hybrid'
let g:deoplete#enable_at_startup = 1
" Use <tab> key to step into the selections
inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"

" This plugin needs to be loaded last
Plug 'ryanoasis/vim-devicons' " Add icons to plugins
call plug#end()

set autoindent                                     " Automatic indenting/formatting
set autoread                                       " Reload files changed outside of vim
set background=dark                                " Always use colors for dark color schemes
set backspace=indent,eol,start                     " Backspace configuration
set cindent
set colorcolumn=80,120                             " Add color markers to columns to identify where wraps should occur
set encoding=utf-8                                 " Always UTF-8 enoding
set eol                                            " include a new line at EOF
set expandtab                                      " Expand tabs to spaces
set foldcolumn=2
set foldnestmax=12                                 " Deepest fold
set formatoptions+=j                               " Join comments better
set grepprg=rg\ --vimgrep\ --no-heading            " Use ripgrep instead of ag for :Ag commands
set grepformat=%f:%l:%c:%m,%f:%l:%m
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
set cursorline                                     " Disable line highlighting, for performance
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

" tt toggles between current and last tab
let g:lasttab = 1
nnoremap <leader>tt :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <leader>n :tabnext<cr>
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

" Leader + movement switches panes
" map <leader>h <C-W>h
" map <leader>j <C-W>j
" map <leader>k <C-W>k
" map <leader>l <C-W>l

" LightTree is an in-window file explorer
map <leader>e :LightTree<cr>

" ripgrep customization
"
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "!{.git,log,coverage,node_modules,vendor,frontend,tmp}/*"
  \ -g "!tmux*"
  \ -g "!*.log"
  \ -g "!tags"
  \ '
  " \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"

command! -bang -nargs=* Rg
\ call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%')
\         : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

" Use a preview window with the Files command
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" This command is used with a shortcut key below to find all occurences of the
" word beneath the cursor
command! -bang -nargs=* Find
\ call fzf#vim#grep(g:rg_command .shellescape(expand('<cword>')), 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%')
\         : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

" bind F to ripgrep word under cursor
nnoremap K :Find <cr>
nnoremap <leader>p :Files<cr>

" Pretty format json!
" https://til.hashrocket.com/posts/ha0ci0pvkj-format-json-in-vim-with-jq
" nnoremap <C-p> :%!jq '.'<cr>

" Start on last line edited
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

	" For shell files, always add a comment leader following <Enter>
	au FileType sh setlocal fo+=r
	au FileType dockerfile setlocal fo+=r
endif

augroup RubyStuff
	autocmd!
	" Read Envfile as ruby
	au BufRead,BufNewFile Envfile setfiletype ruby

	" Indent haml files
	autocmd FileType haml,ruby setlocal foldmethod=indent

	" vim-ruby completion
	autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
	autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
	autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

	" Use vim-rspec commands. Disabled, for now, because I want to use
	" <leader>a for something else
	" autocmd FileType ruby nmap <buffer> <Leader>t :call RunCurrentSpecFile()<cr>
	" autocmd FileType ruby nmap <buffer> <Leader>s :call RunNearestSpec()<cr>
	" autocmd FileType ruby nmap <buffer> <Leader>l :call RunLastSpec()<cr>
	" autocmd FileType ruby nmap <buffer> <Leader>a :call RunAllSpecs()<cr>

	" Use old regular expression engine because it's faster
	set re=1
augroup END

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

highlight link MatchOpen Error

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

" Replace old school ruby hashes with modern day syntax
nnoremap hs :%s/:\([^ ]*\)\(\s*\)=>/\1:/g
