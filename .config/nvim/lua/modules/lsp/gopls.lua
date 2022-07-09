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
        usePlaceholders = true,
        semanticTokens = true,
        completeUnimported = true,
        staticcheck = true,
        diagnosticsDelay = "500ms",
        experimentalWatchedFileDelay = "100ms",
        gofumpt = false,
        buildFlags = { "-tags", "integration" },
        experimentalPostfixCompletions = true,
        experimentalUseInvalidMetadata = true,
      },
    },
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  })
end

return M
