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

" theme
set background=dark
colorscheme molokai

" custom key mappings
" open new files
nnoremap gn :tabnew<Space>
nnoremap gs :split<Space>
nnoremap gv :vsplit<Space>
noremap <C-n> :NERDTreeToggle<CR>
" clear highlights wth Ctrl-l
nnoremap <C-l> :nohl<CR><C-l>

" vundle configuration
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" plugins
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-powerline'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'ervandew/screen'
Bundle 'Vim-R-plugin'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

" plugins configuration
let g:ctrlp_show_hidden = 1 "ctrlp to also index dotfiles
let g:ctrlp_follow_symlinks = 0 "ctrlp to follow symlinks
let vimrplugin_tmux=1 "R plugin to use screen instead of tmux
let r_syntax_folding=1 " R code folding

" advanced stuff
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " jump to the last position when reopening a file 
cnoremap w!! w !sudo tee > /dev/null % "allows to write read-only wile with :w!!
