local lspconf = vim.lsp.config
local M = {}

M.setup = function(capabilities)
  lspconf('bashls', {
    cmd = { "bash-language-server", "start" },
    capabilities = capabilities,
  })
end

return M
