syntax enable
set background=dark
set number relativenumber
set encoding=utf-8
set confirm
set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set expandtab
set autoindent
set clipboard+=unnamed
set matchtime=2
set history=1000
set ttyfast
set report=0
set linespace=0
set mousehide
set novisualbell
set noerrorbells
set visualbell t_vb=
set t_vb=
set tm=500
set splitright
set splitbelow
set hidden 
set updatetime=300
set shortmess+=c
set noswapfile
set scrolloff=4
set ruler
set linebreak
set mouse=a

set ignorecase
set incsearch
set gdefault
set smartcase
set hlsearch
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile
set lazyredraw

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

nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <C-s> :w<CR>

" Different keybindings to save
nnoremap <Leader>w :write<CR>
xnoremap <Leader>w <Esc>:write<CR>

" Custom split keybindings
nnoremap <leader>h :<C-u>split<CR>
nnoremap <leader>v :<C-u>vsplit<CR>

" H To move to the start of a line.
" L to move to the end of a line.
nnoremap H ^
nnoremap L $

" Disable the esc key for practice using C-k & C-j
inoremap <Esc> <nop>

" add a save key binding instead of writing the command :w
nmap <leader>w :w!<cr>

" Exit and save the file
nmap <leader>q :wq!<cr>

" Select all
map <leader>sa ggVG"

" Delete all
map <leader>da ggVGdd

" Copy all contents of a file to the clipboard
map <leader>ca ggVGy

" Better window mapping
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wl <C-W>l
nnoremap <Leader>wJ :resize +5<CR>
nnoremap <Leader>wK :resize -5<CR>

" stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Duplicate lines
nnoremap <Leader>d m`YP``
vnoremap <Leader>d YPgv

" Move by line
nnoremap j gj
nnoremap k gk


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
