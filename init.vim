" nvim configuration by nireo
" github.com/nireo/nvim

"""""""""""" PLUGINS
call plug#begin('~/.vim/plugged')
" Intellisense engine, with full language server protocal support (auto completion & auto imports)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Show git indications for added, modified and removed files
Plug 'airblade/vim-gitgutter'

" Detect a root directory 
Plug 'airblade/vim-rooter'

"FuzzyFileFinder is for quickly searching files in directory
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Nerd tree
Plug 'preservim/nerdtree'

" A lightweight status bar built with vimscript
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Improved comments
Plug 'scrooloose/nerdcommenter'

" Themes
Plug 'andreypopp/vim-colors-plain'
Plug 'Lokaltog/vim-monotone'
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
Plug 'sainnhe/edge'
Plug 'sainnhe/gruvbox-material'
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'

" C++ plugins
Plug 'rhysd/vim-clang-format'
Plug 'octol/vim-cpp-enhanced-highlight'

" Golang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Web development
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'HerringtonDarkholme/yats.vim' 
Plug 'leafgarland/typescript-vim'

" Rust plugins
Plug 'rust-lang/rust.vim'
call plug#end()

"""""""""" THEME SETTINGS

set termguicolors
if !has('gui_running')
  set t_Co=256
endif

" Enable syntax highlighting
syntax enable
set background=dark
colorscheme base16-gruvbox-dark-hard
let base16colorspace=256

" Make the comments brighter
call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")

let mapleader = "\<Space>"

"""""""""""""""""" SETTINGS 
" switch line numbers to relative, but also include the current selected line
" number
set number relativenumber

" Use Unicode supporting encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Indentation
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

" Use the terminal defined cursor instead of the normal gui cursor
set guicursor=

" Show matching brackets
set matchtime=2
set linespace=0

" Indentation Highlight the current line
set cursorline

" yank and copy to X clipboard
set clipboard+=unnamed

" Set maximum history record
set history=500

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Better splits
set splitright
set splitbelow

" Better display for messages
set cmdheight=2

" unload buffer when it is abandoned
set hidden 

set updatetime=300
set timeoutlen=300
set shortmess+=c
set signcolumn=yes

" The amount of lines above and below the cursor
set scrolloff=4

" Always show where the cursor is
"set ruler

" Avoid wrapping a line in the middle of a word
set linebreak

" Enable mouse usage
set mouse=a

" Disable the default mode indicator
set noshowmode

" Better search
set ignorecase
set incsearch
set smartcase

" set unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, just use git
set nobackup
set nowb
set noswapfile

" Fix backspace indent
set backspace=indent,eol,start

""""""""""""" CUSTOM KEYBINDINGS & SETTINGS

" Move by line
nnoremap j gj
nnoremap k gk

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

" Close buffer
noremap <leader> c :bd<CR>

" Buffer navigation
map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
nnoremap <silent> <Leader>bf :bfirst<CR>
nnoremap <silent> <Leader>bl :blast<CR>

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

" CTRL-C to copy
vmap <C-c> y

" CTRL-X to cut
vmap <C-x> x

" CTRL V to paste
imap <C-v> <esc>P

" Yank from cursor position to end-of-line
nnoremap Y y$

" Duplicate lines
nnoremap <Leader>d m`YP``
vnoremap <Leader>d YPgv

" Clear search
nnoremap <silent> <leader><space> :noh<CR>

" Disable array keys for practice
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Disable the esc key for practice using C-k & C-j
inoremap <Esc> <nop>

" add a save key binding instead of writing the command :w
nnoremap <C-s> :w<CR>
nmap <leader>w :w!<cr>

" Select all
map <leader>sa ggVG"

" Delete all
map <leader>da ggVGdd

" Copy all
map <leader>ca ggVGy

" These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Custom split keybindings
nnoremap <leader>h :<C-u>split<CR>
nnoremap <leader>v :<C-u>vsplit<CR>

" shift h to head of line, shitf l to end of line
nnoremap H ^
nnoremap L $

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev qw wq
cnoreabbrev Qa qa

" fast saving from all modes
nnoremap <Leader>w :write<CR>
xnoremap <Leader>w <Esc>:write<CR>
nnoremap <C-s> :<C-u>write<CR>
xnoremap <C-s> :<C-u>write<CR>
cnoremap <C-s> <C-u>write<CR>

command! FixWhitespace :%s/\s\+$//e

""""""""""""" PLUGIN SETTINGS 

" Rooter configuration
let g:rooter_patterns = ['.git', 'main.go', 'node_modules', '=src', 'Makefile', 'main.cpp']

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

" coc config
" coc extensions that should be installed
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-clangd',
  \ 'coc-rls',
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" refresh the language server by pressing c-space
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

command! -nargs=0 Prettier :CocCommand prettier.formatFile

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"" Fuzzy file finder stuff
" Binding for fuzzy file finder ctrl-p
nnoremap <silent> <C-p> :Files<CR>

" Look at all buffers
nnoremap <silent> <C-b> :Buffers<CR>

nnoremap <F3> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '^node_modules$']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50

" Coc related stuff
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <F2> <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Load style settings from a typescript.json file
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Different binding for different coc commands
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Custom clang formatting settings: https://clang.llvm.org/docs/ClangFormatStyleOptions.html
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AllowShortLoopsOnASingleLine": "false",
            \ "AllowShortBlocksOnASingleLine": "false",
            \ "AllowShortLambdasOnASingleLine": "false",
            \ "AlignConsecutiveMacros": "true",
            \ "AllowShortCaseLabelsOnASingleLine": "true",
            \ "AllowAllArgumentsOnNextLine": "true",
            \ "AllowShortFunctionsOnASingleLine": "false", 
            \ "ColumnLimit": 120,
            \ "Standard" : "c++17"}

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

" Clang settings
autocmd Filetype c, cpp, objc ClangFormatAutoEnable
" Format c, cpp, objc code on save
autocmd BufWritePre *.c,*.h,*.cpp,*.hpp,*.objc ClangFormat

" Prettier formatting
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html, PrettierAsync

" Automatically update rust files on save using rustfmt
let g:rustfmt_autosave = 1

" Airline settings
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"""" CUSTOM FILE TYPE CONFIGS
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" Define custom leader mappings for golang
augroup go
    au!
    au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
    au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
    au FileType go nmap <Leader>db <Plug>(go-doc-browser)
    au FileType go nmap <leader>r  <Plug>(go-run)
    au FileType go nmap <leader>t  <Plug>(go-test)
    au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
    au FileType go nmap <C-g> :GoDecls<cr>
    au FileType go nmap <leader>dr :GoDeclsDir<cr>
    au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
    au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
    au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
augroup END
