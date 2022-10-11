require("dressing").setup({
  select = {
    get_config = function(opts)
      if opts.kind == "codeaction" then
        return {
          backend = {"telescope", "builtin", "nui"},
          builtin = {
            relative = "cursor",
          },
        }
      end
    end,
    winblend = 80,
  },
})


