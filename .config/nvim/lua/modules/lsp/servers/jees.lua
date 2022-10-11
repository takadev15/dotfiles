local M = {}
local opts = { noremap = true, silent = true }

M.setup = function(on_attach, capabilities)
 require("typescript").setup({
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
    },
  })
end

return M
