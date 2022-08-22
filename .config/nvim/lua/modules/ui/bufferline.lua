local diagnostic = vim.diagnostic
-- Bufferline
require("bufferline").setup({
  options = {
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator_icon = "",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    name_formatter = function(buf)
      if buf.name:match("%.md") then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = false,
    offsets = {
      { filetype = "neo-tree", text = "File Tree" },
      { filetype = "dbui", text = "Dadbod-UI" },
      { filetype = "dashboard", text = "Hello" },
    },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thick",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "relative_directory",
    custom_areas = {
      right = function()
        local result = {}

        -- LSP Diagnostics
        local diagnostic_error = vim.tbl_count(diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR }))
        local diagnostic_warning = vim.tbl_count(diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN }))
        if diagnostic_error ~= 0 then
          table.insert(result, { text = "  " .. diagnostic_error , guifg = "#FF4151", guibg = "#0F111A" })
        end
        if diagnostic_warning ~= 0 then
          table.insert(result, { text = "  " .. diagnostic_warning , guifg = "#F2F27A", guibg = "#0F111A" })
        end

        -- Git branch
        local git_status = vim.fn["fugitive#statusline"]()
        if git_status ~= "" then
          git_status = git_status:match("%((.*)%)")
          table.insert(result, { text = "  " .. git_status , guifg = "#f39c12", guibg = "#0F111A" })
        end

        return result
      end,
    },
  },
})
