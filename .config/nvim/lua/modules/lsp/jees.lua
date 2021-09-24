local M = {}
local opts = { noremap = true, silent = true }


M.setup = function (on_attach, capabilities)

  require("lspconfig").tsserver.setup {
      on_attach = function(client, bufnr)

          local ts_utils = require("nvim-lsp-ts-utils")
          on_attach(client, bufnr)
          -- defaults
          ts_utils.setup {
              debug = false,
              disable_commands = false,
              enable_import_on_completion = false,

              -- import all
              import_all_timeout = 5000, -- ms
              import_all_priorities = {
                  buffers = 4, -- loaded buffer names
                  buffer_content = 3, -- loaded buffer content
                  local_files = 2, -- git files or files with relative path markers
                  same_file = 1, -- add to existing import statement
              },
              import_all_scan_buffers = 100,
              import_all_select_source = false,

              -- eslint
              eslint_enable_code_actions = true,
              eslint_enable_disable_comments = true,
              eslint_bin = "eslint_d",
              eslint_enable_diagnostics = false,
              eslint_opts = {},

              -- formatting
              enable_formatting = true,
              formatter = "eslint_d",
              formatter_opts = {},

              -- update imports on file move
              update_imports_on_move = false,
              require_confirmation_on_move = false,
              watch_dir = nil,

              -- filter diagnostics
              filter_out_diagnostics_by_severity = {},
              filter_out_diagnostics_by_code = {},
          }

          -- required to fix code action ranges and filter diagnostics
          ts_utils.setup_client(client)

          -- no default maps, so you may want to define some here
          vim.api.nvim_buf_set_keymap(bufnr, "n", "gS", ":TSLspOrganize<CR>", opts)
          -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", ":TSLspRenameFile<CR>", opts)
          -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
      end,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 500,
    },
  }
end

return M

