local lsp = vim.lsp
local M = {}

M.setup = function(capabilities)
  lsp.config('zls', {
    capabilities = capabilities,
  })

  lsp.enable('zls')
end

return M
