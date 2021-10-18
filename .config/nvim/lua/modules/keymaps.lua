local cmd = vim.cmd

local map = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

-- ###################################
-- #####      Default keymap     #####
-- ###################################

-- Move window
cmd([[map sh <C-w>h]])
cmd([[map sk <C-w>k]])
cmd([[map sj <C-w>j]])
cmd([[map sl <C-w>l]])

-- Bufferline
map("n", "<leader>t", [[<cmd>enew<CR>]])
map("n", "<S-Tab>", [[<cmd>BufferLineCyclePrev<CR>]])
map("n", "<Tab>", [[<cmd>BufferLineCycleNext<CR>]])
map("n", "<leader>q", "<cmd>bdelete! %<CR>")

-- resizing vim windows
map("n", "<A-k>", [[<cmd>resize +2<CR>]])
map("n", "<A-j>", [[<cmd>resize -2<CR>]])
map("n", "<A-h>", [[<cmd>vertical resize +2<CR>]])
map("n", "<A-l>", [[<cmd>vertical resize -2<CR>]])

map("i", "<A-l>", [[<esc>la]])
map("i", "<A-h>", [[<esc>li]])

-- ###################################
-- #####      Plugins keymap     #####
-- ###################################

-- Version control
map("n", "<leader>g", '<cmd>lua require("neogit").status.create("split")<CR>')
map("n", "<leader>gs", [[G<CR>]])

-- Telescope
map("n", "<leader>lf", "<cmd>Telescope find_files<CR>")
map("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>lb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>lo", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>lH", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>la", "<cmd>Telescope media_files<CR>")
map("n", "<leader>lr", "<cmd>lua require('telescope').extensions.asynctasks.all{}<CR>")

vim.cmd("nmap <leader>rr <Plug>RestNvim")
vim.cmd("nmap <leader>rp <Plug>RestNvimPreview")
