local utils = require("modules.lsp.utils")
pcall(vim.cmd, [[packadd cmp-nvim-lsp]])

-- Override handlers
utils.override_handler()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local server_list = {
  "clangd",
  "dockerls",
  "flutter",
  "gopls",
  "rust_analyzer",
  "sumneko",
  "texlab",
  -- "jees",
  "vts",
  -- "tailwind",
  "bash",
  "pylance",
}

for _, server in ipairs(server_list) do
  require("modules.lsp.servers." .. server).setup(utils.on_attach, capabilities)
end

