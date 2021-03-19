" src/settings.vim
" This file contains all the settings like `set hidden` and more. All of the
" values are documented and explained why they are there.

" switch line numbers to relative, but also include the current selected line
" number
set number relativenumber

" Disable the gui cursor
set guicursor=

" Split windows with equal size
set equalalways

" Treat dash separated words as a single word word
set iskeyword+=-

" Do not highlight matching parenthesies, since this looks bad in some themes,
" and isn't really needed.
let g:loaded_matchparen = 1

" Use Unicode supporting encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" This is a macro execution optimization. This makes it so that the screen
" doesn't get re-rendered after every macro, but it waits for it to finish.
set lazyredraw

" Remove duplicate spaces when joining
set nojoinspaces

" Indentation
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

" Replace tabs with spaces when saved
set expandtab

" Automatically insert tabs or spaces when you write code
set autoindent

" yank and copy to X clipboard
set clipboard+=unnamed

" Set maximum history record
set history=500

" Automatically read when a file has changed from the outside
set autoread

" Better splits
set splitright
set splitbelow

" unload buffer when it is abandoned
set hidden

set updatetime=300
set shortmess+=c
set signcolumn=yes

" The amount of lines above and below the cursor
set scrolloff=4

" Always show where the cursor is
set ruler

" Avoid wrapping a line in the middle of a word
set linebreak

" Disable vim's own mode status, since there is a custom statusline
set noshowmode

" Better search
set ignorecase
set incsearch
set smartcase

" Set the standard file type
set ffs=unix,dos,mac

" Turn backup off, just use git
set nobackup
set nowb
set noswapfile

" backspace fix
set backspace=indent,eol,start

" fix vim background changing in tmux
set t_ut=

set signcolumn=no "Disable the column next to the line numbers since it makes some themes look bad.

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Spelling check
set spelllang=en_us   " Set US English for spell checking.
augroup forspellcheck
  autocmd!
" Enable spell checking for text, markdown and git commit only.
  autocmd FileType text,markdown,gitcommit setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal spell
augroup END


" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" netrw configuration
let g:netrw_keepdir = 0
let g:netrw_winsize = 30 " Only 30% of the screen
let g:netrw_banner = 0 " Disable the banner
