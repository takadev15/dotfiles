local sidebar = require("sidebar-nvim")

sidebar.setup({
  disable_default_keybindings = 0,
  bindings = {
    ["q"] = function()
      require("sidebar-nvim").close()
    end,
  },
  open = false,
  side = "left",
  initial_width = 35,
  update_interval = 1000,
  sections = { "datetime", "git-status", "diagnostics" },
  section_separator = "-----",
})
