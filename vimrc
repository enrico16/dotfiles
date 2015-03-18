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
set colorcolumn=80
set autowrite "automatically save before :next and :make 
set hidden "hide abandoned buffers, don't close them
set iskeyword-=_ " treat _ as . and -
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

" vundle configuration
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" plugins
Plugin 'gmarik/vundle'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'tomasr/molokai'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/dbext.vim'
" restore filetype recognition
filetype plugin indent on

" SQL default type
let g:sql_type_default = 'mysql'
" dbext configuration
let g:dbext_default_profile_pegasus = 'type=MYSQL:user=ef884766:passwd="":dbname=pegasus'

" Vim-R-plugin configuration
let r_syntax_folding = 1
let vimrplugin_assign = 0
let vimrplugin_vsplit = 1
let vimrplugin_tmux_title = "automatic"
let vimrplugin_source_args = "echo = TRUE"
map <silent><LocalLeader>rH :call RAction("head")<CR>

" CtrlP configuraton
"let g:ctrlp_user_command = 'find -L %s -type f -name "*.R" -or -name "*.pl" -or -name "*.sh" -or -name "*.txt" -or -name "*.csv" -or -name "*.tsv" -or -name "*rc" -or -name "*.conf"'
let g:ctrlp_map = ''
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 0
let g:ctrlp_follow_symlinks = 1
noremap <silent><C-p> :CtrlP /home/ef884766/<CR>

" Rainbow Parentheses configuration
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" advanced stuff
" jump to the last position when reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"allows to write read-only wile with :w!!
cnoremap w!! w !sudo tee > /dev/null %
