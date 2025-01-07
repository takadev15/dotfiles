require("neotest").setup({
  adapters = {
    require("neotest-go"),
    require("neotest-rust"),
    require("neotest-jest"),
  },
  floating = {
    border = "solid",
    max_height = 40,
    max_width = 60,
  },
  status = {
    signs = false,
    virtual_text = true,
  },
})
