local M = {}

M.setup = function(capabilities)
  require("lspconfig").bashls.setup({
    cmd = { "bash-language-server", "start" },
    capabilities = capabilities,
  })
end

return M
