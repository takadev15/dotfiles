-- #############################################
-- ########## load all the plugins #############
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
return require("packer").startup({
  function(use)
    -- Plugin Manager
    use({ "wbthomason/packer.nvim" })

    -- stdlib
    use({ "nvim-lua/plenary.nvim" })

    -- LSP things
    use({
      "neovim/nvim-lspconfig",
      config = function()
        require("modules.lsp")
      end,
    })
    use({ 
      "ray-x/lsp_signature.nvim",
      config = function ()
        require("lsp_signature").setup({
          floating_window = false,
          hint_prefix = "ﰠ ",
          always_trigger = true,
        })
      end
    })
    use({
      "kosayoda/nvim-lightbulb",
      config = function()
        require("nvim-lightbulb").setup({
          sign = { enabled = false },
          virtual_text = { enabled = true },
        })
      end,
    })
    use({
      "simrat39/inlay-hints.nvim",
      config = function()
        require("inlay-hints").setup({
          inlay_hints = {
            virt_text_formatter = function(label, hint, opts, _)
              local virt_text = {}
              virt_text[#virt_text + 1] = hint.paddingLeft and { " ", "Normal" } or nil
              virt_text[#virt_text + 1] = { " " .. label .. " ", opts.highlight }
              virt_text[#virt_text + 1] = hint.paddingRight and { " ", "Normal" } or nil

              return virt_text
            end,
          },
        })
      end,
    })
    use({ "stevearc/dressing.nvim",
      config = function ()
        require("modules.dressing")
      end,
    })
    use({ "j-hui/fidget.nvim",
      config = function ()
        require("fidget").setup({
          align = { bottom = true },
          fmt = { max_width = 65 },
          sources = { ["null-ls"] = { ignore = true } },
          text = { spinner = "dots" },
          window = { relative = "editor", blend = 0 },
        })
      end,
    })
    use({
      "zbirenbaum/neodim",
      disable = true,
      event = "LspAttach",
      config = function()
        require("neodim").setup({
          update_in_insert = {
            delay = 1000,
          },
        })
      end,
    })

    -- Completion
    use({
      "hrsh7th/nvim-cmp",
      config = function()
        require("modules.completion.cmp")
      end,
    })
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "petertriho/cmp-git", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp"})
    use({ "kdheepak/cmp-latex-symbols", after = "nvim-cmp" })
    use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function ()
        require("modules.completion.autopairs")
      end,
    })
    use({
      "saadparwaiz1/cmp_luasnip",
      config = function ()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
      requires = { "L3MON4D3/LuaSnip" },
      after = "nvim-cmp",
    })
    use({ "rafamadriz/friendly-snippets" })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("modules.treesitter")
      end,
    })
    use({ 
      "cshuaimin/ssr.nvim",
      module = "ssr",
      config = function()
        require("ssr").setup({})
      end,
    })
    use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
    use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
    use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
    use({ "nvim-treesitter/playground", after = "nvim-treesitter" })
    use({ 
      "SmiteshP/nvim-navic",
      config = function()
        require("nvim-navic").setup({ highlight = true, separator = " ❯ " })
      end,
      after = "nvim-treesitter",
    })
    use({
      "danymat/neogen",
      requires = "nvim-treesitter/nvim-treesitter",
      config = function()
        require("neogen").setup({ snippet_engine = "luasnip" })
      end,
    })

    -- Fuzzy finder
    use({
      "nvim-telescope/telescope.nvim",
      config = function ()
        require("modules.telescope")
      end,
      requires = {
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
    })
    use({ "nvim-telescope/telescope-media-files.nvim" })
    use({ "nvim-telescope/telescope-bibtex.nvim" })
    use({
      "crispgm/telescope-heading.nvim",
      ft = "markdown",
      config = function()
        require("telescope").load_extension("heading")
      end,
    })

    -- User Interface
    use({ "catppuccin/nvim" })
    use({ "kyazdani42/nvim-web-devicons" })
    use({
      "goolord/alpha-nvim",
      config = function()
        require("modules.ui.dashboard")
      end,
    })
    use({
      "rafcamlet/tabline-framework.nvim",
      config = function()
        require("modules.ui.tabline")
      end,
    })
    use{
      "famiu/feline.nvim",
      requires = { "SmiteshP/nvim-gps" },
      config = function()
        require("modules.ui.feline").setup()
      end,
    } 
    use({
      "nvim-neo-tree/neo-tree.nvim",
      config = function()
        require("modules.ui.neotree")
      end,
    })

    -- Git
    use({ "tpope/vim-fugitive" })
    use({ "rhysd/committia.vim" })
    use({ "ThePrimeagen/git-worktree.nvim" })
    use({
      "rbong/vim-flog",
    })
    use({
      "rhysd/git-messenger.vim",
    })
    use({
      "f-person/git-blame.nvim",
    })
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("modules.git.gitsigns")
      end,
    })
    -- use({ "rhysd/conflict-marker.vim" })
    use({
      "akinsho/git-conflict.nvim",
      config = function()
        require("git-conflict").setup({
          default_mappings = false,
          disable_diagnostics = true,
        })
      end,
    })

    -- Debugger
    use({
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("modules.dap")
      end,
    })
    use({
      "nvim-telescope/telescope-dap.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension("dap")
      end,
    })
    use({ "mfussenegger/nvim-dap-python" })
    use({ "theHamsta/nvim-dap-virtual-text" })

    -- Testing and Running code
    use({
      "stevearc/overseer.nvim",
      config = function()
        require("overseer").setup()
      end,
    })
   use({
      "nvim-neotest/neotest",
      requires = {
        "vim-test/vim-test",
        "nvim-neotest/neotest-go",
        "rouge8/neotest-rust",
        -- "haydenmeade/neotest-jest",
        -- "marilari88/neotest-vitest",
      },
      config = function()
        require("modules.misc.neotest")
      end,
    })
    -- Languages specific Plugin
    use({ "akinsho/flutter-tools.nvim" })
    use({ 
      "ray-x/go.nvim",
      ft = { "go", "gomod", "gowork", "gohtmltmpl" },
      config = function()
        require("go").setup({
          lsp_inlay_hints = { enable = false },
          tag_transform = "snakecase",
          dap_debug_keymap = false,
          dap_debug_vt = false,
        })
      end,
    })
    use({ "p00f/clangd_extensions.nvim" })
    use({ "simrat39/rust-tools.nvim" })
    use({ 
      "folke/neodev.nvim",
      config = function ()
        require("neodev").setup{}
      end
    })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function ()
        require("modules.lsp.servers.null-ls")
      end,
    })
    use({ "jose-elias-alvarez/typescript.nvim" })
    use({
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
      config = function ()
        require("package-info").setup()
      end,
    })
    use({ "Saecki/crates.nvim" })
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
    use({ 
      "frabjous/knap"
    })
    use({ "tpope/vim-dotenv" })

    -- Startup Improvement
    -- TODO: Remove impatent after neovim/pull/15436 merged
    use({
      "lewis6991/impatient.nvim",
    })

    -- Terminal things
    use({
      "akinsho/toggleterm.nvim",
      config = function ()
        require("modules.term")
      end,
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
    use({"fedepujol/move.nvim"})
    use({
      "kylechui/nvim-surround",
      tag = "*",
      config = function()
        require("nvim-surround").setup({ highlights = { duration = 0 } })
      end,
    })
    use({ "lukas-reineke/indent-blankline.nvim" })
    use({ "tpope/vim-dadbod", requires = { "kristijanhusak/vim-dadbod-ui" }, ft = "sql" })
    use({
      "kristijanhusak/vim-dadbod-completion",
      after = "vim-dadbod",
      ft = { "sql", "msql", "plsql" },
    })
    use({ "antonk52/gitignore-grabber.nvim" }) 
    use({
      "stevearc/aerial.nvim",
      config = function()
        require("aerial").setup({
          layout = {
            highlight_on_hover = true,
            placement_editor_edge = true,
            min_width = 25,
          },
          show_guides = true,
        })
      end,
    })
    use ({
      "levouh/tint.nvim",
      config = function()
        require("tint").setup({
          tint = -20,
          highlight_ignore_patterns = { "WinSeparator", "Status.*" },
          -- window_ignore_function = function(winid)
          --   local buf = vim.api.nvim_win_get_buf(winid)
          --   local ft = vim.api.nvim_buf_get_option(buf, "filetype")
          --
          --   if ft == "neo-tree" then
          --     return true
          --   end
          --
          --   return false
          -- end,
        })
      end,
    })
    use({
      "chentoast/marks.nvim",
      config = function()
        require("marks").setup({
          default_mappings = true,
        })
      end,
    })
    use({
      "NvChad/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
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
  use({ "antoinemadec/FixCursorHold.nvim" })
  end,
})
