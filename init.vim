"" nvim configuration by nireo
" github.com/nireo/nvim

"""""""""""" PLUGINS
call plug#begin('~/.vim/plugged')
" Intellisense engine, with full language server protocal support (auto completion & auto imports)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Show git indications for added, modified and removed files
Plug 'airblade/vim-gitgutter'

" Detect a root directory
Plug 'airblade/vim-rooter'

" display buffers and a statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" FuzzyFileFinder is for quickly searching files in directory
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'xero/sourcerer.vim'
Plug 'Lokaltog/vim-monotone'
Plug 'andreypopp/vim-colors-plain'
Plug 'mswift42/vim-themes'
Plug 'owickstrom/vim-colors-paramount'

" C++ plugins
Plug 'rhysd/vim-clang-format'
Plug 'jackguo380/vim-lsp-cxx-highlight'

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

filetype plugin indent on
syntax on

if has('termguicolors')
  set termguicolors
end

" Set the theme
set t_Co=256
set background=dark

" Configure the monotone theme
let g:monotone_emphasize_comments = 1 " Emphasize comments
let g:monotone_contrast_factor = 0.90

try
  colorscheme plain
catch
  colorscheme default
endtry

" Set the leader key to a good position, which is easy to access
let mapleader = "\<Space>"

source ~/.config/nvim/src/settings.vim " Load the settings for example `set hidden`
source ~/.config/nvim/src/mappings.vim " Load all of the custom mappings
source ~/.config/nvim/src/plugins.vim "Load all of the settings related to the plugins above.
source ~/.config/nvim/src/filetypes.vim " Load all the custom settings for different filetypes
