-- #############################################
-- ########## load all the plugins #############
-- #############################################

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- stdlib
  { "nvim-lua/plenary.nvim", lazy = false },
  { "nvim-neotest/nvim-nio", lazy = false },
  {
    "vhyrro/luarocks.nvim",
    config = function()
      require("luarocks-nvim").setup({})
    end,
  },

  -- lsp settings
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("modules.lsp")
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        floating_window = false,
        -- hint_prefix = "ﰠ ",
        always_trigger = true,
      })
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    config = function()
      require("nvim-lightbulb").setup({
        sign = { enabled = false },
        virtual_text = { enabled = true },
      })
    end,
  },
  {
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
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("modules.dressing")
    end,
  },
  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    opts = {
      refresh_delay = 250,
      alpha = 0.45,
      blend_color = "#000000",
      hide = {
        underline = true,
        virtual_text = true,
        signs = true,
      },
      regex = {
        "[uU]nused",
        "[nN]ever [rR]ead",
        "[nN]ot [rR]ead",
      },
      priority = 128,
      disable = {},
    },
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach",
    config = function()
      local function text_format(symbol)
        local fragments = {}

        -- Indicator that shows if there are any other symbols in the same line
        local stacked_functions = symbol.stacked_count > 0 and (" | +%s"):format(symbol.stacked_count) or ""

        if symbol.references then
          local usage = symbol.references <= 1 and "usage" or "usages"
          local num = symbol.references == 0 and "no" or symbol.references
          table.insert(fragments, ("%s %s"):format(num, usage))
        end

        if symbol.definition then
          table.insert(fragments, symbol.definition .. " defs")
        end

        if symbol.implementation then
          table.insert(fragments, symbol.implementation .. " impls")
        end

        return table.concat(fragments, ", ") .. stacked_functions
      end

      require("symbol-usage").setup({
        text_format = text_format,
        definition = { enabled = true },
        implementation = { enabled = true },
      })
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("modules.completion")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
      },
      {
        "petertriho/cmp-git",
        config = true,
      },
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-buffer",
      "davidsierradz/cmp-conventionalcommits",
      "kdheepak/cmp-latex-symbols",
      "lukas-reineke/cmp-under-comparator",
      "windwp/nvim-autopairs",
      "rcarriga/cmp-dap",
    },
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = nil,
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("modules.treesitter")
    end,
  },
  {
    "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    init = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = { [""] = rainbow_delimiters.strategy["global"] },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
      }
    end,
  },
  { "nvim-treesitter/nvim-treesitter-refactor" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup()
    end,
  },
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_motion_enabled = 0
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    module = "ssr",
    config = function()
      require("ssr").setup({})
    end,
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("nvim-navic").setup({ highlight = true, separator = "  " })
    end,
  },
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup({ snippet_engine = "luasnip" })
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("modules.telescope")
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
  },
  {
    "crispgm/telescope-heading.nvim",
    ft = "markdown",
    config = function()
      require("telescope").load_extension("heading")
    end,
  },
  -- { "nvim-telescope/telescope-ui-select.nvim" },
  { "nvim-telescope/telescope-bibtex.nvim" },
  -- { "nvim-telescope/telescope-media-files.nvim" },

  -- User Interface
  { "MunifTanjim/nui.nvim" },
  { "catppuccin/nvim", lazy = false },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({
        override = {
          toml = {
            icon = " ",
            color = "#428850",
            cterm_color = "65",
          },
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.ui.noice")
    end,
  },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("modules.ui.dashboard")
    end,
  },
  {
    "rafcamlet/tabline-framework.nvim",
    config = function()
      require("modules.ui.tabline")
    end,
  },
  -- {
  --   "freddiehaddad/feline.nvim",
  --   lazy = false,
  --   branch = "main",
  --   config = function()
  --     require("modules.ui.feline").setup()
  --   end,
  -- },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.ui.lualine")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      {
        "s1n7ax/nvim-window-picker",
        config = function()
          require("window-picker").setup({
            current_win_hl_color = "#6699CC",
            other_win_hl_color = "#2F628E",
          })
        end,
      },
    },
    config = function()
      require("modules.ui.neotree")
    end,
  },

  -- Git
  { "tpope/vim-fugitive" },
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    config = function()
      require("neogit").setup()
    end,
  },
  { "rhysd/committia.vim" },
  { "ThePrimeagen/git-worktree.nvim" },
  { "rbong/vim-flog" },
  { "rhysd/git-messenger.vim" },
  {
    "f-person/git-blame.nvim",
    config = function()
      require("gitblame").setup({})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("modules.git.gitsigns")
    end,
  },

  -- { "rhysd/conflict-marker.vim" })
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup({
        default_mappings = false,
        disable_diagnostics = true,
      })
    end,
  },

  -- Debugger
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("modules.dap")
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
  { "mfussenegger/nvim-dap-python" },
  { "theHamsta/nvim-dap-virtual-text" },

  -- Testing and Running code
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-go",
      "rouge8/neotest-rust",
      "haydenmeade/neotest-jest",
      -- "marilari88/neotest-vitest",
    },
    config = function()
      require("modules.misc.neotest")
    end,
  },

  -- Languages specific Plugin
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "crispgm/nvim-go",
    ft = { "go", "gomod", "gowork", "gohtmltmpl" },
    build = ":GoInstallBinaries",
    opts = {
      auto_lint = false,
      auto_format = false,
      maintain_cursor_pos = true,
      lint_prompt_style = "vt",
    },
  },
  { "akinsho/flutter-tools.nvim" },

  { "p00f/clangd_extensions.nvim" },

  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {},

        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- you can also put keymaps in here
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {},
          },
        },
        -- DAP configuration
        dap = {},
      }
    end,
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("modules.lsp.servers.null-ls")
    end,
  },
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "vuki656/package-info.nvim",
    config = function()
      require("package-info").setup()
    end,
  },
  {
    "saecki/crates.nvim",
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
    end,
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "luarocks.nvim",
    },
    ft = "http",
    config = function()
      require("rest-nvim").setup()
    end,
  },
  { "frabjous/knap" },
  { "tpope/vim-dotenv" },

  -- Terminal things
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("modules.term")
    end,
  },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("modules.ui.todo-comments")
    end,
  },

  -- Miscellaneous
  { "yuttie/comfortable-motion.vim" },
  {
    "fedepujol/move.nvim",
    config = function()
      require("move").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({ highlights = { duration = 0 } })
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
  { "tpope/vim-dadbod", dependencies = { "kristijanhusak/vim-dadbod-ui" }, ft = "sql" },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "msql", "plsql" },
  },
  { "antonk52/gitignore-grabber.nvim" },
  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>ss", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

      require("outline").setup({})
    end,
  },
  {
    'IogaMaster/neocord',
    event = "VeryLazy",
    config = function()
      require("modules.misc.discordo")
    end,
  },
  {
    "levouh/tint.nvim",
    config = function()
      require("tint").setup({
        tint = -20,
        highlight_ignore_patterns = { "WinSeparator", "Status.*" },
        window_ignore_function = function(winid)
          local buf = vim.api.nvim_win_get_buf(winid)
          local ft = vim.api.nvim_buf_get_option(buf, "filetype")

          if ft == "neo-tree" then
            return true
          end

          return false
        end,
      })
    end,
  },
  {
    "paretje/nvim-man",
    cmd = { "Man", "VMan" },
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({
        default_mappings = true,
      })
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    config = function()
      require("octo").setup({
        default_remote = { "upsteam", "origin", "main" },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        stages = "slide",
      })
    end,
  },
  { "wakatime/vim-wakatime" },

  -- Experimental
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup({})
  --   end,
  -- },
})
