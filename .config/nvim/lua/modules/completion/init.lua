local cmp = require("cmp")
local neogen = require("neogen")
local cmp_types = require("cmp.types")
local cmp_compare = require("cmp.config.compare")
local luasnip = require("luasnip")
local utils = require("modules.completion.utils")
local configs = require("modules.completion.config")

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

--- @diagnostic disable-next-line
cmp.setup({
  enabled = function()
    local context = require("cmp.config.context")
    -- Disable completion on comment
    return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
  end,
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = utils.item_kinds[vim_item.kind]
      vim_item.abbr = utils.concat_str(vim_item.abbr)
      return vim_item
    end,
  },
  window = {
    documentation = {
      max_width = 60,
      max_height = 20,
    },
  },
  completion = {
    keyword_length = 1,
  },
  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if neogen.jumpable() then
        vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif utils.has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {"i", "s"}
    ),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {"i", "s"}
    ),
    ["<C-l>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end),
    ["<C-h>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end),
    ["<C-k>"] = cmp.mapping.scroll_docs(2),
    ["<C-j>"] = cmp.mapping.scroll_docs(-2),
    ["<CR>"] = cmp.mapping(function(fallback)
      local entry = cmp.get_selected_entry()
      if entry then
        cmp.confirm()
      else
        fallback()
      end
    end),
  },
  preselect = cmp_types.cmp.PreselectMode.None,
  sorting = {
    comparators = {
      cmp_compare.recently_used,
      cmp_compare.locality,
      cmp_compare.score,
      cmp_compare.offset,
      cmp_compare.order,
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "luasnip", option = { show_autosnippets = true } },
    { name = "nvim_lsp" },
    { name = "path" },
  },
  experimental = {
    ghost_text = true,
  },
})

-- customization
cmp.event:on("confirm_done", utils.on_confirm_done)
cmp.event:on("confirm_done", utils.append_space)

-- Additional configs
configs.load_autopairs()
configs.load_luasnip()
require("modules.completion.filetypes")
