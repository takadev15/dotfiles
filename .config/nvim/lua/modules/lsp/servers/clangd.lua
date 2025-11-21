local lsp = vim.lsp
local M = {}

M.setup = function(capabilities)
  lsp.config('clangd', {
    extensions = { autoSetHints = false },
    server = {
      -- cmd = { "clangd", "--offset-encoding=utf-16", "--clang-tidy", "--completion-style=bundled", "--malloc-trim" },
      cmd = { "clangd", "--clang-tidy", "--completion-style=bundled", "--malloc-trim" },
      init_options = {
        clangdFileStatus = true,
      },
      capabilities = capabilities,
    },
  })

  lsp.enable('clangd')
end

return M
