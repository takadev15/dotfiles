local npairs = require("nvim-autopairs")

npairs.setup({
  disable_filetype = { "TelescopePrompt" },
  enable_moveright = true,
  enable_afterquota = true,
  enable_check_bracket_line = true,
  ignored_next_char = "[%w%.]",
  check_ts = true,
})
