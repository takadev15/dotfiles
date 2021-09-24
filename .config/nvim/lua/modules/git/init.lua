local vim = vim
local neogit = require('neogit')

local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end


-- Fugitives!!
gmap("n", "<leader>gs", "<cmd>:Git<CR>")
gmap("n", "<leader>gl", "<cmd>:Git log<CR>")
gmap("n", "<leader>gch", "<cmd>:diffget //2<CR>")
gmap("n", "<leader>gcl", "<cmd>:diffget //3<CR>")

-- Neogit
neogit.setup{
  integrations = {
    diffview = true,
  },
}
