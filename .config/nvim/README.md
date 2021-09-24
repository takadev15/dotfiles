# My Neovim setup

> Always WIP

## Table Of Content

<!-- vim-markdown-toc GFM -->
* [list of Plugins](#list-plugins)
* [What I'm Planning to do in the Future](#todo)

![Screenshot](./screenshot.png)

## [Plugin's List]

* Plugin Manager
  * Packer.nvim

* Stdlib
  * nvim-lua/plenary.nvim

* LSP
  * neovim/nvim-lspconfig
  * glepnir/lspsaga.nvim
  * ray-x/lsp_signature.nvim
  * nvim-lua/lsp_extensions.nvim
  * simrat39/symbols-outline.nvim
  * nvim-lua/lsp-status.nvim

* Completions
  * hrsh7th/nvim-cmp
  * windwp/nvim-autopairs
  * windwp/nvim-ts-autotag
  * hrsh7th/vim-vsnip
  * hrsh7th/vim-vsnip-integ
  * hrsh7th/cmp-nvim-lsp
  * hrsh7th/cmp-path
  * hrsh7th/cmp-vsnip

* Treesitter

## [TODO](#todo)

- [x] Switch to lua
- [ ] Refactor config (80%)
  - [x] Config wide refactor
  - [x] Refactor LSP languange specific config
  - [ ] Refactor plugins.lua
  - [x] Refactor module (Plugin) specific config
- [ ] switch statusline to feline
- [x] add workspace wide diagnostic
- [ ] snippets
  - [x] Markdown
  - [ ] C
  - [ ] dart
  - [x] tex
  - [ ] Golang
