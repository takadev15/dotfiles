local M = {}

M.setup = function (on_attach, capabilities)
  require("lspconfig").tailwindcss.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      tailwindCSS = {
        lint = {
          cssConflict = "warning",
        },
      },
    },
  }
end

return M
