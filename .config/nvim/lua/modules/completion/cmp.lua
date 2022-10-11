local cmp = require("cmp")
local neogen = require("neogen")
local luasnip = require("luasnip")
pcall(vim.cmd, [[packadd cmp-git]])

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local item_kinds = {
  Text = " Text",
  Method = " Method",
  Function = "ƒ Function",
  Constructor = " Constructor",
  Field = "識Field",
  Variable = " Variables",
  Class = " Class",
  Interface = "ﰮ Interface",
  Module = " Modules",
  Property = " Property",
  Unit = " Unit",
  Value = " Value",
  Enum = "了Enum",
  Keyword = " Keyword",
  Snippet = " Snips",
  Color = " Color",
  File = " Files",
  Reference = "渚Reference",
  Folder = " Folder",
  Constant = " Constant",
  Struct = " Struct",
  Event = "鬒Event",
  Operator = "\u{03a8} Operator",
  TypeParameter = " TypeParameter",
}

local item_menu = ({
  nvim_lsp = "[LSP]",
  luasnip = "[SNIPS]",
  -- neorg = "[NEORG]",
  path = "[PATH]",
  latex_symbols = "[TEX]",
  cmp_git = "[GIT]",
  buffer = "[BUF]",
})

-- compe setup
cmp.setup({
  window = {
    documentation = {
      max_width = 60,
      max_height = 20,
    },
  },
  completion = {
    keyword_length = 1,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = item_kinds[vim_item.kind]
      vim_item.menu = item_menu[entry.source.name]
      vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
      return vim_item
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if neogen.jumpable() then
        vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      --[[ if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-p>"), "n") ]]
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-k>"] = cmp.mapping.scroll_docs(2),
    ["<C-j>"] = cmp.mapping.scroll_docs(-2),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    }),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    -- { name = "neorg" },
    { name = "path" },
    { name = "cmp_git" }
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})

require("cmp_git").setup({
  filetypes = { "gitcommit" },
  github = {
    issues = {
      filter = "all",
      limit = 50,
      state = "open",
    },
    mentions = {
      limit = 50,
    },
  },
})

-- customization
-- Tex Function on curly braces
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "{" } }))

