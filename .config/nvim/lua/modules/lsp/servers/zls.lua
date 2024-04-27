local M = {}

M.setup = function(capabilities)
  require("lspconfig").zls.setup({
    capabilities = capabilities,
  })
end

return M
