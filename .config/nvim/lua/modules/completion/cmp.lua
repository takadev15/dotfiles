local cmp = require("cmp")
local neogen = require("neogen")
local npairs = require("nvim-autopairs")

-- Snippets location
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local item_kinds = {
  Text = "",
  Method = "",
  Function = "ƒ",
  Constructor = "",
  Field = "識",
  Variable = "",
  Class = "",
  Interface = "ﰮ",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "了",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "渚",
  Folder = "",
  Constant = "",
  Struct = "",
  Event = "鬒",
  Operator = "\u{03a8}",
  TypeParameter = "",
}

-- compe setup
cmp.setup({
  completion = {
    keyword_length = 1,
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = item_kinds[vim_item.kind]
      return vim_item
    end,
  },
  mapping = {
    ["<TAB>"] = cmp.mapping(function(fallback)
      --[[ if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-n>"), "n") ]]
      if cmp.visible() then
        cmp.select_next_item()
      elseif neogen.jumpable() then
        vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
      elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
        return vim.fn.feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "")
      elseif check_back_space() then
        vim.fn.feedkeys(t("<Tab>"), "n")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-TAB>"] = cmp.mapping(function(fallback)
      --[[ if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t("<C-p>"), "n") ]]
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-jump-prev)"), "")
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
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "vsnip" },
    { name = "nvim_lsp" },
    { name = "neorg" },
    { name = "path" },
  },
})

npairs.setup({
  disable_filetype = { "TelescopePrompt" },
  enable_moveright = true,
  enable_afterquota = true,
  enable_check_bracket_line = true,
  ignored_next_char = "[%w%.]",
  check_ts = true,
})

-- you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true, -- automatically select the first item
})
