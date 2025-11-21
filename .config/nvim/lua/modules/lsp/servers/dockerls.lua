local lsp = vim.lsp
local M = {}

M.setup = function(capabilities)
  lsp.config('dockerls', {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 250,
    },
  })
end

return M
