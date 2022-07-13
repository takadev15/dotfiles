require("toggleterm").setup({
  direction = "horizontal",
  insert_mappings = false,
  open_mapping = [[<leader>sm]],
  size = function(term)
    if term.direction == "horizontal" then
      return 8
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  start_in_insert = false,
  terminal_mappings = false,
})
