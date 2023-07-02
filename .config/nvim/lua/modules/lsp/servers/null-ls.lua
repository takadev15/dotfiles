local null_ls = require("null-ls")
local formatter = null_ls.builtins.formatting
local linter = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

local sources = {

  --Action
  action.gitrebase,
  action.shellcheck,

  -- Formatter
  -- builtins.formatting.clang_format,
  formatter.dart_format,
  formatter.eslint_d,
  formatter.gofumpt,
  formatter.yapf,
  formatter.rustfmt.with({
    extra_args = function(params)
      local Path = require("plenary.path")
      local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

      if cargo_toml:exists() and cargo_toml:is_file() then
        for _, line in ipairs(cargo_toml:readlines()) do
          local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
          if edition then
            return { "--edition=" .. edition }
          end
        end
      end
      -- default edition when we don't find `Cargo.toml` or the `edition` in it.
      return { "--edition=2021" }
    end,
  }),
  formatter.shfmt.with({
    extra_args = function(utils)
      if utils.root_has_file(".editorconfig") then
        return {}
      end
      return { "-i", "2", "-ci", "-sr" }
    end,
  }),
  formatter.stylua.with({
    condition = function(utils)
      return utils.root_has_file(".stylua.toml") or utils.root_has_file("stylua.toml")
    end,
  }),
  formatter.sqlfluff,
  formatter.yapf,

  -- Linter
  -- linter.chktex,
  linter.buf,
  linter.codespell.with({
    condition = function(utils)
      return utils.root_has_file("setup.cfg") or utils.root_has_file(".codespellrc")
    end,
  }),
  linter.flake8.with({
    condition = function(utils)
      return utils.root_has_file(".flake8") or utils.root_has_file("setup.cfg") or utils.root_has_file("tox.ini")
    end,
  }),
  linter.golangci_lint,
  -- linter.hadolint,
  -- linter.markdownlint,
  linter.shellcheck,
  linter.sqlfluff.with({
    extra_args = {"--dialect", "postgres"},
  }),
  -- linter.pylint,

}

null_ls.setup({
  debounce = 500,
  log = {
    enable = false,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>sf", "", { callback = vim.lsp.buf.format })

      -- Autoformat on save
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   buffer = bufnr,
      --   callback = function()
      --     lsp_formatting(bufnr)
      --   end,
      -- })
    end
  end,
  sources = sources,
})
