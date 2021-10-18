local M = {}

local pid = vim.fn.getpid()
local omni_bin = "/usr/bin/omnisharp"

M.setup = function(on_attach, capabilities)
  require("lspconfig").omnisharp.setup({
    cmd = { omni_bin, "--languageserver", "--hostPID", tostring(pid) },
    root_dir = require("lspconfig").util.root_pattern("*.csproj", "*.sln"),
  })
end

return M
