" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible

" == Vundle Plugin Management =================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'									" Elegant alignment
Plugin 'kien/ctrlp.vim'										" Fuzzy searches
Plugin 'justinmk/vim-sneak'									" Location jumping
Plugin 'mhinz/vim-signify'									" Version control A, D, R
Plugin 'plasticboy/vim-markdown'							" Markdown
Plugin 'scrooloose/nerdtree'								" File tree -- for nerds
Plugin 'scrooloose/nerdcommenter'							" Elegant commenting
" Plugin 'tpope/vim-commentary'								" Elegant commenting
Plugin 'tpope/vim-dispatch'									" Async testing
Plugin 'tpope/vim-fugitive'									" Git
Plugin 'tpope/vim-sensible'									" Sensible vim defaults
Plugin 'tpope/vim-surround'									" Elegant bracket handling
Plugin 'Xuyuanp/nerdtree-git-plugin'						" NERDTree git support
" Plugin 'Valloric/YouCompleteMe'								" Snippets
Plugin 'vim-airline/vim-airline'							" Status bar
Plugin 'vim-scripts/a.vim'										" Alternate files
Plugin 'vim-syntastic/syntastic'							" Syntax checking

call vundle#end()
filetype plugin indent on


" == Plugin Configuration =====================================================

" -- NERDTree configuration ---------------------------------------------------

" " Open a NERDTree automatically if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" " Open a NERDTree automatically if a directory is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close NERDTree if it is the only vim buffer open
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Size NERDTree
:let g:NERDTreeWinSize=32

" Bind NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" Show hidden files
let NERDTreeShowHidden=1


" == General Configuration ====================================================

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
" if exists("&relativenumber")
" 	set relativenumber
" 	au BufReadPost * set relativenumber
" endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" set colors
set t_Co=16

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
