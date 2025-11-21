local lsp = vim.lsp
local M = {}

M.setup = function(capabilities)
  lsp.config('basedpyright', {
    capabilities = capabilities,
    settings = {
      basedpyright = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true
        }
      }
    }
  })

  lsp.enable('basedpyright')
end

return M
