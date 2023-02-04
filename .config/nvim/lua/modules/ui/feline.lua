local feline = require("feline")
local lsp = require("feline.providers.lsp")
local dap = require("dap")
local clrs = require("catppuccin.palettes").get_palette()

local M = {}

local colors = {
  bg = "#181825",
  line_bg = "#45475a",
  fg = "#cdd6f4",
  sapphire = "#74c7ec",
  yellow = "#f9e2af",
  cyan = "#94e2d5",
  darkblue = "#1e66f5",
  green = "#a6e3a1",
  orange = "#fab387",
  pink = "#f5c2e7",
  magenta = "#cba6f7",
  blue = "#89b4fa",
  red = "#d20f39",
}

local mode_colors_list = {
    NORMAL = colors.green,
    INSERT = colors.blue,
    VISUAL = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.red,
    ['V-REPLACE'] = colors.red,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.sapphire,
    SHELL = colors.green,
    TERM = colors.blue,
    NONE = colors.yellow
}

local separator = {
  hl = {
    fg = colors.bg,
    bg = colors.bg
  },
  str = " ",
}

local winbar_components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

local statusline_components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

table.insert(winbar_components.active[1], {
  provider = {
    name = "file_info",
    opts = {
      type = "relative-short", 
    },
  },
  enabled = function()
    return vim.api.nvim_buf_get_name(0) ~= ""
  end,
  hl = {
    bg = "NONE",
    style = "bold",
  },
  right_sep = {
    hl = { bg = "NONE" },
    str = " ",
  },
  left_sep = {
    hl = { bg = "NONE" },
    str = " ",
  },
})

table.insert(winbar_components.active[1], {
  provider = function()
    return require("nvim-navic").get_location()
  end,
  enabled = function()
    return require("nvim-navic").is_available()
  end,
  hl = {
    bg = "NONE",
  },
})

table.insert(winbar_components.inactive[1], {
  provider = {
    name = "file_info",
    opts = {
      type = "relative-short",
    },
  },
  enabled = function()
    return vim.api.nvim_buf_get_name(0) ~= ""
  end,
  hl = {
    bg = "NONE",
    style = "bold",
  },
  right_sep = {
    hl = { bg = "NONE" },
    str = " ",
  },
  left_sep = {
    hl = { bg = "NONE" },
    str = " ",
  },
})

table.insert(winbar_components.inactive[1], {
  provider = function()
    return require("nvim-navic").get_location()
  end,
  enabled = function()
    return require("nvim-navic").is_available()
  end,
  hl = {
    bg = "NONE",
  },
})

local color_mode = function ()
  local mode = require("feline.providers.vi_mode").get_vim_mode()
  return mode_colors_list[mode]
end

-- Statusline Components
table.insert(statusline_components.active[1], {
  provider = function()
    local mode = require("feline.providers.vi_mode").get_vim_mode()
    return " " .. mode:sub(1, 1) .. " "
  end,
  hl = {
    bg = color_mode(),
    fg = colors.bg,    
    style = "bold",
  },
  right_sep = "slant_right_2",
})

table.insert(statusline_components.active[1], {
  provider = function()
    return " "
  end,
  hl = {
    bg = colors.bg
  }
})

table.insert(statusline_components.active[1], {
  provider = function()
    local text = require("gitblame").get_current_blame_text()
    if text:len() > 135 then
      return text:sub(1, 100) .. "..."
    end
    return text
  end,
  enabled = function()
    return require("gitblame").is_blame_text_available()
  end,
  hl = {
    fg = colors.fg,
    bg = colors.bg
  },
  left_sep = separator,
})

table.insert(statusline_components.active[1], {
  provider = function()
    return "[DEBUG] " .. dap.status()
  end,
  enabled = function()
    return dap.status() ~= ""
  end,
  hl = {
    fg = colors.orange,
    bg = colors.bg,
  },
  left_sep = separator,
})

table.insert(statusline_components.active[3], {
  provider = "file_encoding",
  hl = {
    style = "bold,italic",
    bg = colors.bg
  },
  right_sep = separator,
})

table.insert(statusline_components.active[3], {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist("Error")
  end,
  hl = {
    fg = colors.red,
    bg = colors.bg
  },
  icon = "  ",
})

table.insert(statusline_components.active[3], {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist("Warn")
  end,
  hl = {
    fg = colors.yellow,
    bg = colors.bg
  },
  icon = "  ",
})

table.insert(statusline_components.active[3], {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist("Hint")
  end,
  hl = {
    fg = colors.blue,
    bg = colors.bg
  },
  icon = "  ",
})

table.insert(statusline_components.active[3], {
  provider = "git_diff_added",
  hl = {
    fg = "green",
    bg = colors.bg
  },
  icon = "  ",
})

table.insert(statusline_components.active[3], {
  provider = "git_diff_changed",
  hl = {
    fg = colors.orange,
    bg = colors.bg
  },
  icon = "  ",
})

table.insert(statusline_components.active[3], {
  provider = "git_diff_removed",
  hl = {
    fg = "red",
    bg = colors.bg,
  },
  icon = "  ",
})

table.insert(statusline_components.active[3], {
  provider = function()
    return " | "
  end,
  hl = {
    bg = colors.bg,
    fg = colors.cyan,
  },
})

table.insert(statusline_components.active[3], {
  provider = "position",
  hl = {
    bg = colors.bg
  },
  right_sep = separator,
})

M.setup = function ()
  feline.setup({
    colors = {
      fg = colors.fg,
      bg = colors.bg,
    },
    vi_mode_colors = colors,
    components = statusline_components,
    force_inactive = {
      filetypes = {},
      buftypes = {},
    }
  })
  feline.winbar.setup({
    colors = {
      bg = "NONE",
    },
    components = winbar_components,
    force_inactive = {
      filetypes = { "neo-tree" },
      buftypes = {}
    }
  })
end

return M
