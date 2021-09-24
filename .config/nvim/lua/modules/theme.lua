local cmd = vim.api.nvim_command
local material = require("material")


vim.g.material_style = 'deep ocean'
-- Colorscheme
material.setup({
  italics = {
    functions = true,
    comments = true,
  },
	contrast_windows = { -- Specify which windows get the contrasted (darker) background
		"packer", -- Darker packer background
	},
})
vim.cmd[[colorscheme material]]

cmd('autocmd ColorScheme * highlight Normal guibg=NONE') -- Make background transparent
cmd('autocmd ColorScheme * highlight NonText guibg=NONE')
cmd('autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE')
cmd('autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE')
cmd('autocmd ColorScheme * highlight Pmenu ctermbg=NONE guibg=#292927')

cmd("highlight DiffAdded guifg=#C3E88D guibg=#0F111A")
cmd("highlight DiffRemoved guifg=#F07178 guibg=#0F111A")

-- Line number color
cmd('autocmd ColorScheme * highlight CursorLineNr guibg=NONE guifg=White')
cmd('autocmd ColorScheme * highlight LineNr guifg=#3F3F3F')

-- disable vertical split
cmd('autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE')

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

-- Indentation
vim.opt.listchars = {
}

require("indent_blankline").setup {
    show_end_of_line = true,
    filetype_exclude = { "help", "terminal", "dashboard", "packer", "neorg", },
    buftype_exclude = {"terminal", " "}
}

-- these are all the default values
require'neuron'.setup {
    virtual_titles = true,
    mappings = true,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
}

