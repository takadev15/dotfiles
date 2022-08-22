pcall(vim.cmd, [[packadd nvim-navic]])

-- Statusline
local gl = require("galaxyline")
local navic = require("nvim-navic")
local gls = gl.section

gl.short_line_list = {
  "LuaTree",
  "vista",
  "dbui",
  "startify",
  "term",
  "nerdtree",
  "fugitive",
  "fugitiveblame",
  "plug",
}

local colors = {
  bg = "#0F111A",
  line_bg = "#1B1E2B",
  fg = "#FFFFFF",
  fg_green = "#14B37D",
  yellow = "#F2F27A",
  cyan = "#87D3F8",
  darkblue = "#0B0D14",
  green = "#14B37D",
  orange = "#f39c12",
  purple = "#c74de",
  magenta = "#703FAF",
  blue = "#3A75C4",
  red = "#FF4151",
}


local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

local condition = require("galaxyline.condition")

gls.left[1] = {
  FirstElement = {
    provider = function()
      return " "
    end,
    highlight = { colors.blue, colors.bg },
  },
}
gls.left[2] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {
      require("galaxyline.providers.fileinfo").get_file_icon_color,
      colors.bg,
    },
  },
}
gls.left[3] = {
  FileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg },
  },
}

gls.left[4]= {
    nvimNavic = {
        provider = function()
            return navic.get_location()
        end,
        condition = function()
            return navic.is_available()
        end
    }
}

gls.left[5] = {
  Space = {
    provider = function()
      return " "
    end,
    highlight = { colors.bg, colors.bg },
  },
}

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.right[1] = {
  DiffAdd = {
    provider = "DiffAdd",
    icon = "  ",
    condition = checkwidth,
    highlight = { colors.green },
  },
}
gls.right[2] = {
  DiffModified = {
    provider = "DiffModified",
    icon = "  ",
    condition = checkwidth,
    highlight = { colors.orange },
  },
}
gls.right[3] = {
  DiffRemove = {
    provider = "DiffRemove",
    icon = "  ",
    condition = checkwidth,
    highlight = { colors.red },
  },
}

gls.right[4] = {
  Space = {
    provider = function()
      return " "
    end,
    highlight = { colors.bg, colors.bg },
  },
}

gls.right[5] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = " ",
    highlight = { colors.red },
  },
}

gls.right[6] = {
  DiagnosticWarning = {
    provider = "DiagnosticWarn",
    icon = " ",
    highlight = { colors.yellow },
  },
}

gls.right[7] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = { colors.blue },
  },
}

gls.right[8] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " | ",
    separator_highlight = { colors.blue },
    highlight = { colors.fg },
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    separator = " ",
    condition = has_file_type,
    separator_highlight = { colors.bg, colors.bg },
    highlight = { colors.fg, colors.bg },
  },
}

gls.short_line_left[2] = {
  FileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, "bold" },
  },
}
