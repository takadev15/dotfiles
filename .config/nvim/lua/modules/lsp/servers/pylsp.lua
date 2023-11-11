local M = {}

M.setup = function(capabilities)
  require("lspconfig").pylsp.setup {
    capabilities = capabilities,
    settings = {
      pylsp = {
        plugins = {
          ruff = {
            enabled = true,
            extendSelect = { "I" },
          },
          mypy = {
            enabled = true,
            dmypy = true,
            report_progress = true,
          },
        },
      },
    },
  }
end

return M
