" Mode mappings
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

" Display the current vim mode in text
function! CurrentMode() abort
    let l:currentmode = mode()
    let l:modelist = get(g:modes, l:currentmode, 'V·Block ')
    let l:current_status_mode = l:modelist
    return ' '.l:current_status_mode.' '
endfunction

" Return the git branch of the root directory
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
