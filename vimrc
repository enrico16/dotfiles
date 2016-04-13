" .vimrc

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
set wildmode=longest,list,full
set backspace=indent,eol,start "backspace behaviour
set wrap "wrap lines
set autowrite "automatically save before :next and :make 
set hidden "hide abandoned buffers, don't close them
set iskeyword-=_ "treat _ as . and -
set pastetoggle=<F2> "enter paste mode
let mapleader=","
let maplocalleader=";"

" interface
set showcmd "show commands
set showmatch "show matching bracket
set ruler "show cursor position
set number "show line numbers
set cursorline "highlight current line
set cmdheight=1 "command line height
set laststatus=2 "always show status line
set showtabline=2 "always show tab line

" tabs and indentation
set tabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set autoindent
set smartindent
set shiftround

" search
"set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" syntax highlighting
syntax enable
filetype plugin indent on

" folding
set foldmethod=indent
set nofoldenable

" splits
set splitright
set splitbelow

" theme
set t_Co=256
set background=dark
"colorscheme molokai

" custom key mappings
" Y to yank to end of line
nnoremap Y y$
" easier up and down navigation
nnoremap j gj
nnoremap k gk
" open new files
nnoremap <C-w>t :tabnew<Space>
nnoremap <C-w>s :split<Space>
nnoremap <C-w>v :vsplit<Space>
" tab navigation
nnoremap <C-w>n :tabnext<CR>
nnoremap <C-w>p :tabprevious<CR>
nnoremap J :tabnext<CR>
nnoremap K :tabprevious<CR>
" clear highlights wth Ctrl-l
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
" spell check with F7
nnoremap <silent> <F7> :setlocal spell! spelllang=en_gb<CR>

" advanced stuff
" jump to the last position when reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"allows to write read-only wile with :w!!
cnoremap w!! w !sudo tee > /dev/null %
