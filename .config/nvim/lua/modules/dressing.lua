require("dressing").setup({
  select = {
    get_config = function(opts)
      if opts.kind == "codeaction" then
        return {
          backend = "builtin",
          builtin = {
            relative = "cursor",
          },
        }
      end
    end,
    winblend = 80,
  },
})
