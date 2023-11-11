local M = {}

M.setup = function(capabilities)
  require("clangd_extensions").setup({
    extensions = { autoSetHints = false },
    server = {
    cmd = { "clangd", "--completion-style=bundled", "--limit-results=50", "--pch-storage=memory" },
    init_options = {
      clangdFileStatus = true,
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    capabilities = capabilities,
    },
  })
end

return M
