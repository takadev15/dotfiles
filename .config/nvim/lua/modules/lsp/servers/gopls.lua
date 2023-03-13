local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").gopls.setup({
    cmd = { "gopls", "-remote=auto" },
    settings = {
      gopls = {
        ["build.allowImplicitNetworkAccess"] = true,
        analyses = { unusedparams = true, unreachable = true },
        codelenses = {
          generate = true,
          gc_details = true,
          test = true,
          tidy = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        usePlaceholders = true,
        semanticTokens = true,
        completeUnimported = true,
        staticcheck = true,
        diagnosticsDelay = "500ms",
        gofumpt = false,
        buildFlags = { "-tags", "integration" },
        experimentalPostfixCompletions = true,
      },
    },
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.keymap.del({ "n", "v" }, "<leader>a", { buffer = bufnr })
      vim.keymap.set({ "n", "v" }, "<leader>a", ":GoCodeAction<CR>", { buffer = bufnr })
    end,
    capabilities = capabilities,
  })
end

return M
