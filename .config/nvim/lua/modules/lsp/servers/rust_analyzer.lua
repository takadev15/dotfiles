local M = {}

local opts = { noremap = true, silent = true }

M.setup = function(capabilities)
    require("rust-tools").setup({
    --   dap = {
    --     adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    -- },
    tools = {
      autoSetHints = true,
      executor = require("rust-tools.executors").toggleterm,
      hover_with_actions = false,
      inlay_hints = {
        auto = false,
      },
      on_initialized = function()
        vim.api.nvim_create_autocmd(
          { "BufEnter", "CursorHold", "InsertLeave" },
          { pattern = "*.rs", callback = vim.lsp.codelens.refresh }
        )
      end,
    },
    server = {
      -- cmd = {"ra-multiplex"},
      cargo = { allFeatures = true },
      standalone = false,
      capabilities = capabilities,
      -- flags = {
      --   debounce_text_changes = 250,
      -- },
    },
  })
end

return M
