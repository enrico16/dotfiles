" .vimrc

" debian compatibility
runtime! debian.vim

" no vi compatibility
set nocompatible

" vim root directory
set directory=~/.vim

" general options
set nobackup "disable backups
set nowritebackup "disable backups
set noswapfile "disable swapfile
set history=1000 "commands in history
set undolevels=1000 "undo operations
set mouse=a "enable mouse
set wildmenu "command completion
set backspace=indent,eol,start "backspace behaviour
set wrap "wrap lines
set autowrite "automatically save before :next and :make 
set hidden "hide abandoned buffers, don't close them
set clipboard=unnamedplus "use system clipboard
set pastetoggle=<F2> "enter paste mode
let mapleader=","
let maplocalleader=";"

" interface
set showcmd "show commands
set showmatch "show matching bracket
set ruler "show cursor position
set number "show line numbers
set cmdheight=1 "command line height
set laststatus=2 "show status line

" tabs and indentation
set tabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set autoindent
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

" folding
set foldmethod=syntax
set nofoldenable

" splits
set splitright
set splitbelow

" theme
set background=dark
colorscheme molokai

" custom key mappings
" open new files
nnoremap tt :tabnew<Space>
nnoremap ss :split<Space>
nnoremap vv :vsplit<Space>
nnoremap <C-n> :NERDTreeToggle<CR>
" clear highlights wth Ctrl-l
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
" spell check with F7
nnoremap <silent> <F7> :setlocal spell! spelllang=en_gb<CR>

" vundle configuration
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" plugins
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'itchyny/lightline.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'tomasr/molokai'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'Vim-R-plugin'
Bundle 'jalvesaq/screenR'
Bundle 'LaTeX-Box-Team/LaTeX-Box'

" plugins configuration
let r_syntax_folding=1 " R code folding

" advanced stuff
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " jump to the last position when reopening a file 
cnoremap w!! w !sudo tee > /dev/null % "allows to write read-only wile with :w!!
