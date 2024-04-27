require("lualine").setup {
  options = {
    theme = "catppuccin",
    component_separators = { left = " ", right = " " },
    section_separators = { left = " ", right = " " },
    disabled_filetypes = {     -- Filetypes to disable lualine for.
        statusline = {"dashboard"},       -- only ignores the ft for statusline.
        winbar = {"dashboard", "terminal", "neo-tree"},           -- only ignores the ft for winbar.
  },
    always_divide_middle = true,
    globalstatus = true,
  },
  extensions = { "overseer", "aerial", "neo-tree", "toggleterm" },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(mode)
          return mode:sub(1, 1)
        end,
      },
    },
    lualine_b = {
      {
        "b:gitsigns_blame_line",
        color = { fg = "#cdd6f4", bg = "#11111b", gui = "italic" },
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      {
        "diff",
        diff_color = {
          added = {fg = "#a6e3a1", bg = "#11111b", gui= "italic,bold" },
          modified = {fg = "#fab387", bg = "#11111b", gui= "italic,bold" },
          removed = {fg = "#d20f39", bg = "#11111b", gui= "italic,bold" },
        },
        symbols = { added = "  ", modified = "  ", removed = "  " },
      },
    },
    lualine_z = {
      {
        "encoding",
        fmt = function(str)
          return string.upper(str) .. " "
        end,
        color = { fg = "#cdd6f4", bg = "#11111b", gui = "italic,bold" },
      },
      {
        "location",
        color = { fg = "#cdd6f4", bg = "#11111b", gui = "italic,bold" },
      }
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
    lualine_a = {
      {
        "filetype",
        colored = true,   -- Displays filetype icon in color if set to true
        icon_only = true, -- Display only an icon for filetype
        icon = { align = 'right' }, -- Display filetype icon on the right hand side
        color = { bg = "#181825" },
        -- icon =    {'X', align='right'}
        -- Icon string ^ in table is ignored in filetype component
      },
      {
        "filename",
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = '',
          readonly = '󱚆',
          newfile = '',
        },
        color = { fg = "#cdd6f4", bg = "#181825"},
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        "diagnostics",
        symbols = { error = ' ', warn = '  ', hint = ' ', },
        diagnostics_color = {
          error = {fg = "#d20f39", bg = "#181825", gui= "italic" },
          warn  = {fg = "#f9e2af", bg = "#181825", gui= "italic" },
          hint  = {fg = "#89b4fa", bg = "#181825", gui= "italic" },
        },
      },
    },
  },
  inactive_winbar = {
    lualine_a = {
      {
        "filetype",
        colored = true,   -- Displays filetype icon in color if set to true
        icon_only = true, -- Display only an icon for filetype
        icon = { align = 'right' }, -- Display filetype icon on the right hand side
        color = { bg = "#181825" },
        -- icon =    {'X', align='right'}
        -- Icon string ^ in table is ignored in filetype component
      },
      {
        "filename",
        path = 1,
        shorting_target = 40,
        color = { fg = "#cdd6f4", bg = "#181825"},
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {"overseer"},
  }
}
