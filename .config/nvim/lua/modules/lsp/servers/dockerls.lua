local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").dockerls.setup({
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 250,
    },
  })
end

return M
