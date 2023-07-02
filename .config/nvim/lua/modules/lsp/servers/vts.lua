local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig.configs").vtsls = {
    default_config = {
      name = "vtsls",
      autostart = true,
      cmd = {"vtsls", "--stdio"},
      filetypes = {"typescript", "javascript"},
      root_dir = require("lspconfig").util.root_pattern("package.json")
    },
  }

  require("lspconfig").vtsls.setup({
    capabilities = capabilities,
  })
end

return M
