local cmd = vim.api.nvim_command
local highlight = vim.api.nvim_set_hl
local material = require("material")

-- Colorscheme
vim.g.material_style = "deep ocean"
material.setup({
  italics = {
    functions = true,
    comments = true,
  },
  contrast_windows = { -- Specify which windows get the contrasted (darker) background
    "packer", -- Darker packer background
  },
})

local hl = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

cmd("colorscheme material")
cmd("autocmd ColorScheme * highlight Normal guibg=NONE")
cmd("autocmd ColorScheme * highlight NonText guibg=NONE")
-- highlight(0, "Normal", {bg = "NONE"})
-- highlight(0, "NonText", {bg = "NONE"})
cmd("autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE")
cmd("autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE")
cmd("autocmd ColorScheme * highlight Pmenu ctermbg=NONE guibg=#292927")

cmd("highlight DiffAdded guifg=#C3E88D guibg=#0F111A")
cmd("highlight DiffRemoved guifg=#F07178 guibg=#0F111A")

cmd("highlight DiffAdd gui=NONE guibg=NONE")
cmd("highlight DiffChange gui=NONE guibg=NONE")
cmd("highlight DiffChangeDelete gui=NONE guibg=NONE")
cmd("highlight DiffDelete gui=NONE guibg=NONE")

-- Line number color
cmd("autocmd ColorScheme * highlight CursorLineNr guibg=NONE guifg=White")
cmd("autocmd ColorScheme * highlight LineNr guifg=#3F3F3F")

-- disable vertical split
cmd("autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE")

-- nvim-navic
hl("NavicText", { fg = "#AAAAAA" })
hl("NavicIconsNamespace", { link = "CmpItemKindNamespace" })
hl("NavicIconsType", { link = "CmpItemKindType" })
hl("NavicIconsClass", { link = "CmpItemKindClass" })
hl("NavicIconsEnum", { link = "CmpItemKindEnum" })
hl("NavicIconsInterface", { link = "CmpItemKindInterface" })
hl("NavicIconsStruct", { link = "Structure" })
hl("NavicIconsTypeParameter", { link = "CmpItemKindParameter" })
hl("NavicIconsParameter", { link = "CmpItemKindParameter" })
hl("NavicIconsVariable", { link = "CmpItemKindVariable" })
hl("NavicIconsProperty", { link = "CmpItemKindProperty" })
hl("NavicIconsEnumMember", { link = "Constant" })
hl("NavicIconsEvent", { link = "Keyword" })
hl("NavicIconsFunction", { link = "CmpItemKindFunction" })
hl("NavicIconsMethod", { link = "CmpItemKindMethod" })
hl("NavicIconsMacro", { link = "CmpItemKindFuncMacro" })
hl("NavicIconsKeyword", { link = "CmpItemKindKeyword" })
hl("NavicIconsModifier", { link = "StorageClass" })
hl("NavicIconsComment", { link = "CmpItemKindComment" })
hl("NavicIconsString", { link = "CmpItemKindString" })
hl("NavicIconsNumber", { link = "CmpItemKindNumber" })
hl("NavicIconsRegexp", { link = "CmpItemKindStringRegex" })
hl("NavicIconsOperator", { link = "CmpItemKindOperator" })

local opts = {
  -- whether to highlight the currently hovered symbol
  -- disable if your cpu usage is higher than you want it
  -- or you just hate the highlight
  -- default: true
  highlight_hovered_item = true,

  -- whether to show outline guides
  -- default: true
  show_guides = true,
}

require("indent_blankline").setup({
  filetype_exclude = { "help", "terminal", "alpha", "packer", "norg", "neo-tree" },
  buftype_exclude = { "terminal", " " },
})

vim.g.markdown_folding_disabled = 1
vim.g.markdown_conceal = 1
