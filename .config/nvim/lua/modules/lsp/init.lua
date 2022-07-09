local lsp = vim.lsp
local telescope = require("telescope.builtin")
pcall(vim.cmd, [[packadd cmp-nvim-lsp]])
vim.notify = require("notify")

-- LSP default override
  lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
    border = "rounded",
    max_width = 60,
    max_height = 19,
  })
  lsp.handlers["textDocument/implementation"] = telescope.lsp_implementations
  lsp.handlers["textDocument/references"] = telescope.lsp_references
  lsp.handlers["textDocument/typeDefinition"] = telescope.lsp_type_definitions
  lsp.handlers["workspace/symbol"] = telescope.lsp_workspace_symbols
--
-- Custom Capabilities
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Custom attach
local on_attach = function(client, bufnr)
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
  map("v", "<leader>a", lsp.buf.range_code_action)
  map("n", "<leader>wl", function()
    print(vim.inspect(lsp.buf.list_workspace_folders()))
  end)

  -- Disable server formatting capabilities
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  -- LSP Signature
  require("lsp_signature").on_attach({
    bind = true,
    doc_lines = 2,
    floating_window = false,
    fix_pos = false,
    hint_enable = true,
    hint_prefix = "ﰠ ",
    hint_scheme = "Todo",
    use_lspsaga = false,
    hi_parameter = "Search",
    max_height = 12,
    max_width = 60,
    handler_opts = {
      border = "none",
    },
    extra_trigger_chars = { "(", ",", "." },
  })

  -- Cmp-lsp init
  require("cmp_nvim_lsp").setup()

  -- nvim-navic
  require("nvim-navic").attach(client, bufnr)

  vim.notify("[" .. client.name .. "] " .. "Language Server Protocol started")
end

-- require("symbols-outline").setup({})

local server_list = {
  "clangd",
  "dockerls",
  "flutter",
  "gopls",
  "pyright",
  "rust_analyzer",
  "sumneko",
  "texlab",
  "jees",
  "tailwind",
  "bash",
}

for _, server in ipairs(server_list) do
  require("modules.lsp." .. server).setup(on_attach, capabilities)
end
