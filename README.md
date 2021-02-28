# Vim configuration

This repository includes all the configuration files that use with Vim. I'am currently using Vim as my main text editor so there might be lots of changes to the configuration.

## Installation

```
git clone https://github.com/nireo/nvim ~/.config/nvim
```

You need to install different language providers for nvim:

```
npm install -g coc.nvim neovim
pip install neovim
```

You can install additional coc.nvim extensions to have auto completion for many different languages, for example:

```
" src/plugins.vim
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
```

Those are just examples of the coc extensions. A full list of implemented coc extensions can be found [here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions).

## Screenshot

![Screenshot of editor](./editor-screenshot.png)

## Plugins

### Not language specific

- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [fzf](https://github.com/junegunn/fzf)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [vim-rooter](https://github.com/airblade/vim-rooter)

### Language specific

- C++
  - [vim-cpp-enhanced-highlight](https://github.com/vim-cpp-enhanced-highlight)
  - [jackguo380](https://github.com/vim-lsp-cxx-highlight)
- Go
  - [vim-go](https://github.com/fatih/vim-go)
- Javascript & Typescript
  - [vim-prettier](https://github.com/vim-prettier)
  - [yats.vim](https://github.com/HerringtonDarkholme/yats.vim)
  - [typescript-vim](https://github.com/leafgarland/typescript-vim)
- Rust
  - [rust.vim](https://github.com/rust-lang/rust.vim)
  - [vim-racer](https://github.com/racer-rust/vim-racer)
