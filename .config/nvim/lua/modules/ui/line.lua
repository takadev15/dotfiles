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
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local alias = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        V = "VISUAL",
        [""] = "VISUAL",
        v = "VISUAL",
        c = "COMMAND-LINE",
        ["r?"] = ":CONFIRM",
        rm = "--MORE",
        R = "REPLACE",
        Rv = "VIRTUAL",
        s = "SELECT",
        S = "SELECT",
        ["r"] = "HIT-ENTER",
        [""] = "SELECT",
        t = "TERMINAL",
        ["!"] = "SHELL",
      }
      local mode_color = {
        n = colors.green,
        i = colors.blue,
        v = colors.magenta,
        [""] = colors.blue,
        V = colors.blue,
        c = colors.red,
        no = colors.magenta,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.purple,
        Rv = colors.purple,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.green,
        t = colors.green,
        c = colors.purple,
        ["r?"] = colors.red,
        ["r"] = colors.red,
        rm = colors.red,
        R = colors.yellow,
        Rv = colors.magenta,
      }
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim_mode])
      return " "
    end,
    highlight = { colors.red, colors.bg, "bold" },
  },
}
gls.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {
      require("galaxyline.providers.fileinfo").get_file_icon_color,
      colors.bg,
    },
  },
}
gls.left[4] = {
  FileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg },
  },
}

--[[ gls.left[9] = {
   LeftEnd ={
    provider = '',
    separator = "",
    separator_highlight = {colors.line_bg, colors.bg},
    highlight = {colors.line_bg, colors.bg}
   }
} ]]

gls.left[5]= {
    nvimNavic = {
        provider = function()
            return navic.get_location()
        end,
        condition = function()
            return navic.is_available()
        end
    }
}

gls.left[6] = {
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
    icon = "+",
    condition = checkwidth,
    highlight = { colors.green },
  },
}
gls.right[2] = {
  DiffModified = {
    provider = "DiffModified",
    icon = "~",
    condition = checkwidth,
    highlight = { colors.orange },
  },
}
gls.right[3] = {
  DiffRemove = {
    provider = "DiffRemove",
    icon = "-",
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

-- gls.right[4] = {
--   ScrollBar = {
--     provider = 'ScrollBar',
--     highlight = {colors.blue,colors.purple},
--   }
-- }
--
-- gls.right[3] = {
--   Vista = {
--     provider = VistaPlugin,
--     separator = ' ',
--     separator_highlight = {colors.bg,colors.line_bg},
--     highlight = {colors.fg,colors.line_bg,'bold'},
--   }
-- }

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
