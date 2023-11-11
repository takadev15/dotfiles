local M = {}

M.setup = function (capabilities)
  require'lspconfig'.serve_d.setup({
    cmd = {"/home/takadevs/Repo/serve-d/serve-d"},
  })
end

return M
