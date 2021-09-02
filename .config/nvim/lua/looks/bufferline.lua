-- Bufferline
require("bufferline").setup{
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
        { filetype = "NvimTree", text = "File Tree" },
        { filetype = "dbui", text = "Dadbod-UI" },
        { filetype = "dashboard", text = "Hello" },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = "relative_directory",
      custom_areas = {
        right = function()
          local result = {}
  
          -- LSP Diagnostics
          local lsp_error = require("lsp_extensions.workspace.diagnostic").get_count(0, "Error")
          local lsp_warning = require("lsp_extensions.workspace.diagnostic").get_count(0, "Warning")
          if lsp_error ~= 0 then
            table.insert(result, { text = "  " .. lsp_error .. " ", guifg = "#222222", guibg = "#EC5F67" })
          end
          if lsp_warning ~= 0 then
            table.insert(result, { text = "  " .. lsp_warning .. " ", guifg = "#222222", guibg = "#FABD2F" })
          end
  
          -- LSP-specific options
          for _, client in pairs(vim.lsp.get_active_clients()) do
            if client.name == "dartls" then
              if vim.g.flutter_tools_decorations.app_version ~= nil then
                table.insert(result, {
                  text = " " .. vim.g.flutter_tools_decorations.app_version .. " ",
                  guifg = "#222222",
                  guibg = " #59B3EF",
                })
              end
            end
          end
  
          -- Git branch
          local git_status = vim.fn["fugitive#statusline"]()
          if git_status ~= "" then
            git_status = git_status:match("%((.*)%)")
            table.insert(result, { text = "  " .. git_status .. " ", guifg = "#222222", guibg = "#FF8800" })
          end
  
          return result
        end,
      },
    },
}
