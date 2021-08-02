local set = vim.g
local cmd = vim.cmd

--Vsnip Keymap
cmd([[imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']])
cmd([[smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']])

cmd([[imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
cmd([[smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])

cmd([[imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']])
cmd([[smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']])
cmd([[imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']])
cmd([[smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']])

cmd([[nmap s <Plug>(vsnip-select-text)]])
cmd([[xmap s <Plug>(vsnip-select-text)]])
cmd([[nmap S <Plug>(vsnip-cut-text)]])
cmd([[xmap S <Plug>(vsnip-cut-text)]])

-- Snippets location
set.vsnip_snippet_dir = "~/.config/nvim/snippets"

-- Remove <CR> keybinds
set.completion_confirm_key = ""

cmd([[inoremap <silent><expr> <C-j>     compe#scroll({ 'delta': +2 })]])
cmd([[inoremap <silent><expr> <C-k>     compe#scroll({ 'delta': -2 })]])

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-n>")
  elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
    return t("<Plug>(vsnip-expand-or-jump)")
  elseif check_back_space() then
    return t("<Tab>")
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-p>")
  elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
    return t("<Plug>(vsnip-jump-prev)")
  else
    return t("<S-Tab>")
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })


-- compe setup
require'compe'.setup ({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
    ultisnips = true,
    luasnip = true,
  },
})
