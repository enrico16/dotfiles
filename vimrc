" .vimrc

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" no vi compatibility
set nocompatible

" directory
set directory=/home/enrico/.vim

" disable backups (and swap)
set nobackup
set nowritebackup
set noswapfile

" tabs and indentation
set tabstop=4
set noexpandtab
set smarttab
set shiftwidth=4
set backspace=indent,eol,start
set autoindent
set smartindent

" show commands
set showcmd

" show line and column position of cursor
set ruler

" status bar
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\ 
set laststatus=2
set cmdheight=1

" textwidth
set textwidth=0

" formatting options
set formatoptions=c,q,r,t

" line numbers
set number

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" syntax highlighting
syntax on
filetype plugin on
filetype indent on

" enable mouse
set mouse=a

" set background
set background=dark

" set colorscheme
"colorscheme tango3

" allows sudo with :w!!
cmap w!! %!sudo tee > /dev/null %
