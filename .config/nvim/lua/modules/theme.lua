local hl = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

-- Colorscheme
require("catppuccin").setup({
  flavour = "mocha",
  styles = {
    functions = { "italic" },
  },
  color_overrides = {
    mocha = {
      base = "#11111b",
      mantle = "#11111b",
      crust = "#11111b",
    },
  },
  integrations = {
    navic = true,
  },
})
vim.cmd.colorscheme("catppuccin")

-- Custom Highlight Group
hl("Normal", { bg = nil })
hl("NormalNC", { link = "Normal" })
hl("NormalFloat", { bg = "#313244" })
hl("FloatBorder", { bg = "#313244", fg = "#313244" })
hl("FloatTitle", { bg = nil })
hl("LineNr", { fg = "#45475a" })
hl("CursorLine", { bg = "#313244", bold = true })
hl("CursorLineNr", { fg = "White", bg = nil })
hl("WinSeparator", { fg = "#313244", bg = nil, bold = true })

hl("GitSignsAdd", { fg = "#a6e3a1" })
hl("GitSignsChange", { fg = "#f9e2af", link = "DiffChange" })
hl("GitSignsDelete", { fg = "#e64553" })
hl("DiffAdd", { fg = nil, bg = "#23384C" })
hl("DiffChange", { fg = nil, bg = "#232C4C" })
hl("DiffDelete", { fg = nil, bg = "#341C28" })
hl("DiffText", { bg = "#33406B", bold = true })
hl("diffAdded", { fg = "#40a02b" })
hl("diffRemoved", { fg = "#d20f39" })
hl("diffChanged", { fg = "#df8e1d" })
hl("DiffText", { bg = "#3C2E10", bold = true })

-- Lazy nvim
hl("LazyNormal", { bg = "#181825" })

-- Telescope Theme
hl("TelescopeNormal", { bg = "#181825" })
hl("TelescopePreviewNormal", { bg = "#181825" })
hl("TelescopeResultsNormal", { bg = "#181825" })
hl("TelescopeBorder", { bg = "#181825" })
hl("TelescopePreviewBorder", { fg = "#181825", bg = "#181825" })
hl("TelescopePromptBorder", { fg = "#313244", bg = "#313244" })
hl("TelescopeResultsBorder", { fg = "#181825", bg = "#181825" })
hl("TelescopeTitle", { fg = "#181825", bg = "#89b4fa" })
hl("TelescopePreviewTitle", { fg = "#181825", bg = "#89b4fa" })
hl("TelescopePromptNormal", { bg = "#313244" })
hl("TelescopePromptTitle", { fg = "#181825", bg = "#89b4fa" })
hl("TelescopePromptCounter", { fg = "#89b4fa", bg = "#313244" })
hl("TelescopePromptPrefix", { fg = "#89b4fa", bg = "#313244" })

-- Neotree
hl("NeoTreeFloatBorder", { fg = "White", bg = "#181825" })
hl("NeoTreeFloatTitle", { fg = "White", bg = "#181825" })
-- hl("NeoTreeNormal", {bg = "#181825"})

-- git-messenger
hl("gitMessengerPopupNormal", { link = "NormalFloat" })

-- nvim-navic
hl("NavicText", { fg = "#cdd6f4" })

-- Lsp color
hl("LspSignatureActiveParameter", { bg = nil, fg = "white", bold = true, italic = true })

-- fidget.nvim
hl("FidgetTitle", { fg = "#04a5e5", bg = "NONE" })
hl("FidgetTask", { fg = "#cdd6f4", bg = "NONE" })

-- nvim-notify
hl("NotifyERRORBody", { bg = "#181825" })
hl("NotifyERRORBorder", { bg = "#181825", fg = "#e64553" })
hl("NotifyWARNBody", { bg = "#181825" })
hl("NotifyWARNBorder", { bg = "#181825", fg = "#f9e2af" })
hl("NotifyINFOBody", { bg = "#181825" })
hl("NotifyINFOBorder", { bg = "#181825", fg = "#89dceb" })
hl("NotifyDEBUGBody", { bg = "#181825" })
hl("NotifyDEBUGBorder", { bg = "#181825", fg = "#eba0ac" })
hl("NotifyTRACEBody", { bg = "#181825" })
hl("NotifyTRACEBorder", { bg = "#181825", fg = "#a6e3a1" })

-- noice
hl("NoiceMini", { bg = nil })
hl("NoiceLspProgressTitle", { bg = nil, fg = "#cdd6f4" })
hl("NotificationInfo", { fg = "#89dceb", bg = nil })
hl("NotificationError", { fg = "#e64553", bg = nil })
hl("NotificationWarning", { fg = "#f9e2af", bg = nil })

-- disable vertical split
-- cmd("autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE")

require("ibl").setup({
  exclude = {
    filetypes = { "help", "terminal", "dashboard", "lazy", "norg", "neo-tree", "git-messenger" },
  },
  indent = {
    tab_char = { "▎", "▎", "▎" },
  },
})

vim.g.markdown_folding_disabled = 1
vim.g.markdown_conceal = 1
