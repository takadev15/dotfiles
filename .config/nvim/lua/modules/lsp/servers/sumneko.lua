local M = {}

M.setup = function(on_attach, capabilities)
  local luadev = require("lua-dev").setup({
    library = {
      vimruntime = true,
      types = true,
      plugins = true,
    },
    lspconfig = {
      cmd = { "lua-language-server" },
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 250,
      },
    },
  })
  require("lspconfig").sumneko_lua.setup(luadev)
end

return M
