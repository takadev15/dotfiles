"-------------------Vim-Plug--------------------------
call plug#begin()

" Git related plugin
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Fuzzy finder
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

"telescope (fzf replacement)
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Looks and feel
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'ghifarit53/tokyonight-vim'
"Plug 'dracula/vim', { 'as': 'dracula' }

" Dadbod for database plugin
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

" Intellisense 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vimspector for debugging
Plug 'puremourning/vimspector'

" Documentation
Plug 'kkoomen/vim-doge'

" Misc plugins
Plug 'liuchengxu/vista.vim'
Plug 'pacha/vem-tabline'
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'godlygeek/tabular'
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'Chiel92/vim-autoformat'
Plug 'tyru/open-browser.vim'
Plug 'https://github.com/ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Language-specific plugin
Plug 'dart-lang/dart-vim-plugin'
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'lervag/vimtex'
Plug 'previm/previm'
Plug 'glench/Vim-Jinja2-Syntax'
"Plug 'https://github.com/kiteco/vim-plugin'

call plug#end()

let mapleader = ","

"---------------KEYBOARD MAPPING---------------------
map <leader>fl :LuaTreeToggle<CR>
map <F1> :Vista!!<CR>

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Tab
nmap <leader>t :tabnew<return>
nmap <S-Tab> :tabprev<return>
nmap <Tab> :tabnext<return>
" resizing vim pane
nnoremap <A-k> :resize +2<CR>
nnoremap <A-j> :resize -2<CR>
nnoremap <A-h> :vertical resize -2<CR>
nnoremap <A-l> :vertical resize +2<CR>

inoremap <A-l> <esc>la
inoremap <A-h> <esc>i

" Version control
map <leader>gs :G<CR>

" telescope.nvim`
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" ---------------GENERAL SETTINGS--------------------

set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir= ~/.nvim/undo-file/
set encoding=utf-8
set wildmenu
set wildoptions=pum
set lazyredraw
set ttyfast
set clipboard+=unnamedplus
set mouse=nicr
set autoindent
set breakindent
set breakindentopt=shift:2,min:40,sbr
set formatoptions=l
set lbr
set smartindent
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set laststatus=2
set relativenumber
set updatetime=300
set pumheight=5
set completeopt=longest,menuone
set hidden
set backspace=indent,eol,start
set nofoldenable
set shell=/bin/bash
set nocompatible
let $SHELL="/bin/bash"
filetype plugin indent on
syntax on


let $FZF_DEFAULT_COMMAND = 'rg'
"--------------------THEME-----------------------

set termguicolors
let g:tokyonight_style = "night"
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
colorscheme tokyonight

"Make vim respect terminal color 
highlight Normal guibg=none
highlight NonText guibg=none

"Hide tilde sign for empty line
set fcs=eob:\  

" Disable vertical split
hi VertSplit ctermbg=NONE guibg=NONE

"-------------Startify--------------------------

let g:ascii = [
			\' _________  ________  ___  __    ________    _____  ________  ',
			\'|\___   ___\\   __  \|\  \|\  \ |\   __  \  / __  \|\   ____\   ',
			\'\|___ \  \_\ \  \|\  \ \  \/  /|\ \  \|\  \|\/_|\  \ \  \___|_  ',
			\'     \ \  \ \ \   __  \ \   ___  \ \   __  \|/ \ \  \ \_____  \  ',
			\'      \ \  \ \ \  \ \  \ \  \\ \  \ \  \ \  \   \ \  \|____|\  \  ',
			\'       \ \__\ \ \__\ \__\ \__\\ \__\ \__\ \__\   \ \__\____\_\  \ ',
			\'        \|__|  \|__|\|__|\|__| \|__|\|__|\|__|    \|__|\_________\ ',
			\'                                                      \|_________|',
			\'
            \']

let g:startify_custom_header =
            \'startify#center(g:ascii +startify#fortune#quote())'


"============= Load File ===================
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/treesitter.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/plugins.vim
