local vim = vim
local set = vim.g
local cmd = vim.cmd
local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

-- Fugitives!!
gmap("n", "<leader>gs", "<cmd>:Git<CR>")
gmap("n", "<leader>gl", "<cmd>:Git log<CR>")
gmap("n", "<leader>gch", "<cmd>:diffget //2<CR>")
gmap("n", "<leader>gcl", "<cmd>:diffget //3<CR>")

-- gitsigns
require("gitsigns").setup({
  signs = {
    add = { hl = "DiffAdd", text = "│" },
    change = { hl = "DiffChange", text = "│" },
    delete = { hl = "DiffDelete", text = "│" },
    topdelete = { hl = "DiffDelete", text = "│" },
    changedelete = { hl = "DiffChange", text = "│" },
  },
  keymaps = {
    noremap = true,
    buffer = true,
    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',

    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
  },
  watch_index = {
    interval = 1000,
  },
  sign_priority = 6,
  update_debounce = 250,
  status_formatter = nil,
  use_decoration_api = true,
  use_internal_diff = true,
})

-- Neogit
local neogit = require('neogit')
neogit.setup {}
