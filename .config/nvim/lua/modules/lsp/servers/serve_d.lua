local M = {}

M.setup = function (capabilities)
  require'lspconfig'.serve_d.setup({
    cmd = {"/home/takadev/repo/serve-d/serve-d"},
  })
end

return M
