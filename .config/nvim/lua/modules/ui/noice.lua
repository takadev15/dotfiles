require("noice").setup({
  messages = { enabled = false },
  popupmenu = { enabled = true },
  notify = { 
    enabled = true,
    view = "notify",
    replace = true,
  },
  cmdline = { 
    enabled = true, 
    view = "cmdline",
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
    }
  },
  lsp = {
    hover = {
      opts = {
        size = { max_height = 19, max_width = 60 },
      },
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    progress = {
      enabled = true,
      format = {
        { "{spinner} ", hl_group = "NoiceLspProgressTitle" },
        { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
        { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
      },
      opts = {
        size = {
          height = 4,
        },
        win_options = {
          winblend = 100,
          winhighlight = {
            Normal = "Normal",
          },
        },
      },
    },
    signature = { enabled = false },
  },
})
