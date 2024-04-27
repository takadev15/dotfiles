local M = {}

M.setup = function (capabilities)
  require'lspconfig'.robotframework_ls.setup({
    capabilities = capabilities
  })
end

return M
