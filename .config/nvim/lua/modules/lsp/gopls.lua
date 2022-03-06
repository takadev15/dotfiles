local M = {}
local opts = { noremap = true, silent = true }

M.setup = function(on_attach, capabilities)
  require("lspconfig").gopls.setup({
    on_attach = function(client, bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      require("go").setup({
        goimport = "gofumports",
        gofmt = "gofumpt",
        max_line_len = 120,
        transform = false,
        test_template = "",
        test_template_dir = "",
        comment_placeholder = "",
        verbose = false,
      })
      on_attach(client, bufnr)
      map("n", "<leader>Gd", "<cmd>GoCmt<CR>")
      map("n", "<leader>Gl", "<cmd>GoLint<CR>")
      map("n", "<leader>Gf", '<cmd>lua require"go.format".gofmt()<CR>')
      map("n", "<leader>Gat", "<cmd>GoAddTag<CR>")
      map("n", "<leader>Grt", "<cmd>GoRmTag<CR>")

      require("lsp_signature").on_attach()
    end,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 500,
    },
  })
end

return M
