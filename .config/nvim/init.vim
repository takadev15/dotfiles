"
			"' _________  ________  ___  __    ________    _____  ________  
			"'|\___   ___\\   __  \|\  \|\  \ |\   __  \  / __  \|\   ____\   
			"'\|___ \  \_\ \  \|\  \ \  \/  /|\ \  \|\  \|\/_|\  \ \  \___|_  
			"'     \ \  \ \ \   __  \ \   ___  \ \   __  \|/ \ \  \ \_____  \  
			"'      \ \  \ \ \  \ \  \ \  \\ \  \ \  \ \  \   \ \  \|____|\  \  
			"'       \ \__\ \ \__\ \__\ \__\\ \__\ \__\ \__\   \ \__\____\_\  \ 
			"'        \|__|  \|__|\|__|\|__| \|__|\|__|\|__|    \|__|\_________\ 
			"'                                                      \|_________|
			"'
                        "
                        "-------------------Vim-Plug--------------------------
call plug#begin()

" Git related plugin
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'

" Fuzzy finder
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" Tree explorer
Plug 'kyazdani42/nvim-tree.lua'

"telescope (fzf replacement)
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Looks and feel
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'jsit/toast.vim'
Plug 'Th3Whit3Wolf/one-nvim'
"Plug 'bluz71/vim-moonfly-colors'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
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

" Status line and Tab
"Plug 'pacha/vem-tabline'
"Plug 'itchyny/lightline.vim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" Syntax Highliting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Vimwiki
Plug 'vimwiki/vimwiki'

" Language-specific plugin
Plug 'dart-lang/dart-vim-plugin'
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'lervag/vimtex'
Plug 'previm/previm'
Plug 'glench/Vim-Jinja2-Syntax'
Plug 'https://github.com/plasticboy/vim-markdown'
"Plug 'https://github.com/ap/vim-css-color'
"Plug 'https://github.com/kiteco/vim-plugin'

" Misc plugins
Plug 'liuchengxu/vista.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'Chiel92/vim-autoformat'
Plug 'tyru/open-browser.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'


call plug#end()

let mapleader = ","

"---------------KEYBOARD MAPPING---------------------
map <leader>fl :NvimTreeToggle<CR>
map <F1> :Vista!!<CR>

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Tab
nmap <leader>t :enew<CR>
nmap <S-Tab> :BufferLineCyclePrev<CR>
nmap <Tab> :BufferLineCycleNext<CR>
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
set undodir=~/.nvim/undo-file/
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
colorscheme one-nvim
highlight Normal guibg=NONE
highlight NonText guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE
highlight Pmenu ctermbg=NONE guibg=#292927
"set background=dark
lua require'bufferline'.setup{}

"Make vim respect terminal color 
highlight Normal guibg=none
highlight NonText guibg=none

"Hide tilde sign for empty line
set fcs=eob:\  

" Disable vertical split
hi VertSplit ctermbg=NONE guibg=NONE

"-------------Startify--------------------------

let g:ascii = [
\'',
\'       ▄▄        ▄▄ ',
\'     ▄████       ███▄                                            ▄▄ ',
\'   ▄ ▀█████▄     █████                                           ▀▀ ',
\'   ▌ ▀▄██████    █████     ▌ ▄▀▀▄▄   ▄▄▀▀ ▄    ▄ ▀▀▄▄ ▓█▄    ▄█▌▐██ ▐██▄███▄▄▓███▄ ',
\'   ▌    ▀█████▄  █████     ▌     ▐  ▓      █ ▄▀     ▐▌ ██▄  ▄█▌ ▐██ ▐██   ▐██   ▓██ ',
\'   ▌   ▐  ██████ █████     ▌     ▐▌ █▀▀▀▀▀▀▀ █       █  ██ ▐██  ▐██ ▐██   ▐██   ▐██ ',
\'   ▌   ▐   ▀█████▄████     ▌     ▐▌ █        ▀▄      █   ████   ▐██ ▐██   ▐██   ▐██ ',
\'   ▌   ▐    ▀█████▄▀██     ▌     ▐   ▀▀▄▄▄▀▀   ▀▄▄▄▀▀    ▐▀▀    ▐▀▀ ▐▀▀   ▐▀▀   ▐▀▀ ',
\'   ▀   ▐      ▀█████ █ ',
\'     ▀▄▐       ▀████ ',
\'       ▀         ▀ ',
\'',
            \]

let g:startify_custom_header =
            \'startify#center(g:ascii +startify#fortune#quote())'


"============= Load File ===================
"source ~/.config/nvim/statusline.lua
source ~/.config/nvim/treesitter.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/plugins.vim
luafile $HOME/.config/nvim/statusline.lua
