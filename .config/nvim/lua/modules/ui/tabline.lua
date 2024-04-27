require("tabline_framework").setup({
  hl = { fg = "#ffffff", bg = "#181825" },
  hl_sel = { fg = "#181825", bg = "#89dceb" },
  hl_fill = { fg = "#ffffff", bg ="#11111B" },
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
      f.add({ "  " .. errors .. " ", fg = "#181825", bg = "#d20f39" })
    end
    if warnings ~= 0 then
      f.add({ "  " .. warnings .. " ", fg = "#181825", bg = "#e5c890" })
    end
    if hints ~= 0 then
      f.add({ "  " .. hints .. " ", fg = "#181825", bg = "#94e2d5" })
    end

    -- Git Branch
    local git_branch = vim.g.gitsigns_head
    if git_branch and git_branch ~= "" then
      f.add({ "  " .. git_branch .. " ", fg = "#181825", bg = "#fe640b", bold = true })
    end
  end,
})
