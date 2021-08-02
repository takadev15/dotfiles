local cmd = vim.cmd
local map = function(type, key, value)
	vim.api.nvim_set_keymap(type,key,value,{noremap = true, silent = true});
end


-- ###################################
-- #####      Default keymap     #####
-- ###################################

-- Move window
cmd[[map sh <C-w>h]]
cmd[[map sk <C-w>k]]
cmd[[map sj <C-w>j]]
cmd[[map sl <C-w>l]]

-- switch buffer
map('n','<leader>t',[[<cmd>enew<CR>]])
map('n','<S-Tab>',[[<cmd>BufferLineCyclePrev<CR>]])
map('n','<Tab>',[[<cmd>BufferLineCycleNext<CR>]])
map('n','<leader>q',[[<cmd>bd<CR>]])

-- resizing vim windows
map('n','<A-k>',[[<cmd>resize +2<CR>]])
map('n','<A-j>',[[<cmd>resize -2<CR>]])
map('n','<A-h>',[[<cmd>vertical resize +2<CR>]])
map('n','<A-l>',[[<cmd>vertical resize -2<CR>]])

map ('i','<A-l>',[[<esc>la]])
map ('i','<A-h>',[[<esc>li]])



-- ###################################
-- #####      Plugins keymap     #####
-- ###################################


-- vista
map ('n','<F1>',[[<cmd>Vista!!<CR>]])

-- Version control
map('n','<leader>gs','<cmd>lua require("neogit").status.create("split")<CR>')
-- map('n', '<leader>gs', [[G<CR>]])

-- " telescope.nvim`
map ('n','<leader>lf',[[<cmd>lua require('telescope.builtin').find_files({})<CR>]])
map('n','<leader>lg',[[<cmd>lua require('telescope.builtin').live_grep({})<CR>]])
map ('n','<leader>lb',[[<cmd>lua require('telescope.builtin').buffers({})<CR>]])
map ('n','<leader>fh',[[<cmd>lua require('telescope.builtin').help_tags({})<CR>]])
map('n','<leader>lgf',[[<cmd>lua require'telescope.builtin'.git_files({})<CR>]])
map('n','<leader>lgc',[[<cmd>lua require'telescope.builtin'.git_commits({})<CR>]])



