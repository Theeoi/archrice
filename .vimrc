syntax enable
filetype on
filetype plugin on
filetype indent on

set title
set confirm

"set how text is viewed
set wrap
set textwidth=80
set linebreak

"enables linenumbers and identifiable current line
set ruler
set number
set relativenumber

"enables good scrolling
set scrolloff=8
set sidescrolloff=8

"enable indentation and identify matching parenthesis
set autoindent
set smartindent
set showmatch

"enables good search
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap // :nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz

"set proper tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

"easy exit from insert mode
inoremap jj <esc>

"reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

"enable elite-mode (no arrows!)
let g:elite_mode=1
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Allow saving files as sudo when I forgot to start vim using sudo..
cmap w!! w !sudo tee > /dev/null %
