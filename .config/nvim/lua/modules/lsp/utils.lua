local M = {}

local lsp = vim.lsp
local telescope = require("telescope.builtin")

vim.notify = require("notify")

M.override_handler = function ()
  lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
    border = "rounded",
    max_width = 60,
    max_height = 19,
  })
  lsp.handlers["textDocument/implementation"] = telescope.lsp_implementations
  lsp.handlers["textDocument/references"] = telescope.lsp_references
  lsp.handlers["textDocument/typeDefinition"] = telescope.lsp_type_definitions
  lsp.handlers["workspace/symbol"] = telescope.lsp_workspace_symbols
end

-- M.capabilities = require('cmp_nvim_lsp').update_capabilities(lsp.protocol.make_client_capabilities())

M.on_attach = function (client, bufnr)
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- LSP Keymapping
  map("n", "K", lsp.buf.hover)
  map("n", "gh", lsp.buf.signature_help)
  map("n", "gD", lsp.buf.declaration)
  map("n", "gR", lsp.buf.rename)
  map("n", "gs", lsp.buf.document_symbol)
  map("n", "gc", lsp.codelens.run)
  map("n", "gi", telescope.lsp_implementations)
  map("n", "gy", telescope.lsp_type_definitions)
  map("n", "gr", telescope.lsp_references)
  map("n", "gd", telescope.lsp_definitions)
  map("n", "gw", telescope.lsp_workspace_symbols)
  map("n", "<leader>a", lsp.buf.code_action)
  map("v", "<leader>a", lsp.buf.code_action)
  map("n", "<leader>wl", function()
    print(vim.inspect(lsp.buf.list_workspace_folders()))
  end)

  -- Disable server formatting capabilities
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  -- Code Action (lightbulb)
  if client.supports_method("textDocument/codeAction") then
    vim.api.nvim_create_autocmd(
      { "CursorHold", "CursorHoldI" },
      { buffer = bufnr, callback = require("nvim-lightbulb").update_lightbulb }
    )
  end

  -- nvim-navic
  require("nvim-navic").attach(client, bufnr)

  -- aerial.nvim
  -- require("aerial").on_attach(client, bufnr)

  -- vim-notify
  vim.notify("[" .. client.name .. "] " .. "Language Server Protocol started")

  -- Cmp-lsp init
  if client.name ~= "null-ls" then
    require("cmp_nvim_lsp").setup()
  end
end

return M
