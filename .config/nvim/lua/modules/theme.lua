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
  contrast_windows = {
    "packer",
  },
})
cmd("colorscheme material")

local hl = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

hl("Normal", { bg = nil })
hl("CursorLineNr", { fg = "White", bg = nil })
hl("LineNr", { fg = "#3F3F3F" })

hl("WinSeparator", { fg = "#1B1E2B", bg = nil, bold = true })

hl("DiffAdd", { fg = nil, bg = nil })
hl("DiffChange", { fg = nil, bg = nil})
hl("DiffDelete", { fg = nil, bg = nil})
hl("diffAdded", { fg = "#C3E88D", bg = "#0F111A" })
hl("diffRemoved", { fg = "#F07178", bg = "#0F111A" })
-- hl("diffChanged", { fg = nil, bg = "#281F0B" })
-- hl("DiffText", { bg = "#3C2E10", bold = true })

hl("Pmenu", { bg = "#0F111A" })
hl("PmenuSel", { fg = nil, bg = "#1B1E2B" })
hl("CmpItemAbbrMatch", { fg = "#A0B9D8" })
hl("CmpItemAbbrMatchFuzzy", { fg = "#CF8164" })
hl("CmpItemAbbr", { fg = "#777777" })
hl("CmpItemKindText", { italic = true, bg = nil, fg = "#FFFFFF" })
hl("CmpItemKindMethod", { italic = true, bg = nil, fg = "#3A75C4" })
hl("CmpItemKindFunction", { italic = true, bg = nil, fg = "#FAB863" })
hl("CmpItemKindConstructor", { italic = true, bg = nil, fg = "#FF4151" })
hl("CmpItemKindField", { italic = true, bg = nil, fg = "#3A75C4" })
hl("CmpItemKindVariable", { italic = true, bg = nil, fg = "#62B3B2" })
hl("CmpItemKindClass", { italic = true, bg = nil, fg = "#7DC030" })
hl("CmpItemKindInterface", { italic = true, bg = nil, fg = "#F99157" })
hl("CmpItemKindModule", { italic = true, bg = nil, fg = "#F99157" })
hl("CmpItemKindProperty", { italic = true, bg = nil, fg = "#3A75C4" })
hl("CmpItemKindUnit", { italic = true, bg = nil, fg = "#3A75C4" })
hl("CmpItemKindValue", { italic = true, bg = nil, fg = "#C3D2DF" })
hl("CmpItemKindEnum", { italic = true, bg = nil, fg = "#F99157" })
hl("CmpItemKindKeyword", { italic = true, bg = nil, fg = "#99C794" })
hl("CmpItemKindSnippet", { italic = true, bg = nil, fg = "#F2F27A" })
hl("CmpItemKindColor", { italic = true, bg = nil, fg = "#C3D2DF" })
hl("CmpItemKindFile", { italic = true, bg = nil, fg = "#C584C5" })
hl("CmpItemKindReference", { italic = true, bg = nil, fg = "#87D3F8" })
hl("CmpItemKindFolder", { italic = true, bg = nil, fg = "#C574C5" })
hl("CmpItemKindEnumMember", { italic = true, bg = nil, fg = "#6699CC" })
hl("CmpItemKindConstant", { italic = true, bg = nil, fg = "#C3D2DF" })
hl("CmpItemKindStruct", { italic = true, bg = nil, fg = "#FF4151" })
hl("CmpItemKindEvent", { italic = true, bg = nil, fg = "#87D3F8" })
hl("CmpItemKindOperator", { italic = true, bg = nil, fg = "#65737E" })
hl("CmpItemKindTypeParameter", { italic = true, bg = nil, fg = "#6699CC" })

-- nvim-navic
hl("NavicText", { fg = "#1B1E2B" })
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

-- fidget.nvim
hl("FidgetTitle", { fg = "#3A75C4", bg = "#0F111A" })
hl("FidgetTask", { fg = "white" , bg = "#0F111A" })

-- cmd("autocmd ColorScheme * highlight NonText guibg=NONE")
-- cmd("autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE")
-- cmd("autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE")

-- disable vertical split
cmd("autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE")

require("indent_blankline").setup({
  filetype_exclude = { "help", "terminal", "alpha", "packer", "norg", "neo-tree" },
  buftype_exclude = { "terminal", " " },
})

vim.g.markdown_folding_disabled = 1
vim.g.markdown_conceal = 1
