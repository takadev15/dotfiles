local M = {}

M.setup = function (capabilities)
  require'lspconfig'.vala_ls.setup({})
end

return M
