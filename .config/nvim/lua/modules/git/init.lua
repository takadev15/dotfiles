local vim = vim

local map = function(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

vim.g.gitblame_display_virtual_text = 0
vim.g.gitblame_message_template = "<author> • <summary>"

vim.g.git_messenger_include_diff = "current"
vim.g.git_messenger_close_on_cursor_moved = false
vim.g.git_messenger_always_into_popup = true
vim.g.git_messenger_max_popup_height = 20
vim.g.git_messenger_max_popup_width = 50
vim.g.git_messenger_floating_win_opts = { border = "single" }

vim.g.flog_default_arguments = { max_count = 4000 }

-- Fugitives!!
map("n", "<leader>gs", "<cmd>:Git<CR>")
map("n", "<leader>gl", "<cmd>:Git log<CR>")
map("n", "<leader>gd", "<cmd>tabnew | Gvdiffsplit!<CR>")
map("n", "<leader>gch", "<cmd>:diffget //2<CR>")
map("n", "<leader>gcl", "<cmd>:diffget //3<CR>")
map("n", "<leader>gC", require("telescope.builtin").git_commits)
map("n", "<leader>gb", require("telescope.builtin").git_branches)

