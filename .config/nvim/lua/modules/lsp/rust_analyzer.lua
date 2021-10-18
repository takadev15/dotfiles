local M = {}

local opts = { noremap = true, silent = true }

M.setup = function(on_attach, capabilities)
  require("rust-tools").setup({
    tools = {
      autoSetHints = true,
      hover_with_actions = false,
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        show_parameter_hints = false,
        parameter_hints_prefix = " » ",
        other_hints_prefix = "❱ ",
      },
    },
    server = {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rr", "<cmd>RustRunnables<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rc", "<cmd>RustOpenCargo<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rh", "<cmd>RustHoverActions<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rmu", "<cmd>RustMoveItemUp<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rmd", "<cmd>RustMoveItemDown<CR>", opts)
      end,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 250,
      },
    },
  })
end

return M
