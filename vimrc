" .vimrc

" debian compatibility
runtime! debian.vim

" no vi compatibility
set nocompatible

" vim root directory
set directory=~/.vim

" vundle configuration
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'
Bundle 'Lokaltog/vim-powerline'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'wincent/Command-T'
Bundle 'ervandew/supertab'
Bundle 'jcfaria/Vim-R-plugin'
Bundle 'ervandew/screen'

" disable backups
set nobackup
set nowritebackup	
set noswapfile

" general options
set title	"change terminal title
set t_Co=256 "enable 256 colors 
set t_ut=	"use correct backround color
set history=1000	"commands in history
set undolevels=1000	"undo operations
set mouse=a	"enable mouse
set wildmenu	"tab completion
set backspace=indent,eol,start	"backspace behaviour
set wrap	"wrap lines
set autowrite	"automatically save before :next and :make 
set hidden	"hide abandoned buffers, don't close them
set pastetoggle=<F2>

" interface
set showcmd	"show commands
set showmatch	"show matching bracket
set ruler	"show cursor position
set number	"show line numbers
set cmdheight=1	"command line height
set laststatus=2	"show status line

" tabs and indentation
set tabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set autoindent
set copyindent
set smartindent
set shiftround

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" syntax highlighting
syntax enable
filetype plugin on
filetype indent on

" theme
set background=dark
colorscheme molokai

" advanced stuff
cmap w!! w !sudo tee > /dev/null % "allows to write read-only wile with :w!!
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " jump to the last position when reopening a file 
