local M = {}
local opts = { noremap = true, silent = true}

M.setup = function (capabilities)
  require("lspconfig").ocamllsp.setup({
    capabilities = capabilities,
  })
end

return M
