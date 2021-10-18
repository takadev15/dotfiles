local feline = require("feline")
local lsp = require("feline.providers.lsp")
local status = require("lsp-status")
local vi_mode_utils = require("feline.providers.vi_mode")

require("nvim-gps").setup({
  separator = " > ",
})

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

local properties = {
  force_inactive = {
    filetypes = {
      "NvimTree",
      "dbui",
      "startify",
      "fugitive",
      "fugitiveblame",
      "packer",
    },
    buftypes = {
      "terminal",
    },
    bufnames = {},
  },
}

local components = {
  left = { active = {}, inactive = {} },
  mid = { active = {}, inactive = {} },
  right = { active = {}, inactive = {} },
}

components.left.active[1] = {
  provider = "█ ",
  hl = {
    fg = vi_mode_utils.get_mode_color(),
  },
}

--[[ components.left.active[2] = {
  provider = function ()
    local result = {}
    local git_status = vim.fn["fugitive#statusline"]()
     if git_status ~= "" then
     git_status = git_status:match("%((.*)%)")
        table.insert(result, { text = "  " .. git_status .. " ", guifg = "#f39c12", guibg = "#0F111A" })
      end
    return result
  end,
  hl = {
    bg = colors.bg,
    fg = colors.fg,
  }
} ]]

components.left.active[2] = {
  provider = "file_info",
  type = "relative_short",
  hl = {
    fg = colors.fg,
    bg = colors.line_bg,
  },
  sep = {
    str = " ",
  },
}

components.left.active[3] = {
  provider = function()
    return require("nvim-gps").get_location()
  end,
  enabled = function()
    return require("nvim-gps").is_available()
  end,
  hl = {
    fg = colors.white,
    bg = colors.line_bg,
  },
  right_sep = {
    hl = {
      fg = colors.fg,
      bg = colors.line_bg,
    },
    str = ">",
  },
}

components.mid.active[1] = {
  provider = function()
    -- TODO: Improve handling
    local res = {}
    local config = {
      spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
    }

    local buf_message = status.messages()
    for _, msg in ipairs(buf_message) do
      local contents = ""
      if msg.progress then
        contents = msg.title
        if msg.message then
          contents = contents
        end

        if msg.percentage then
          contents = contents
        end

        if msg.spinner then
          contents = contents .. " " .. config.spinner_frames[(msg.spinner % #config.spinner_frames) + 1]
        end
      end

      table.insert(res, contents)
    end

    return vim.trim(table.concat(res, " "))
  end,
  enabled = function()
    return lsp.is_lsp_attached
  end,
  hl = {
    fg = colors.grey,
  },
}

components.right.active[1] = {
  provider = "git_diff_added",
  hl = {
    fg = colors.green,
  },
  icon = "+",
}

components.right.active[2] = {
  provider = "git_diff_changed",
  hl = {
    fg = colors.orange,
  },
  icon = "~",
}

components.right.active[3] = {
  provider = "git_diff_removed",
  hl = {
    fg = colors.red,
  },
  icon = "-",
}

components.right.active[4] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist("Error")
  end,
  hl = {
    fg = colors.red,
  },
  icon = " ",
}

components.right.active[5] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist("Warning")
  end,
  hl = {
    fg = colors.yellow,
  },
  icon = " ",
}

components.right.active[6] = {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist("Hint")
  end,
  hl = {
    fg = colors.cyan,
  },
  icon = " ",
}

components.right.active[7] = {
  provider = "position",
  hl = {
    fg = colors.fg,
    bg = colors.bg,
  },
  left_sep = {
    hl = {
      fg = colors.blue,
    },
    str = "|",
  },
  right_sep = {
    str = " ",
  },
}

-- Inactive components
components.mid.inactive[1] = {
  provider = "file_info",
  type = "relative_short",
  colored_icon = "false",
  hl = {
    fg = colors.fg,
  },
  left_sep = {
    str = " ",
  },
}

components.right.inactive[1] = {
  provider = "position",
  hl = {
    fg = colors.fg,
    bg = colors.bg,
  },
  sep = {
    str = " ",
  },
}

feline.setup({
  default_bg = colors.bg,
  default_fg = colors.fg,
  colors = colors,
  components = components,
  properties = properties,
})
