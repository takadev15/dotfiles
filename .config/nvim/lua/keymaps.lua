local cmd = vim.cmd
local map = function(type, key, value)
	vim.api.nvim_set_keymap(type,key,value,{noremap = true, silent = true});
end


-- ####### Default keymaps ########

-- Move window
cmd[[map sh <C-w>h]]
cmd[[map sk <C-w>k]]
cmd[[map sj <C-w>j]]
cmd[[map sl <C-w>l]]

-- switch buffer
map('n','<leader>t', [[<cmd>enew<CR>]])
mao('n','<S-Tab>', [[<cmd>BufferLineCyclePrev<CR>]])
map('n','<Tab>', [[<cmd>BufferLineCycleNext<CR>]])
map('n','<leader>q', [[<cmd>bd<CR>]]) 

-- resizing vim windows
map('n','<A-k>',[[<cmd>resize +2<CR>]])
map('n','<A-j>',[[<cmd>resize -2<CR>]])
map('n','<A-h>',[[<cmd>vertical resize +2<CR>]])
map('n','<A-l>',[[<cmd>vertical resize -2<CR>]])

map ('i', '<A-l>', [[<esc>la]])
map ('i', '<A-h>', [[<esc>li]])



-- ######## Plugins Keymap #########

-- Nvim-tree.lua
map ('n','<leader>,fd',[[<cmd> NvimTreeToggle<CR>]])

-- vista
map ('n','<F1>',[[<cmd>Vista!!<CR>]])

-- Version control
map('n','<leader>gs','<cmd>lua require("neogit").status.create("split")<CR>')
-- map('n', '<leader>gs', [[G<CR>]])

-- " telescope.nvim`
map ('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({})<cr>]])
map('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').live_grep({})<cr>]])
map ('n','<leader>fb' ,[[<cmd>lua require('telescope.builtin').buffers({})<cr>]])
map ('n', '<leader>fh' ,[[<cmd>lua require('telescope.builtin').help_tags({})<cr>]])
map('n','<leader>lgf',[[<cmd>lua require'telescope.builtin'.git_files({})<CR>]])
map('n','<leader>lgc',[[<cmd>lua require'telescope.builtin'.git_commits({})<CR>]])


