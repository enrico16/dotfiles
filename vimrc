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
set formatoptions+=t
set wrap "wrap lines
"set colorcolumn=80
set autowrite "automatically save before :next and :make 
set hidden "hide abandoned buffers, don't close them
set iskeyword-=_ " treat _ as . and -
set isfname+=32 "complete filenames with spaces
set pastetoggle=<F2> "enter paste mode
set clipboard=exclude:.* "improve startup time by ignoring clipboard and X server
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
set softtabstop=4
set expandtab
set smarttab
set autoindent
set cindent
set cinkeys-=0#
set indentkeys-=0#
set shiftround

" search
set hlsearch
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
colorscheme molokai

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
" clear highlights
nnoremap <silent><C-l> :nohlsearch<CR><C-l>
" spell check with F7
nnoremap <silent><F7> :setlocal spell! spelllang=en_gb<CR>

" netrw configuration
let g:netrw_liststyle=3

" vimplug configuration
call plug#begin('~/.vim/plugged')
Plug 'git@github.com:tomasr/molokai.git'
Plug 'git@github.com:itchyny/lightline.vim.git'
Plug 'git@github.com:ervandew/supertab.git'
Plug 'git@github.com:kien/rainbow_parentheses.vim.git'
Plug 'git@github.com:jalvesaq/Nvim-R.git'
call plug#end()

" recognise markdown files
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.html set syntax=markdown

" SQL default type
let g:sql_type_default = 'mysql'

" Nvim-R configuration
let r_syntax_folding = 1
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_assign = 0
let R_vsplit = 1
let R_tmux_title = "automatic"
let R_source_args = "echo=TRUE, max.deparse.length=1000"
let R_nvimpager = "tab"
map <silent><LocalLeader>rH :call RAction("head")<CR>

" Rainbow Parentheses configuration
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" advanced stuff
"allows to write read-only wile with :w!!
cnoremap w!! w !sudo tee > /dev/null %
