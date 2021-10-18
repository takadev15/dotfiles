local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

vim.g.asyncrun_open = 6
vim.g.asyncrun_rootmarks = { ".git", ".root", "Cargo.toml", "package.json", "pubspec.yaml" }
vim.g.asynctasks_term_rows = 6
vim.g.asynctasks_term_focus = 0
vim.g.asynctasks_template = "~/.config/nvim/task_template.ini"

gmap("n", "<leader>jr", "<cmd>AsyncTask project-run<CR>")
gmap("n", "<leader>jb", "<cmd>AsyncTask project-build<CR>")
