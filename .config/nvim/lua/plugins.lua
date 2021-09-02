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

-- Plugins list
return require('packer').startup(function(use)

  -- Plugin Manager
  use {'wbthomason/packer.nvim'}

  -- LSP Plugins
  use {'glepnir/lspsaga.nvim'}
  use {"ray-x/lsp_signature.nvim"}
  use {"nvim-lua/lsp_extensions.nvim"}
  use {'simrat39/symbols-outline.nvim'}
  use {'nvim-lua/lsp-status.nvim'}
  use {'neovim/nvim-lspconfig',
        config = function()
          require("lsp")
        end,
      }


  -- Completion
  use{"onsails/lspkind-nvim"}
  use{"windwp/nvim-autopairs"}
  use{"hrsh7th/vim-vsnip"}
  use{"hrsh7th/vim-vsnip-integ"}
  use{"hrsh7th/cmp-nvim-lsp" }
  use{"hrsh7th/cmp-path" }
  use{"hrsh7th/cmp-vsnip" }
  use{
    "hrsh7th/nvim-cmp",
    config = function()
      require("lsp.comp")
    end,
  }

  -- Treesitter
  use{
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "p00f/nvim-ts-rainbow",
    },
     run = ":TSUpdate",
     config = function()
       require("treesitter")
     end,
  }
  use {
      "danymat/neogen",
      requires = "nvim-treesitter/nvim-treesitter",
      config = function()
          require('neogen').setup {
              enabled = true
          }
      end,
  }

  -- Fuzzy finder
  use {'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-bibtex.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', run = "make"},
    }
  }
  use {'nvim-telescope/telescope-media-files.nvim'}

  -- Theme and feel
  use {'eddyekofo94/gruvbox-flat.nvim'}
  use {
    'akinsho/nvim-bufferline.lua',
    config = function ()
      require("looks.bufferline")
    end,
  }
  use {"kyazdani42/nvim-web-devicons"}
  use {
    'glepnir/galaxyline.nvim',
    config = function()
      require("looks.galaxyline")
    end,
  }
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("looks.nvim-tree")
    end,
  }

  -- Git
  use {'tpope/vim-fugitive'}
  use {'rhysd/git-messenger.vim'}
  use {'TimUntersberger/neogit'}
  use {'rhysd/committia.vim'}
  use {'ThePrimeagen/git-worktree.nvim'}
  use {'lewis6991/gitsigns.nvim'}

  -- Languages specific Plugin
  use {'akinsho/flutter-tools.nvim'}
  use {'ray-x/go.nvim'}
  use {"folke/lua-dev.nvim"}
  use {'previm/previm'}
  use {'gyim/vim-boxdraw'}

  -- Startup Improvement
  use {
    'lewis6991/impatient.nvim',
  }
  use {
    'glepnir/dashboard-nvim',
    config = function()
      require("looks.dashboard")
    end,
  }

  -- Miscellaneous
  use {'yuttie/comfortable-motion.vim'}
  use {'matze/vim-move'}
  use {'jiangmiao/auto-pairs'}
  use {'godlygeek/tabular'}
  use {'Chiel92/vim-autoformat'}
  use {'tyru/open-browser.vim'}
  use {'mattn/emmet-vim'}
  use {'b3nj5m1n/kommentary'}
  use {'machakann/vim-sandwich'}
  use {'oberblastmeister/neuron.nvim'}
  use {"elianiva/telescope-npm.nvim"}
  use {'lukas-reineke/indent-blankline.nvim'}
  use{
    'vhyrro/neorg',
    branch = "unstable",
    requires = 'vhyrro/neorg-telescope',
    config = function()
      require("norg")
    end,
    after = "nvim-treesitter",
  }
  use {
    'andweeb/presence.nvim',
    config = function()
      require("looks.rpc")
    end,
  }
  use {
    "folke/todo-comments.nvim",
    config = function ()
      require("looks.todo-comments")
    end
  }


  -- Debugging
  use {'mfussenegger/nvim-dap',
  requires = {
    'rcarriga/nvim-dap-ui'
  }
}

end)
