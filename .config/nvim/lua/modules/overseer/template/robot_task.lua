return {
  name = "robot build",
  builder = function ()
    local file = vim.fn.expand("%:p")
    return {
      cmd = {"rccs", "run"}
    }
  end,
  condition = {
    filetype = { "python" }
  }
}
