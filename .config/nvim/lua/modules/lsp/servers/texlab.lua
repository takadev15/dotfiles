local M = {}

M.setup = function(capabilities)
  require("lspconfig").texlab.setup({
    settings = {
      texlab = {
        auxDirectory = "build",
        chktex = {
          onEdit = true,
        },
        build = {
          -- args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-outdir=build", "%f" },
          executable = "tectonic",
          args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates", "--outdir", "build" },
          forwardSearchAfter = false,
          oSave = false,
        },
        forwardSearch = {
          executable = "zathura",
          args = { "--synctex-forward", "%l:1:%f", "%p" },
        },
        lint = {
          onChange = true,
        },
      },
    },
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 250,
    },
  })
end

return M
