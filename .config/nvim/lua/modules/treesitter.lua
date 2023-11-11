require("nvim-treesitter.configs").setup({
  context_commentstring = { enable = true },
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "comment" },
  highlight = {
    enable = true, -- false will disable the whole extension
    use_languagetree = true,
    disable = function(_, buf)
      local max_filesize = 4000 * 1024 -- 4 MB
      local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  indent = {
    enable = true,
  },
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
  -- rainbow = {
  --   enable = true,
  --   disable = { 'jsx', 'cpp' },
  --   query = 'rainbow-parens',
  --   -- strategy = require('ts-rainbow').strategy.global,
  -- },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["is"] = "@statement.inner",
        ["as"] = "@statement.outer",
      },
    },
    move = { enable = false },
  },
})
