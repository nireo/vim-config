" Neovim configuration of nireo
" github.com/nireo/vim-config

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

" Vim statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Improved comments
Plug 'scrooloose/nerdcommenter'

" Themes
Plug 'djjcast/mirodark'
Plug 'andreypopp/vim-colors-plain'
Plug 'mkarmona/colorsbox'
Plug 'arzg/vim-colors-xcode'
Plug 'nightsense/carbonized'
Plug 'danilo-augusto/vim-afterglow'
Plug 'ajh17/Spacegray.vim'
Plug 'liuchengxu/space-vim-dark'

" C++ plugins
Plug 'rhysd/vim-clang-format'
Plug 'octol/vim-cpp-enhanced-highlight'

" Golang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Javascript & typescript plugins
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'HerringtonDarkholme/yats.vim' 
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'

" enhance syntax rendering in javascript
Plug 'jelera/vim-javascript-syntax'

" Rust
Plug 'rust-lang/rust.vim'
call plug#end()

"""""""""" THEME SETTINGS

"if has('termguicolors') 
"  set termguicolors
"endif
if !has('gui_running')
  set t_Co=256
endif

" Enable syntax highlighting
syntax enable

" set the default theme to be dark instead of light
set background=dark

let g:space_vim_dark_background = 233
" Set the colorscheme
colorscheme space-vim-dark

let mapleader=','


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

" disable the cursor in normal mode
" set guicursor=
" highlight Cursor guifg=black guibg=white

" Show matching brackets
set showmatch
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

" Number of screen lines to use for the command-line
set cmdheight=1

" unload buffer when it is abandoned
set hidden 

set updatetime=300
set timeoutlen=300
set shortmess+=c
set signcolumn=yes

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
set smartcase
set hlsearch

" set unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, just use git
set nobackup
set nowb
set noswapfile

""""""""""""" CUSTOM KEYBINDINGS & SETTINGS

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

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

nnoremap <F3> :set hlsearch!<CR>

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

" Remove all trailing whitespaces command
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
  \ 'coc-rls'
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

" Netrw settings
nnoremap <silent> <F6> :Vexplore<CR>
let g:netrw_liststyle = 3

" Remove the big banner
let g:netrw_banner = 0

" Open new files in a vertical split
let g:netrw_browse_split = 1

" Make the size of the window 25% of the screen 
let g:netrw_winsize = 25

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:70%'

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

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

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
            \ "AllowShortFunctionsOnASingleLine": "false", 
            \ "ColumnLimit": 120,
            \ "Standard" : "c++17"}

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Clang settings
autocmd Filetype c, cpp, objc ClangFormatAutoEnable
" Format c, cpp, objc code on save
autocmd BufWritePre *.c,*.h,*.cpp,*.hpp,*.objc ClangFormat

" Prettier formatting
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html, PrettierAsync

" Airline settings
let g:airline_theme = 'violet'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" vim airline fonts
if !exists('g:airline_symbols')
	let g:airline_symbols= {}
endif


