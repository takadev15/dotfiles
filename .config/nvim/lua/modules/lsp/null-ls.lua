local null_ls = require("null-ls")
local builtins = null_ls.builtins

local sources = {
  -- Formatter
  builtins.formatting.clang_format,
  builtins.formatting.dart_format,
  -- builtins.formatting.deno_fmt,
  builtins.formatting.eslint_d,
  builtins.formatting.rustfmt,
  builtins.formatting.shfmt.with({
    extra_args = { "-i", "2", "-ci", "-sr" },
  }),
  builtins.formatting.stylua.with({
    condition = function(utils)
      return utils.root_has_file(".stylua.toml") or utils.root_has_file("stylua.toml")
    end,
  }),
  builtins.formatting.yapf,
  -- Diagnostics
  builtins.diagnostics.chktex,
  builtins.diagnostics.codespell.with({
    condition = function(utils)
      return utils.root_has_file("setup.cfg") or utils.root_has_file(".codespellrc")
    end,
  }),
  builtins.diagnostics.flake8,
  builtins.diagnostics.hadolint,
  builtins.diagnostics.markdownlint,
  builtins.diagnostics.shellcheck,
  -- builtins.diagnostics.pylint,
}

local M = {}

M.setup = function(on_attach, _)
  null_ls.config({
    sources = sources,
  })
  require("lspconfig")["null-ls"].setup({
    on_attach = on_attach,
  })
end

return M
