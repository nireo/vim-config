" src/settings.vim
" This file contains all the settings like `set hidden` and more. All of the
" values are documented and explained why they are there.

" switch line numbers to relative, but also include the current selected line
" number
set number relativenumber

" Do not highlight matching parenthesies, since this looks bad in some themes,
" and isn't really needed.
let g:loaded_matchparen = 1

" Use Unicode supporting encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set guicursor=

" This is a macro execution optimization. This makes it so that the screen
" doesn't get re-rendered after every macro, but it waits for it to finish.
set lazyredraw

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

" Disable vim's own mode status, since there is a normal status bar
set noshowmode

" Enable mouse usage
set mouse=a

" Better search
set ignorecase
set incsearch
set smartcase    

" Disable beep
set noerrorbells
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif


" Set the standard file type
set ffs=unix,dos,mac

" Turn backup off, just use git
set nobackup
set nowb
set noswapfile

set backspace=indent,eol,start

"""" CUSTOM STATUSLINE 
let g:modes={
    \'n'  : 'normal ',
    \'no' : 'n·operator pending ',
    \'v'  : 'visual ',
    \'V'  : 'v-line ',
    \'^V' : 'v-block ',
    \'s'  : 'select ',
    \'S'  : 's-line ',
    \'^S' : 's-block ',
    \'i'  : 'insert ',
    \'R'  : 'replace ',
    \'Rv' : 'v-replace ',
    \'c'  : 'command ',
    \'cv' : 'vim ex ',
    \'ce' : 'ex ',
    \'r'  : 'prompt ',
    \'rm' : 'more ',
    \'r?' : 'confirm ',
    \'!'  : 'sh',
    \'t'  : 'term '
    \}

function! CurrentMode() abort
    let l:currentmode = mode()
    let l:modelist = get(g:modes, l:currentmode, 'V·Block ')
    let l:current_status_mode = l:modelist
    return ' '.l:current_status_mode.' '
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?''.l:branchname.'':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %{CurrentMode()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=(%{StatuslineGit()})
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ (%p%%
set statusline+=\ %l:%c)

" always show the signcolumn, otherwise it would shift the text each time
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
