local M ={}

local opts = {noremap = true, silent = true}

M.setup = function (on_attach, capabilities)

  require("flutter-tools").setup{
    experimental = {
      lsp_derive_paths = true,
    },
    flutter_lookup_cmd = nil,
    debugger = {
      enabled = true,
    },
    widget_guides = {
      enabled = true,
    },
    closing_tags = {
      highlight = "Comment",
      prefix = " // ",
    },
    dev_log = {
      open_cmd = "tabnew",
    },
    outline = {
      open_cmd = "35vnew",
    },
    lsp = {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        require("telescope").load_extension("flutter")
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ss", "<cmd>FlutterOutlineToggle<CR>", opts)
      end,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 500,
      },
      settings = {
        showTodos = true,
        completeFunctionCalls = false,
      },
    },
  }
end

return M
