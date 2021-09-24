local M = {}
local opts = { noremap = true, silent = true }


M.setup = function (on_attach,capabilities)
  require("lspconfig").gopls.setup{
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    require("go").setup({
      goimport = "gofumports",
      gofmt = "gofumpt",
      max_len = 120,
      transform = false,
      test_template = "",
      test_template_dir = "",
      comment_placeholder = "",
      verbose = false,
    })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>Gd", "<cmd>GoCmt<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>Gl", "<cmd>GoLint<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>Gf", '<cmd>lua require"go.format".gofmt()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>Gat", "<cmd>GoAddTag<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>Grt", "<cmd>GoRmTag<CR>", opts)

    require "lsp_signature".on_attach()
  end,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 500,
    },
  }
end

return M
