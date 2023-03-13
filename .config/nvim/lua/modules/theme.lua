local cmd = vim.api.nvim_command
local highlight = vim.api.nvim_set_hl
local catppuccin = require("catppuccin")

-- Colorscheme
vim.g.catppuccin_flavour = "mocha"
catppuccin.setup({
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		functions = { "italic" },
	},
  color_overrides = {
    mocha = {
      base = "#11111b",
      mantle = "#11111b", 
      crust = "#11111b",
    }
  },
  integrations = {
  	navic = true
  },
})
cmd("colorscheme catppuccin")

local hl = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

hl("Normal", { bg = nil })
hl("CursorLineNr", { fg = "White", bg = nil })
hl("LineNr", { fg = "#45475a" })


hl("WinSeparator", { fg = "#1B1E2B", bg = nil, bold = true })

hl("DiffAdd", { fg = nil, bg = "#23384C" })
hl("DiffChange", { fg = nil, bg = "#232C4C" })
hl("DiffDelete", { fg = nil, bg = "#341C28" })
hl("DiffText", { bg = "#33406B", bold = true })
hl("diffAdded", { fg = "#40a02b", bg = "#0F111A" })
hl("diffRemoved", { fg = "#e64553", bg = "#0F111A" })
-- hl("diffChanged", { fg = nil, bg = "#281F0B" })
-- hl("DiffText", { bg = "#3C2E10", bold = true })

-- nvim-navic
hl("NavicText", { fg = "#cdd6f4" })

hl("LspSignatureActiveParameter", { bg = nil, fg = "white", bold = true, italic = true })

-- fidget.nvim
hl("FidgetTitle", { fg = "#04a5e5", bg = "NONE" })
hl("FidgetTask", { fg = "#cdd6f4" , bg = "NONE" })

-- disable vertical split
cmd("autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE")

require("indent_blankline").setup({
  filetype_exclude = { "help", "terminal", "alpha", "lazy", "norg", "neo-tree", "git-messenger" },
  buftype_exclude = { "terminal", " " },
})

vim.g.markdown_folding_disabled = 1
vim.g.markdown_conceal = 1
