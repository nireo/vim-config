" Theme settings
syntax enable
set background=dark

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul


" switch line numbers to relative, but also include the current selected line
" number
set number relativenumber

" Use Unicode supporting encoding
set encoding=utf-8

" promt when exiting from an unsaved file
set confirm

set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

" Replace tabs with spaces when saved
set expandtab

" Automatically insert tabs or spaces when you write code
set autoindent

" Highlight the current line
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" yank and copy to X clipboard
set clipboard+=unnamed

set matchtime=2

" Set maximum history record
set history=1000

" Faster redrawing
set ttyfast

set report=0
set linespace=0
set mousehide

" Turn off sounds and visual bells
set novisualbell
set noerrorbells
set visualbell t_vb=
set t_vb=
set tm=500

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
set hlsearch

" enable regular expressions
set magic

" set unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, just use git
set nobackup
set nowb
set noswapfile

" Don't update the screen during macro and script execution
set lazyredraw

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

" Custom status bar

" Custom functions if we want to add git branch status
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
" Display git branch like in vim-airline
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=%#LineNr#

" %F full file path, %f file name
set statusline+=\ %F
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#

" Display vim
" set statusline+=\ %y

" Display file encoding and format
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]

" Display % of file the cursor is at
set statusline+=\ %p%%

" display line:column
set statusline+=\ %l:%c
