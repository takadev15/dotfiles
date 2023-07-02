local utils = require("modules.lsp.utils")

-- Override handlers
utils.override_handler()
utils.setup_attach_autocmd()

for _, server in ipairs(utils.servers) do
  require("modules.lsp.servers." .. server).setup(utils.capabilities)
end

-- Java only
vim.api.nvim_create_user_command("JavaStart", require("modules.lsp.servers.jdtls").setup, {})
