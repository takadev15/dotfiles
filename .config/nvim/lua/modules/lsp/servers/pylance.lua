local lsputil = require("lspconfig.util")

local M = {}

local function on_workspace_executecommand(_, result, ctx)
  if ctx.params.command:match("WithRename") then
    ctx.params.command = ctx.params.command:gsub("WithRename", "")
    vim.lsp.buf.execute_command(ctx.params)
  end
  if result then
    if result.label == "Extract Method" then
      local old_value = result.data.newSymbolName
      local file = vim.tbl_keys(result.edits.changes)[1]
      local range = result.edits.changes[file][1].range.start
      local params = { textDocument = { uri = file }, position = range }
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      local bufnr = ctx.bufnr
      local prompt_opts = {
        prompt = "New Method Name: ",
        default = old_value,
      }
      if not old_value:find("new_var") then
        range.character = range.character + 5
      end
      vim.ui.input(prompt_opts, function(input)
        if not input or #input == 0 then
          return
        end
        params.newName = input
        local handler = client.handlers["textDocument/rename"] or vim.lsp.handlers["textDocument/rename"]
        client.request("textDocument/rename", params, handler, bufnr)
      end)
    end
  end
end

M.setup = function(on_attach, capabilities)
  require("lspconfig.configs").pylance = {
    default_config = {
      name = "pylance",
      autostart = true,
      single_file_support = true,
      cmd = { "pylance", "--stdio" },

      -- "node",
      -- vim.fn.expand("~/.vscode/extensions/ms-python.vscode-pylance-*/dist/server.bundle.crack.js", false, true)[1],
      -- "--stdio",
      filetypes = { "python" },
      root_dir = function(fname)
        local markers = {
          "Pipfile",
          "pyproject.toml",
          "pyrightconfig.json",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
        }
        return lsputil.root_pattern(unpack(markers))(fname)
          or lsputil.find_git_ancestor(fname)
          or lsputil.path.dirname(fname)
      end,
      settings = {
        python = {
          analysis = vim.empty_dict(),
        },
        telemetry = {
          telemetryLevel = "off",
        },
      },
      handlers = {
        ["workspace/executeCommand"] = on_workspace_executecommand,
      },
      docs = {
        package_json = vim.fn.expand("$HOME/.vscode/extensions/ms-python.vscode-pylance-*/package.json", false, true)[1],
        description = [[
      https://github.com/microsoft/pyright
      `pyright`, a static type checker and language server for python
      ]],
      },
    },
  }

  require("lspconfig").pylance.setup({
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          completeFunctionParens = true,
          diagnosticMode = "workspace",
          diagnosticSeverityOverrides = {
            reportMissingTypeStubs = "none",
          },
          indexing = true,
          inlayHints = {
            variableTypes = false,
            functionReturnTypes = true,
          },
          typeCheckingMode = "basic",
          useLibraryCodeForTypes = true,
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
