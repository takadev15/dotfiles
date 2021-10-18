-- #############################################
-- ########## load all the plugins ##############
-- #############################################

local vim = vim
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- Check if packer exists
if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))

  vim.fn.mkdir(directory, "p")

  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print(out)
  print("Downloading packer.nvim...")

  return
end

-- Plugins list
-- TODO: Refactor the positioning of plugins
return require("packer").startup({
  function(use)
    -- Plugin Manager
    use({ "wbthomason/packer.nvim" })

    -- stdlib
    use({ "nvim-lua/plenary.nvim" })

    -- LSP things
    use({ "glepnir/lspsaga.nvim" })
    use({ "ray-x/lsp_signature.nvim" })
    use({ "nvim-lua/lsp_extensions.nvim" })
    use({ "simrat39/symbols-outline.nvim" })
    use({ "nvim-lua/lsp-status.nvim" })
    use({
      "neovim/nvim-lspconfig",
      config = function()
        require("modules.lsp")
      end,
    })

    -- Completion
    use({ "windwp/nvim-autopairs" })
    use({ "windwp/nvim-ts-autotag" })
    use({ "hrsh7th/vim-vsnip" })
    use({ "hrsh7th/vim-vsnip-integ" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/cmp-vsnip" })
    use({
      "hrsh7th/nvim-cmp",
      config = function()
        require("modules.completion.cmp")
      end,
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("modules.treesitter")
      end,
    })
    use({ "nvim-treesitter/nvim-treesitter-refactor", requires = "nvim-treesitter" })
    use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter" })
    use({ "p00f/nvim-ts-rainbow", requires = "nvim-treesitter" })
    use({ "nvim-treesitter/playground", requires = "nvim-treesitter" })
    use({ "SmiteshP/nvim-gps" })
    use({
      "danymat/neogen",
      requires = "nvim-treesitter/nvim-treesitter",
      config = function()
        require("neogen").setup({
          enabled = true,
        })
      end,
    })

    -- Fuzzy finder
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-bibtex.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
    })
    use({ "nvim-telescope/telescope-media-files.nvim" })
    use({ "nvim-telescope/telescope-project.nvim" })
    use({ "GustavoKatel/telescope-asynctasks.nvim" })
    use({
      "crispgm/telescope-heading.nvim",
      ft = "markdown",
      config = function()
        require("telescope").load_extension("heading")
      end,
    })

    -- User Interface
    -- TODO: Complete feline config and switch
    use({ "marko-cerovac/material.nvim" })
    use({ "EdenEast/nightfox.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })
    --[[ use {
      'GustavoKatel/sidebar.nvim',
      config = function ()
        require("ui.sidebar")
      end,
    } ]]
    use({
      "goolord/alpha-nvim",
      config = function()
        require("modules.ui.dashboard")
      end,
    })
    use({
      "akinsho/nvim-bufferline.lua",
      config = function()
        require("modules.ui.bufferline")
      end,
    })
    --[[ use{
      "famiu/feline.nvim",
      requires = { "SmiteshP/nvim-gps" },
      config = function()
        vim.cmd("PackerLoad lsp-status.nvim")
        require("modules.ui.line")
        -- require("feline").setup()
      end,
    } ]]

    use({
      "NTBBloodbath/galaxyline.nvim",
      config = function()
        require("modules.ui.line")
      end,
    })

    use({
      "kyazdani42/nvim-tree.lua",
      config = function()
        require("modules.ui.nvim-tree")
      end,
    })

    -- Git
    use({ "tpope/vim-fugitive" })
    use({ "rhysd/committia.vim" })
    use({ "ThePrimeagen/git-worktree.nvim" })
    use({
      "rhysd/git-messenger.vim",
      keys = "<leader>gm",
      config = function()
        vim.g.git_messenger_close_on_cursor_moved = true
        vim.g.git_messenger_include_diff = "current"
        vim.g.git_messenger_close_on_cursor_moved = false
        vim.g.git_messenger_into_popup_after_show = true
        vim.g.git_messenger_always_into_popup = true
        vim.g.git_messenger_max_popup_height = 20
        vim.g.git_messenger_max_popup_width = 50
        vim.g.git_messenger_floating_win_opts = {
          border = "single",
        }
        vim.g.git_messenger_popup_content_margins = true
      end,
    })
    use({
      "TimUntersberger/neogit",
      requires = { "sindrets/diffview.nvim" },
    })
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("modules.git.gitsigns")
      end,
    })

    -- Debugger
    use({ "mfussenegger/nvim-dap", requires = {
      "rcarriga/nvim-dap-ui",
    } })

    -- Testing and Running code
    use({
      "rcarriga/vim-ultest",
      requires = "vim-test/vim-test",
      run = ":UpdateRemotePlugins",
      cmd = { "Ultest", "UltestNearest", "UltestDebug", "UltestDebugNearest" },
    })
    use({
      "skywind3000/asyncrun.vim",
      requires = { "skywind3000/asynctasks.vim" },
      config = function()
        require("modules.misc.async_conf")
      end,
    })

    -- Languages specific Plugin
    use({ "akinsho/flutter-tools.nvim" })
    use({ "ray-x/go.nvim" })
    use({ "simrat39/rust-tools.nvim" })
    use({ "folke/lua-dev.nvim" })
    use({ "jose-elias-alvarez/null-ls.nvim" })
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
    use({ "plasticboy/vim-markdown", ft = "markdown" })
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      config = function()
        -- vim.g.mkdp_browser = 'brave'
      end,
      ft = { "markdown" },
    })
    use({
      "dccsillag/magma-nvim",
      run = ":UpdateRemotePlugins",
    })
    use({
      "NTBBloodbath/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = false,
          -- Highlight request on run
          highlight = {
            enabled = true,
            timeout = 150,
          },
          -- Jump to request line on run
          jump_to_request = false,
        })
      end,
    })

    -- Startup Improvement
    -- TODO: Remove impatent after neovim/pull/15436 merged
    use({
      "lewis6991/impatient.nvim",
    })

    -- Commenting
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    })
    use({
      "folke/todo-comments.nvim",
      config = function()
        require("modules.ui.todo-comments")
      end,
    })

    -- Miscellaneous
    use({ "yuttie/comfortable-motion.vim" })
    use({ "matze/vim-move" })
    use({ "jiangmiao/auto-pairs" })
    use({ "godlygeek/tabular" })
    use({ "Chiel92/vim-autoformat" })
    use({ "tyru/open-browser.vim" })
    use({ "mattn/emmet-vim" })
    use({ "machakann/vim-sandwich" })
    use({ "oberblastmeister/neuron.nvim" })
    use({ "elianiva/telescope-npm.nvim" })
    use({ "lukas-reineke/indent-blankline.nvim" })
    use({ "tpope/vim-dadbod", requires = { "kristijanhusak/vim-dadbod-ui" }, ft = "sql" })
    -- use {'aserowy/tmux.nvim'}
    use({
      "chentau/marks.nvim",
      config = function()
        require("marks").setup({
          default_mappings = true,
        })
      end,
    })
    use({
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
    })
    use({
      "vhyrro/neorg",
      branch = "unstable",
      requires = "vhyrro/neorg-telescope",
      config = function()
        require("modules.misc.neorg")
      end,
      after = "nvim-treesitter",
    })
    use({
      "andweeb/presence.nvim",
      config = function()
        require("modules.misc.discordo")
      end,
    })
    use({
      "pwntester/octo.nvim",
      cmd = "Octo",
      config = function()
        require("octo").setup({
          default_remote = { "upsteam", "origin", "main" },
        })
      end,
    })
    use({
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          background_colour = "#000000",
          stages = "slide",
        })
      end,
    })
  end,

  --[[ config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  }, ]]
})
