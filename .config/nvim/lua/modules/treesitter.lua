require("nvim-treesitter.configs").setup({
  context_commentstring = { enable = true },
  ignore_install = { "comment" },
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = function(_, buf)
      fName = vim.api.nvim_buf_get_name(buf)
      -- Check filetype
      if vim.filetype.match { filename = fName } == "csv" then
        return true
      end

      -- Check size
      local max_filesize = 4000 * 1024 -- 4 MB
      local ok, stats = pcall(vim.uv.fs_stat, fName)
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  indent = {
    enable = true,
  },
  matchup = {
    enable = true,
    disable_virtual_text = true,
    include_match_words = true,
    enable_quotes = true,
  },
  refactor = {
    highlight_definitions = { enable = false },
  },
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
