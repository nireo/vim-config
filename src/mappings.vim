" src/mappings.vim
" This file contains all the custom mappings I've made for vim. There are lots
" of bindings that I'm just testing.

" Move by line
nnoremap j gj
nnoremap k gk

" Such that I dont have to press shift when wanting to use commands
nnoremap ; :

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

" Duplicate lines
nnoremap <Leader>d m`YP``
vnoremap <Leader>d YPgv

" Use the arrow keys for window navigation since I wasn't really using them
" anyway so I decided to use them for something.
map <Up>   <C-W>k
map <Down> <C-W>j
map <Left> <C-W>h
map <Right> <C-W>l

" Disable the esc key for practice using C-k & C-j
inoremap <Esc> <nop>

" add a save key binding instead of writing the command :w
nmap <leader>w :w!<cr>

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

" Exit and save the file
nmap <leader>q :wq!<cr>

" Select all
map <leader>sa ggVG"

" Delete all
map <leader>da ggVGdd

" Copy all contents of a file to the clipboard
map <leader>ca ggVGy

" These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Custom split keybindings
nnoremap <leader>h :<C-u>split<CR>
nnoremap <leader>v :<C-u>vsplit<CR>

" H To move to the start of a line.
" L to move to the end of a line.
nnoremap H ^
nnoremap L $
nnoremap K {
nnoremap J }

" Abbreviations for different miss spellings of common commands
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

" Different keybindings to save
nnoremap <Leader>w :write<CR>
xnoremap <Leader>w <Esc>:write<CR>
