
-- Statusline
local gl = require('galaxyline')
local gls = gl.section
local extension = require('galaxyline.provider_extensions')

gl.short_line_list = {
    'LuaTree',
    'vista',
    'dbui',
    'startify',
    'term',
    'nerdtree',
    'fugitive',
    'fugitiveblame',
    'plug'
}

local colors = {  
    bg = '#282828',
    line_bg = '#45403d',
    fg = '#d4be98',
    fg_green = '#7daea3',

    yellow = '#d8a657',
    cyan = '#89b482',
    darkblue = '#081633',
    green = '#a9b665',
    orange = '#e78a4e',
    purple = '#d3869b',
    magenta = '#c678dd',
    blue = '#61afef';
    red = '#ea6962'
}

local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end


local function get_coc_lsp()
  local status = vim.fn['coc#status']()
  if not status or status == '' then
      return ''
  end
  return lsp_status(status)
end

function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_lsp()
    end
  return ''
end

local function get_current_func()
  local has_func, func_name = pcall(vim.fn.nvim_buf_get_var,0,'coc_current_function')
  if not has_func then return end
      return func_name
  end

function get_function_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_current_func()
    end
  return ''
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end

CocStatus = get_diagnostic_info
CocFunc = get_current_func
TrailingWhiteSpace = trailing_whitespace

function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local condition = require('galaxyline.condition')

gls.left[1] = {
  FirstElement = {
    provider = function() return ' ' end,
    highlight = {colors.blue,colors.line_bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local alias = {
          n = 'NORMAL',
          i = 'INSERT',
          c= 'COMMAND',
          V= 'VISUAL',
          [''] = 'VISUAL',
          v ='VISUAL',
          c  = 'COMMAND-LINE',
          ['r?'] = ':CONFIRM',
          rm = '--MORE',
          R  = 'REPLACE',
          Rv = 'VIRTUAL',
          s  = 'SELECT',
          S  = 'SELECT',
          ['r']  = 'HIT-ENTER',
          [''] = 'SELECT',
          t  = 'TERMINAL',
          ['!']  = 'SHELL',
      }
      local mode_color = {
          n = colors.green,
          i = colors.blue,v=colors.magenta,[''] = colors.blue,V=colors.blue,
          c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
          [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
          cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
          ['!']  = colors.green,t = colors.green,
          c  = colors.purple,
          ['r?'] = colors.red,
          ['r']  = colors.red,
          rm = colors.red,
          R  = colors.yellow,
          Rv = colors.magenta,
      }
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
      return " |"
    end,
    highlight = {colors.red,colors.line_bg,'bold'},
  },
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
  },
}
gls.left[4] = {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.line_bg,'bold'}
  }
}

gls.left[5] = {
  GitIcon = {
   provider = function() return '  ' end,
   condition = condition.check_git_workspace,
   highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {'#8FBCBB',colors.line_bg,'bold'},
  }
}

gls.left[7] = {
  LeftEnd = {
    provider = function() return ' ' end,
    separator = ' ',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.line_bg,colors.line_bg}
  }
}

 gls.left[8] = {
  Space = {
    provider = function () return ' ' end,
    highlight = {colors.bg, colors.bg}
  }
 }



local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.right[1] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green},
  }
}
gls.right[2] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange},
  }
}
gls.right[3] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red},
  }
}

gls.right[4] = {
    TrailingWhiteSpace = {
     provider = TrailingWhiteSpace,
     icon = '  ',
     highlight = {colors.yellow,colors.bg},
    }
}

gls.right[5] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.right[6] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.right[7] = {
    CocStatus = {
     provider = CocStatus,
     highlight = {colors.green,colors.bg},
     icon = '  🗱'
    }
}

gls.right[8] = {
  CocFunc = {
    provider = CocFunc,
    icon = '  λ ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.right[9] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.blue},
    highlight = {colors.fg},
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
    provider = 'FileTypeName',
    separator = ' ',
    condition = has_file_type,
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.fg,colors.bg}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider = function()
      local fileinfo = require("galaxyline.provider_fileinfo")
      local fname = fileinfo.get_current_file_name()
      for _, v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ""
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.bg}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = ' ',
    condition = has_file_type,
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.fg,colors.bg}
  }
}
