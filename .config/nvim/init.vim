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
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'TimUntersberger/neogit'
Plug 'lewis6991/gitsigns.nvim'

" Fuzzy finder
"Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
"Plug 'junegunn/fzf.vim'

" Tree explorer
Plug 'kyazdani42/nvim-tree.lua'

"telescope (fzf replacement)
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Looks and feel
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Th3Whit3Wolf/one-nvim'
"Plug 'glepnir/zephyr-nvim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'jsit/toast.vim'
"Plug 'bluz71/vim-moonfly-colors'
"Plug 'christianchiarulli/nvcode-color-schemes.vim'
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
Plug 'gyim/vim-boxdraw'
"Plug 'https://github.com/ap/vim-css-color'
"Plug 'https://github.com/kiteco/vim-plugin'

" Discord rpc
Plug 'andweeb/presence.nvim'

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
Plug 'b3nj5m1n/kommentary'

call plug#end()

let mapleader = ","


"---------------KEYBOARD MAPPING---------------------

map <leader>fd :NvimTreeToggle<CR>
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
nmap <leader>q :bd<CR>

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
highlight LineNr guifg=#3f3f3f
"highlight LineNr guifg=Red
"highlight CursorLineNr ctermbg=NONE ctermfg=Red guibg=NONE guifg=Red

"Hide tilde sign for empty line
"set fcs=eob:\  

" Disable vertical split
hi VertSplit ctermbg=NONE guibg=NONE

set shell=/usr/bin/zsh

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
\' by ',
\'',
\'  _____     _        _ ___ ',                            
\'|_   _|_ _| |____ _/ | __|',
\'  | |/ _` | / / _` | |__ \',
\'  |_|\__,_|_\_\__,_|_|___/',
\'',
\]

let g:startify_custom_header =
            \'startify#center(g:ascii +startify#fortune#quote())'



"-------------------PLUGIN CONFIG----------------------------

"================Dadbod-UI====================
let g:db_ui_use_nerd_fonts = 1
let g:db_ui_winwidth = 30
let g:db_ui_save_location = '~/Queries'

"==============Telescope.nvim=================
"lua <<EOF
"-- totally optional to use setup
"require('telescope').setup{
"  defaults = {
"    shorten_path = true, -- currently the default value is true
"    mappings = {
"    i = {
"          ["<C-j>"] = require('telescope.actions').move_selection_next,
"      ["<C-k>"] = require('telescope.actions').move_selection_previous,
"
"    },
"    },
"  }
"}
"EOF
"nnoremap <C-p> <cmd>lua require'telescope.builtin'.find_files{find_command = {"fd", "-i", "--hidden", "-g", "!.git" }}<CR>
"nnoremap <Leader>fg <cmd>lua require'telescope.builtin'.git_files{}<CR>


"================Vimspector====================
let g:vimspector_enable_mappings = 'HUMAN'

"================Vim-Move======================
let g:move_key_modifier = 'A-S'

"==============PlantUML=======================
let g:preview_uml_url='http://localhost:8888'

"================Vim Autoformat================
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"================ Vim-Scroll ============
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"


"=====================Vista.vim========================
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
"let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

"======================== nvim-tree =======================
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 30 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 0 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \}
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
" let lua_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': ""
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'symlink': "",
    \   }
    \ }

"highlight NvimTreeFolderIcon guibg=blue


"=====================kite====================
"enable auto complete
"let g:kite_auto_complete=1
"let g:kite_tab_complete=1

"============previm===================
"enable previm to preview in browser
let g:previm_open_cmd = 'brave'

"==============vimwiki===================
let g:vimwiki_list = [{'path': '~/notes/'}]

  
  
"---------------------coc config-----------------------------------
let g:coc_global_extensions = [
 \ 'coc-pairs',
 \ 'coc-json',
 \ 'coc-java',
 \ 'coc-go',
 \ 'coc-lua',
 \ 'coc-docker',
 \ 'coc-snippets',
 \ 'coc-tsserver',
 \ 'coc-tailwindcss',
 \ 'coc-rust-analyzer',
 \ 'coc-emmet',
 \ 'coc-json',
 \ 'coc-vimlsp',
 \ 'coc-sql',
 \ 'coc-clangd',
 \ 'coc-sh',
 \ 'coc-pyright',
 \ 'coc-texlab',
 \ 'coc-gitignore',
 \ 'coc-html',
 \ 'coc-css',
 \ 'coc-git',
 \ 'coc-highlight',
 \ 'coc-flutter',
 \ 'coc-actions',
 \ 'coc-db',
 \ 'coc-eslint'] 


"---------------------CoC Keymap---------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Formatting selected code. 
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"---------------------Coc-Fzf------------------------------------
"nnoremap <silent> <C-p> :CocCommand fzf-preview.DirectoryFiles<CR>
"nnoremap <silent> <Leader>fg :CocCommand fzf-preview.GitFiles<CR>
"nnoremap <silent> <Leader>b :CocCommand fzf-preview.Buffers<CR>
"nnoremap <silent> <Leader>fv :CocCommand fzf-preview.VistaCtags<CR>
"nnoremap <silent> <Leader>g :CocCommand fzf-preview.GitActions<CR>
"nnoremap <silent> <Leader>gs :CocCommand fzf-preview.GitStatus<CR>


" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1

" devicons character width
let g:fzf_preview_dev_icon_prefix_string_length = 3

" Devicons can make fzf-preview slow when the number of results is high
" By default icons are disable when number of results is higher that 5000
let g:fzf_preview_dev_icons_limit = 3000



"============================Treesitter config-=====================

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c" },  -- list of language that will be disabled
  },
}
EOF


"============= Load File ===================
"source ~/.config/nvim/statusline.lua
luafile $HOME/.config/nvim/lua/theme.lua
luafile $HOME/.config/nvim/lua/plug.lua
