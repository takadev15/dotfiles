local dap = require("dap")
local ui = require("dapui")
local opts = { noremap = true, silent = true }

-- keymaps
local bmap = function (type, key, value)
  vim.api.nvim_buf_set_keymap(0, type, key, value, opts)
end
local gmap = function (type, key, value)
  vim.api.nvim_set_keymap(type, key, value, opts)
end

gmap("n", "<leader>dc", '<cmd>lua require("dap").continue()<CR>')
gmap("n", "<leader>dr", '<cmd>lua require("dap").repl.open()<CR>')
gmap("n", "<leader>db", '<cmd>lua require("dap").toggle_breakpoint()<CR>')
gmap("n", "<leader>dl", '<cmd>lua require("dap").step_into()<CR>')
gmap("n", "<leader>dh", '<cmd>lua require("dap").step_out()<CR>')
gmap("n", "<leader>do", '<cmd>lua require("dap").step_over()<CR>')
gmap("n", "<leader>di", '<cmd>lua require("dap.ui.variables").hover()<CR>')


-- Dap icons

