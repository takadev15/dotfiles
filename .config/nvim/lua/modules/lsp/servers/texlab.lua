local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").texlab.setup({
    settings = {
      texlab = {
        auxDirectory = "build",
        build = {
          onSave = true,
          -- args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-outdir=build", "%f" },
          executable = "latexmk",
        },
        lint = {
          onChange = true,
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 250,
    },
  })
end

return M
