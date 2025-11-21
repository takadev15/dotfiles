local lsp = vim.lsp
local M = {}

M.setup = function(capabilities)
  -- require("lspconfig.configs").vtsls = {
  --   default_config = {
  --     name = "vtsls",
  --     autostart = true,
  --     cmd = {"vtsls", "--stdio"},
  --     filetypes = {"typescript", "javascript"},
  --     root_dir = require("lspconfig").util.root_pattern("package.json"),
  --     -- settings = {
  --     --
  --     -- }
  --   },
  -- }
  --
  -- require("lspconfig").vtsls.setup({
  --   capabilities = capabilities,
  -- })
  lsp.config('vtsls', {
    settings = {
      typescript = {
        inlayHints = {
          parameterNames = { enabled = false },
          parameterTypes = { enabled = false },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = false },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        }
      }
    },
    capabilities = capabilities
  })

  lsp.enable('vtsls')
end

return M
