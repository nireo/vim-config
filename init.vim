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

" FuzzyFileFinder is for quickly searching files in directory
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Improved comments
Plug 'scrooloose/nerdcommenter'

" Themes
Plug 'xero/sourcerer.vim'
Plug 'Lokaltog/vim-monotone'
Plug 'pbrisbin/vim-colors-off'
Plug 'tomasr/molokai'
Plug 'aonemd/kuroi.vim'
Plug 'nightsense/cosmic_latte'
Plug 'romainl/apprentice'

" C++ plugins
Plug 'rhysd/vim-clang-format'
Plug 'bfrg/vim-cpp-modern'

" Latex
Plug 'lervag/vimtex'

" Golang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Web development
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'HerringtonDarkholme/yats.vim' 
Plug 'leafgarland/typescript-vim'

" Rust plugins
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
call plug#end()

"""""""""" THEME SETTINGS

" For syntax highlighting
filetype plugin indent on
syntax on

if has('termguicolors')
    set termguicolors
end

" Configuration of the monotone colorscheme
let g:monotone_emphasize_comments = 1 " Emphasize comments
let g:monotone_contrast_factor = 0.95

set t_Co=256
set background=dark
colorscheme molokai

" Use space as the leader key sincei can just keep my hands on the homerow all
" the time.
let mapleader = "\<Space>"

source ~/.config/nvim/src/settings.vim
source ~/.config/nvim/src/mappings.vim


""""""""""""" PLUGIN SETTINGS 

" Rooter configuration
" A quite common pattern is to use '=src', but It is kind of bad, when working
" with rust, since cannot open the full directory.
let g:rooter_patterns = ['.git', 'main.go', 'node_modules', 'Makefile', 'main.cpp', 'Cargo.toml']

" Different go syntax highlight settings
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

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1

" Latex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" List of extensions to update and install
let g:coc_global_extensions = [
  \ 'coc-snippets',
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

" Go to the previous diagnostic
nmap <silent> [g <Plug>(coc-diagnostic-prev)
" Go to the next diagnostic
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Show documentation of the hovered item
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

let g:fzf_layout = { 'down': '~25%' }
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" Coc related stuff
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Load style settings from a typescript.json file
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
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
            \ "Standard" : "c++11"}

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" Clang settings
autocmd Filetype c, cpp, objc ClangFormatAutoEnable
" Format c, cpp, objc code on save
autocmd BufWritePre *.c,*.h,*.cpp,*.hpp,*.objc ClangFormat

" Prettier formatting
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html, PrettierAsync

" Automatically update rust files on save using rustfmt
let g:rustfmt_autosave = 1

"""" CUSTOM FILE TYPE CONFIGS
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4


