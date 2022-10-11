require("neotest").setup({
  adapters = {
    require("neotest-vim-test")({ ignore_file_types = { "go", "rust" } }),
    require("neotest-go"),
    require("neotest-rust"),
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
