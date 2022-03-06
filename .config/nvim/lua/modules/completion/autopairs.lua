pcall(vim.cmd, [[packadd nvim-autopairs]])
local npairs = require("nvim-autopairs")

npairs.setup({
  disable_filetype = { "TelescopePrompt" },
  enable_moveright = true,
  enable_afterquota = true,
  enable_check_bracket_line = true,
  ignored_next_char = "[%w%.]",
  check_ts = true,
})

--[[ require("nvim-autopairs.completion.cmp").setup({
  map_cr = true,
  map_complete = true,
  auto_select = true,
}) --]]

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
