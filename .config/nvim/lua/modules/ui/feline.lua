local feline = require("feline")
local lsp = require("feline.providers.lsp")
local status = require("lsp-status")
local devicons = require("nvim-web-devicons")
local vi_mode_utils = require('feline.providers.vi_mode')


local colors = {
    bg = '#0F111A',
    line_bg = '#1B1E2B',
    fg = '#FFFFFF',
    fg_green = '#14B37D',
    yellow = '#F2F27A',
    cyan = '#87D3F8',
    darkblue = '#0B0D14',
    green = '#14B37D',
    orange = '#f39c12',
    purple = '#c74de',
    magenta = '#703FAF',
    blue = '#3A75C4';
    red = '#FF4151'
}

local icon_list = devicons.get_icons()

local properties = {
  force_inactive = {
    filetypes = {
      'NvimTree',
      'dbui',
      'startify',
      'fugitive',
      'fugitiveblame',
      'packer',
    },
    buftypes = {
      'terminal',
    },
    bufnames = {},
  }
}

local components = {
  left ={ active ={}, inactive = {} },
  mid ={ active ={}, inactive = {} },
}

components.left.active[1] = {
  provider = '█ ',
  hl = {
    fg = colors.cyan,
  }
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
  provider = function()
     local filename = vim.fn.expand("%:t")
     local extension = vim.fn.expand("%:e")
     local res = devicons.get_icon(filename, extension, { default = true })
     return res
   end,
   hl = function()
     local var = {}
     local ext = tostring(vim.fn.expand("%:e"))
     local res = icon_list[ext]
     if res ~= nil then
       var.fg = res.color
     else
       var.fg = "#FFFFFF"
     end
     return var
   end,
   icon = "",
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
  }
}


--[[ components.right.active[1] = {
  provider = 
} ]]

--[[ feline.setup{
  default_bg = colors.bg,
  default_fg = colors.fg,
  colors = colors,
  components = components,
  properties = properties,
} ]]
