local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").clangd.setup({
    init_options = {
      clangdFileStatus = true,
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
