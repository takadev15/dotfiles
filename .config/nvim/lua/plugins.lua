-- #############################################
-- ########## To load the plugins ##############
-- #############################################

local vim = vim
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- Check if packer exists
if not packer_exists then
   if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
     return
   end

   local directory = string.format(
     '%s/site/pack/packer/opt/',
     vim.fn.stdpath('data')
   )

   vim.fn.mkdir(directory, 'p')

   local out = vim.fn.system(string.format(
     'git clone %s %s',
     'https://github.com/wbthomason/packer.nvim',
     directory .. '/packer.nvim'
   ))

   print(out)
   print("Downloading packer.nvim...")

   return
end

return require('packer').startup(function()

  -- Plugin Manager
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP Plugins
  use {'neovim/nvim-lspconfig'}
  use {'kabouzeid/nvim-lspinstall'}

  -- Completion
  use {
    'hrsh7th/nvim-compe',
    requires = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ'
    }
  }

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter',
    run = function() vim.cmd[[TSUpdate]] end
  }
  -- Fuzzy finder
  use {'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim'
    }
  }

  -- Colors
  use {'Th3Whit3Wolf/one-nvim'}
  use {'glepnir/galaxyline.nvim'}
  use {'akinsho/nvim-bufferline.lua'}

  -- Git
  use {'tpope/vim-fugitive'}
  use {'rhysd/git-messenger.vim'}
  use {'TimUntersberger/neogit'}
  use {'lewis6991/gitsigns.nvim'}

  -- Languages specific Plugin
  use {'previm/previm'}
  use {'gyim/vim-boxdraw'}

  -- Miscellaneous
  use {'andweeb/presence.nvim'}
  use {'yuttie/comfortable-motion.vim'}
  use {'matze/vim-move'}
  use {'jiangmiao/auto-pairs'}
  use {'godlygeek/tabular'}
  use {'Chiel92/vim-autoformat'}
  use {'tyru/open-browser.vim'}
  use {'mattn/emmet-vim'}
  use {'mhinz/vim-startify'}
  use {'b3nj5m1n/kommentary'}
  use {'machakann/vim-sandwich'}

  -- Debugging
  use {'puremourning/vimspector'}

end)
