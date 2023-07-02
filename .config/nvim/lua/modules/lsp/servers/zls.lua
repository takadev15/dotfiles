local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").zls.setup({
    capabilities = capabilities,
  })
end

return M
