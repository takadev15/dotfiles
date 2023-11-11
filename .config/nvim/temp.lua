
local buf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_option(buf, 'undolevels', -1)
vim.api.nvim_buf_set_lines(buf, 0, 1, false, { })
