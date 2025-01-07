local M = {}

M.setup = function(capabilities)
  require("lspconfig").gopls.setup({
    cmd = { "gopls", "-remote=auto" },
    settings = {
      gopls = {
        -- ["build.allowImplicitNetworkAccess"] = true,
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
        gofumpt = true,
        buildFlags = { "-tags", "integration" },
        experimentalPostfixCompletions = true,
      },
    },
    capabilities = capabilities,
  })
end

return M
