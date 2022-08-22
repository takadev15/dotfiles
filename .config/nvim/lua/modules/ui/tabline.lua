require("tabline_framework").setup({
  hl = { fg = "#888888", bg = "#0F111A" },
  hl_fill = { fg = "#888888", bg = "NONE" },
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
      f.add({ "  " .. errors .. " ", fg = "#0F111A", bg = "#EC5F67" })
    end
    if warnings ~= 0 then
      f.add({ "  " .. warnings .. " ", fg = "#0F111A", bg = "#FABD2F" })
    end
    if hints ~= 0 then
      f.add({ "  " .. hints .. " ", fg = "#0F111A", bg = "#A0B9D8" })
    end

    -- Git Branch
    local git_branch = vim.g.gitsigns_head
    if git_branch and git_branch ~= "" then
      f.add({ "  " .. git_branch .. " ", fg = "#0F111A", bg = "#FF8800", bold = true })
    end
  end,
})
