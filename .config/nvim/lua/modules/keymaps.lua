local cmd = vim.api.nvim_command
local telescope = require("telescope.builtin")

local map = function(mode, l, r, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, l, r, opts)
end

-- ###################################
-- #####      Default keymap     #####
-- ###################################

-- Move window
map("", "sh", "<C-w>h")
map("", "sk", "<C-w>k")
map("", "sj", "<C-w>j")
map("", "sl", "<C-w>l")

-- Tab
map("n", "<leader>t", ":tabnew<CR>")
map("n", "<Tab>", ":tabn<CR>")
map("n", "<S-Tab>", ":tabp<CR>")
map("n", "<leader>q", ":tabclose<CR>")

-- resizing vim windows
map("n", "<A-k>", [[<cmd>resize +2<CR>]])
map("n", "<A-j>", [[<cmd>resize -2<CR>]])
map("n", "<A-h>", [[<cmd>vertical resize +2<CR>]])
map("n", "<A-l>", [[<cmd>vertical resize -2<CR>]])

map("i", "<A-l>", [[<esc>la]])
map("i", "<A-h>", [[<esc>li]])

-- diagnostic
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_prev)
map("n", "<leader>lq", require("telescope.builtin").diagnostics)

-- ###################################
-- #####      Plugins keymap     #####
-- ###################################

-- aerial
map("n", "<leader>ss", ":AerialToggle<CR>")

-- Telescope
map("n", "<leader>lf", telescope.find_files)
map("n", "<leader>lg", telescope.live_grep)
map("n", "<leader>lb", telescope.buffers)
map("n", "<leader>lo", telescope.oldfiles)
map("n", "<leader>lH", telescope.help_tags)
map("n", "<leader>la", ":Telescope media_files<CR>")
map("n", "<leader>lr", "<cmd>lua require('telescope').extensions.asynctasks.all{}<CR>")
map("n", "<leader>lw", "<cmd>lua require('telescope').extensions.arecibo.websearch()<CR>")

map("n", "<leader>fd", ":NeoTreeShowToggle<CR>")

-- Move.nvim
map("v", "<A-j>", ":MoveBlock(1)<CR>")
map("v", "<A-k>", ":MoveBlock(-1)<CR>")

-- Rest-Nvim
cmd("nmap <leader>rr <Plug>RestNvim")
cmd("nmap <leader>rp <Plug>RestNvimPreview")

-- Neogen
map("n", "<leader>dg", require("neogen").generate)

-- Package Info
map("n", "<leader>ns", "<cmd>lua require('package-info').show({ force = true })<CR>")
