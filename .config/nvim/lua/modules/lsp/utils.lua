local M = {}
local lsp = vim.lsp
local telescope = require("telescope.builtin")
local utils = require("modules.utils")

vim.notify = require("notify")

M.servers = {
  "clangd",
  "dockerls",
  "flutter",
  "gopls",
  "lua_ls",
  "texlab",
  "vts",
  "bash",
  "pylsp",
  "robotframework",
  "zls",
  "valals",
  "serve_d",
  "ocamllsp",
}

M.override_handler = function()
  lsp.handlers["callHierarchy/incomingCalls"] = telescope.lsp_incoming_calls
  lsp.handlers["callHierarchy/outgoingCalls"] = telescope.lsp_outgoing_calls
  lsp.handlers["textDocument/definition"] = telescope.lsp_definitions
  lsp.handlers["textDocument/documentSymbol"] = telescope.lsp_document_symbols
  lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
    border = "solid",
    max_width = 60,
    max_height = 19,
  })
  lsp.handlers["textDocument/implementation"] = telescope.lsp_implementations
  lsp.handlers["textDocument/references"] = telescope.lsp_references
  lsp.handlers["textDocument/typeDefinition"] = telescope.lsp_type_definitions
  lsp.handlers["workspace/symbol"] = telescope.lsp_workspace_symbols
end

M.capabilities = lsp.protocol.make_client_capabilities()
M.capabilities.textDocument = {
  completion = {
    dynamicRegistration = false,
    completionItem = {
      snippetSupport = true,
      commitCharactersSupport = true,
      deprecatedSupport = true,
      preselectSupport = true,
      tagSupport = { valueSet = { 1 } },
      insertReplaceSupport = true,
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
          "sortText",
          "filterText",
          "insertText",
          "textEdit",
          "insertTextFormat",
          "insertTextMode",
        },
      },
      insertTextModeSupport = { valueSet = { 1, 2 } },
      labelDetailsSupport = true,
    },
    contextSupport = true,
    insertTextMode = 1,
    completionList = {
      itemDefaults = {
        "commitCharacters",
        "editRange",
        "insertTextFormat",
        "insertTextMode",
        "data",
      },
    },
  },
  foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  },
}

M.setup_attach_autocmd = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      if not (args.data and args.data.client_id) then
        return
      end

      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client.name == "null-ls" then
        return
      end

      require('jdtls.setup').add_commands()

      local map = utils.keymap

      -- LSP Keymapping
      map(bufnr, "n", "K", lsp.buf.hover)
      map(bufnr, "n", "gh", lsp.buf.signature_help)
      map(bufnr, "n", "gD", lsp.buf.declaration)
      map(bufnr, "n", "gR", lsp.buf.rename)
      map(bufnr, "n", "gs", lsp.buf.document_symbol)
      map(bufnr, "n", "gc", lsp.codelens.run)
      map(bufnr, "n", "gi", telescope.lsp_implementations)
      map(bufnr, "n", "gy", telescope.lsp_type_definitions)
      map(bufnr, "n", "gr", telescope.lsp_references)
      map(bufnr, "n", "gd", telescope.lsp_definitions)
      map(bufnr, "n", "gw", telescope.lsp_workspace_symbols)
      map(bufnr, "n", "<leader>a", lsp.buf.code_action)
      map(bufnr, "v", "<leader>a", lsp.buf.code_action)
      map(bufnr, "n", "<leader>sf", lsp.buf.format)
      map(bufnr, "n", "<leader>wl", function()
        vim.notify(vim.inspect(lsp.buf.list_workspace_folders()))
      end)
      map(bufnr, "n", "<leader>wa", lsp.buf.add_workspace_folder)
      map(bufnr, "n", "<leader>wr", lsp.buf.remove_workspace_folder)
      map(bufnr, "n", "<leader>ci", lsp.buf.incoming_calls)
      map(bufnr, "n", "<leader>co", lsp.buf.outgoing_calls)

      -- Disable server formatting capabilities
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false

      -- Code Lens
      if
          client.supports_method("textDocument/codeLens")
          -- TODO Remove once codelens support virtual lines
          and client.name ~= "rust_analyzer"
          and client.name ~= "jdtls"
      then
        vim.api.nvim_create_autocmd(
          { "BufEnter", "CursorHold", "InsertLeave" },
          { buffer = bufnr, callback = lsp.codelens.refresh }
        )
      end

      -- TODO Workaround for gopls semantic tokens
      -- Remove when dyanmicRegistration support semanticTokens
      if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
        local semantic = client.config.capabilities.textDocument.semanticTokens
        client.server_capabilities.semanticTokensProvider = {
          full = true,
          legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
          range = true,
        }
      end

      -- Code Action (lightbulb)
      if client.supports_method("textDocument/codeAction") then
        vim.api.nvim_create_autocmd(
          { "CursorHold", "CursorHoldI" },
          { buffer = bufnr, callback = require("nvim-lightbulb").update_lightbulb }
        )
      end

      -- TODO Workaround for gopls semantic tokens
      -- Remove when dyanmicRegistration support semanticTokens
      if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
        local semantic = client.config.capabilities.textDocument.semanticTokens
        client.server_capabilities.semanticTokensProvider = {
          full = true,
          legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
          range = true,
        }
      end

      -- Inlay hints
      if client.supports_method("textDocument/inlayHint") then
        lsp.inlay_hint.enable(true, {
          bufnr = bufnr,
        })
      end

      -- nvim-navic
      if client.supports_method("textDocument/documentSymbol") then
        require("nvim-navic").attach(client, bufnr)
      end

      -- register cmp
      require("cmp_nvim_lsp").setup()

      -- vim-notify
      vim.notify("[" .. client.name .. "] " .. "Language Server Protocol started")
    end,
  })
end

return M
