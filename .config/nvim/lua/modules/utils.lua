local M = {}

M.keymap = function(bufnr, mode, l, r, opts)
  opts = opts or {}
  if bufnr ~= nil then
    opts.buffer = bufnr
  end
  vim.keymap.set(mode, l, r, opts)
end

return M
