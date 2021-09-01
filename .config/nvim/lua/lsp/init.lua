local lsp = vim.lsp
local protocol = require("vim.lsp.protocol")
local nvim_lsp = require("lspconfig")
local lsp_status = require("lsp-status")

local bmap = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true })
end


-- LSP default override
lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  signs = {
    severity_limit = "Warning",
  },
  virtual_text = {
    severity_limit = "Warning",
  },
  update_in_insert = true,
  underline = true,
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  require('lsp_extensions.workspace.diagnostic').handler, {
    signs = {
      severity_limit = "Warning",
    }
  }
)

-- Custom Capabilities
local custom_capabilities = protocol.make_client_capabilities()
custom_capabilities.textDocument.completion.completionItem.snippetSupport = true
custom_capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

-- Custom attach
local custom_attach = function(client)
  -- LSP Keymapping
  bmap("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
  bmap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
  bmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  bmap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  bmap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  bmap("n", "gr", "<cmd>Telescope lsp_references<CR>")
  bmap("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  bmap("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  bmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  bmap("n", "gR", "<cmd>Lspsaga rename<CR>")
  bmap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  bmap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  bmap("n", "<leader>a", "<cmd>Lspsaga code_action<CR>")
  bmap("v", "<leader>a", "<cmd>Lspsaga range_code_action<CR>")
  bmap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  bmap("n", "<leader>lq", "<cmd>Telescope lsp_workspace_diagnostics<CR>")

  if client.resolved_capabilities.document_formatting then
    bmap("n", "<leader>sf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    bmap("n", "<leader>sf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
  end

  -- Register the process handler
  lsp_status.register_progress()

  -- Cmp-lsp init
  require("cmp_nvim_lsp").setup()

  -- LSP Signature

  -- LSP Outline Symbols
  bmap("n", "<leader>ss", "<cmd>SymbolsOutline<CR>")
  vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    position = "right",
    keymaps = {
      close = "<Esc>",
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<K>",
      rename_symbol = "r",
      code_actions = "a",
    },
    lsp_blacklist = { "texlab", "dartls" },
  }

  -- set omnifunc
  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

end

-- LSP with default lspconfig repo
local default_servers = { "bashls", "cssls", "dockerls", "pyright", "tsserver", "yamlls", "zls" }
for _, server in ipairs(default_servers) do
  nvim_lsp[server].setup({
    on_attach = custom_attach,
    capabilities = custom_capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end


-- Language Specific config
-- Flutter
require("flutter-tools").setup({
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
    open_cmd = "tabedit",
  },
  outline = {
    open_cmd = "35vnew",
  },
  lsp = {
    on_attach = function(client)
      custom_attach(client)
      require("telescope").load_extension("flutter")
      bmap("n", "<leader>ss", "<cmd>FlutterOutlineToggle<CR>")
    end,
    capabilities = custom_capabilities,
    settings = {
      showTodos = true,
      completeFunctionCalls = false,
    },
  },
})

-- Gopls
nvim_lsp.gopls.setup{
  on_attach = function(client)
    custom_attach(client)
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
    bmap("n", "<leader>Gd", "<cmd>GoCmt<CR>")
    bmap("n", "<leader>Gl", "<cmd>GoLint<CR>")
    bmap("n", "<leader>Gf", '<cmd>lua require"go.format".gofmt()<CR>')
    bmap("n", "<leader>Gat", "<cmd>GoAddTag<CR>")
    bmap("n", "<leader>Grt", "<cmd>GoRmTag<CR>")
    require "lsp_signature".on_attach()
  end,
  capabilities = custom_capabilities,
  }

-- Tailwindcss lsp
nvim_lsp.tailwindcss.setup{}

-- Sumneko-Lua
local luadev = require("lua-dev").setup{
  library = {
    vimruntime = true,
    types = true,
    plugins = true,
  },
  lspconfig = {
    cmd = { "lua-language-server" },
    on_attach = custom_attach,
    capabilities = custom_capabilities,
  },
}
nvim_lsp.sumneko_lua.setup(luadev)


