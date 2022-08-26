require("tabline_framework").setup({
  hl = { fg = "#ffffff", bg = "#11111b" },
  hl_sel = { fg = "#11111b", bg = "#89dceb" },
  render = function(f)
    f.make_tabs(function(info)
      f.add(" Tab " .. info.index .. " ")
    end)

    -- Align to right
    f.add_spacer()

    -- Diagnostics
    local errors = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR }))
    local warnings = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN }))
    local hints = vim.tbl_count(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.HINT }))

    if errors ~= 0 then
      f.add({ "  " .. errors .. " ", fg = "#0F111A", bg = "#d20f39" })
    end
    if warnings ~= 0 then
      f.add({ "  " .. warnings .. " ", fg = "#0F111A", bg = "#e5c890" })
    end
    if hints ~= 0 then
      f.add({ "  " .. hints .. " ", fg = "#0F111A", bg = "#94e2d5" })
    end

    -- Git Branch
    local git_branch = vim.g.gitsigns_head
    if git_branch and git_branch ~= "" then
      f.add({ "  " .. git_branch .. " ", fg = "#0F111A", bg = "#fe640b", bold = true })
    end
  end,
})
