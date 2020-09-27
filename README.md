# Vim configuration

This repository includes all the configuration files that use with Vim. I'am currently using Vim as my main text editor so there might be lots of changes to the configuration.

## Installation

```
git clone https://github.com/nireo/vim-config ~/.config/nvim
```

Make sure you have all these dependencies installed with npm:

```
npm install -g coc.nvim neovim
```

You can install additional coc extensions to have autocompletion for many different languages, for example:

```
# golang, html, typescript, coc-clangd
:CocInstall coc-go coc-html coc-tsserver coc-clangd
```

Those are just examples of the coc extensions. A full list of implemented coc extensions can be found [here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions).

## Screenshot

![Screenshot of editor](./editor-screenshot.png)

## Plugins

### Not language specific

-   [coc.nvim](https://github.com/neoclide/coc.nvim)
-   [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
-   [fzf](https://github.com/junegunn/fzf)
-   [fzf.vim](https://github.com/junegunn/fzf.vim)
-   [NERDCommenter](https://github.com/scrooloose/nerdcommenter)

### Language specific

-   C++
    -   [vim-cpp-enhanced-highlight](https://github.com/vim-cpp-enhanced-highlight)
    -   [vim-clang-format](https://github.com/rhysd/vim-clang-format)
-   Go
    -   [vim-go](https://github.com/fatih/vim-go)
-   Javascript & Typescript
    -   [vim-prettier](https://github.com/vim-prettier)
    -   [yats.vim](https://github.com/HerringtonDarkholme/yats.vim)
