local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").pylsp.setup({
    settings = {
      pylsp = {
        plugins = {
          flake8 = { enabled = false },
          pycodestyle = { enabled = false },
          pylsp_mypy = { enabled = true },
          rope = { enabled = true },
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
