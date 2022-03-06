local M = {}

M.setup = function(on_attach, capabilities)
  require("clangd_extensions").setup({
    server = {
    init_options = {
      clangdFileStatus = true,
    },
    on_attach = on_attach,
    capabilities = capabilities,
    },
  })
end

return M
