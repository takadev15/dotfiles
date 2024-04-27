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
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>lq", telescope.diagnostics)

-- ###################################
-- #####      Plugins keymap     #####
-- ###################################

-- File tree
map("n", "<leader>fd", ":Neotree toggle<CR>")

-- Tasks runner
map("n", "<leader>lr", ":OverseerRun<CR>")
map("n", "<leader>st", ":OverseerToggle!<CR>")


-- Telescope
map("n", "<leader>lf", telescope.find_files)
map("n", "<leader>lg", telescope.live_grep)
map("n", "<leader>lb", telescope.buffers)
map("n", "<leader>lo", telescope.oldfiles)
map("n", "<leader>lH", telescope.help_tags)
-- map("n", "<leader>la", ":Telescope media_files<CR>")
-- map("n", "<leader>lw", "<cmd>lua require('telescope').extensions.arecibo.websearch()<CR>")

-- Terminal
map("t", "<esc>", "<C-\\><C-n>")

-- Move.nvim
map("v", "<A-j>", ":MoveBlock(1)<CR>")
map("v", "<A-k>", ":MoveBlock(-1)<CR>")

-- Rest-Nvim
map("n", "<leader>rr", "<cmd>Rest run<cr>")
map("n", "<leader>rl", "<cmd>Rest run last<cr>")

-- Neogen
map("n", "<leader>dg", require("neogen").generate)

map("n", "<leader>cl", ":TexlabBuild<CR>")

-- neotest
map("n", "ta", function()
  require("neotest").run.attach()
end)
map("n", "tn", function()
  require("neotest").run.run()
end)
map("n", "tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end)
map("n", "tl", function()
  require("neotest").run.run_last()
end)
map("n", "td", function()
  require("neotest").run.run({ strategy = "dap" })
end)
map("n", "to", function()
  require("neotest").output.open({ enter = true })
end)
map("n", "ts", function()
  require("neotest").run.stop()
end)
map("n", "tt", function()
  require("neotest").summary.toggle()
end)

-- Package Info
map("n", "<leader>ns", "<cmd>lua require('package-info').show({ force = true })<CR>")
