" Theme settings
syntax enable
set background=dark

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


" switch line numbers to relative, but also include the current selected line
" number
set number relativenumber

" Use Unicode supporting encoding
set encoding=utf-8

set smarttab
set cindent
set tabstop=4
set shiftwidth=4

" Replace tabs with spaces when saved
set expandtab

" Automatically insert tabs or spaces when you write code
set autoindent

" Highlight the current line
" set cursorline

" yank and copy to X clipboard
set clipboard+=unnamed

" Set maximum history record
set history=1000

" Faster redrawing
set ttyfast

set report=0
set linespace=0
set mousehide


" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Better splits
set splitright
set splitbelow

set hidden 
set updatetime=300
set timeoutlen=300
set shortmess+=c
set signcolumn=yes

" Disable swap files
set noswapfile

" The amount of lines above and below the cursor
set scrolloff=4

" Always show where the cursor is
set ruler

" Avoid wrapping a line in the middle of a word
set linebreak

" Enable mouse usage
set mouse=a

" Better search
set ignorecase
set incsearch
set gdefault
set smartcase

" Add a new binding for the ESC-key since it is quite far away
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" Disable array keys for practice
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" add a save key binding instead of writing the command :w
nnoremap <C-s> :w<CR>
