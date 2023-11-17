local M = {}

local context = require("cmp.config.context")
local kinds = require("cmp.types.lsp").CompletionItemKind
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local handlers = require("nvim-autopairs.completion.handlers")

M.item_kinds = {
  Text = " Text",
  Method = " Method",
  Function = "ƒ Function",
  Constructor = " Constructor",
  Field = "󰓽Field",
  Variable = " Variable",
  Class = " Class",
  Interface = "󰜰 Interface",
  Module = "󰏗 Module",
  Property = " Property",
  Unit = " Unit",
  Value = "󰎠 Value",
  Enum = "󰒻Enum",
  Keyword = "󰌆 Keyword",
  Snippet = " Snippet",
  Color = " Color",
  File = " File",
  Reference = "Reference",
  Folder = " Folder",
  Constant = " Constant",
  Struct = " Struct",
  Event = "󰥕Event",
  Operator = "\u{03a8} Operator",
  TypeParameter = "󰜢 TypeParameter",
}

M.item_menu = {
  nvim_lsp = "[LSP]",
  luasnip = "[SNIPS]",
  path = "[PATH]",
  latex_symbols = "[TEX]",
  cmp_git = "[GIT]",
  buffer = "[BUF]",
}

M.allow_list = {
  kinds.Constant,
  kinds.Enum,
  kinds.EnumMember,
  kinds.Field,
  kinds.Keyword,
  kinds.Operator,
  kinds.Text,
  kinds.Unit,
  kinds.Variable,
  kinds.Value,
}

M.allow_append_space = function(entry_kind)
  for _, val in ipairs(M.allow_list) do
    if entry_kind == val then
      return true
    end
  end

  return false
end

M.append_space = function()
  return function(e)
    local ts_utils = require("nvim-treesitter.ts_utils")
    local node = ts_utils.get_node_at_cursor(0)
    local entry = e.entry
    local item = entry:get_completion_item()

    -- Check if there are any char after cursor
    -- local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- if vim.api.nvim_buf_get_lines(0, line, line + 1, true)[1]:sub(col, col):match("%s") ~= nil then
    --   return
    -- end

    local prohibited_node = {
      "argument_list",
      "parameter_list",
      "keyed_element",
    }

    -- Check treesitter node
    if node and node:parent() and not vim.tbl_contains(prohibited_node, node:parent():type()) then
      if vim.tbl_contains(M.allow_list, item.kind) then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Space>", true, true, true), "", true)
      end
    end
  end
end

M.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

M.concat_str = function(str)
  if string.len(str) > 35 then
    return string.sub(str, 1, 20) .. "..." .. string.sub(str, -12)
  end
  return str
end

M.on_confirm_done = cmp_autopairs.on_confirm_done({
  filetypes = {
    tex = {
      ["{"] = {
        kind = {
          kinds.Function,
          kinds.Method,
        },
        handler = handlers["*"],
      },
    },
  },
})

return M
