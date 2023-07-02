local util = require("luasnip.util.util")
local node_util = require("luasnip.nodes.util")
local npairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")

local M = {}

M.load_luasnip = function()
  require("luasnip").config.setup({
    parser_nested_assembler = function(_, snippet)
      local select = function(snip, no_move)
        snip.parent:enter_node(snip.indx)
        -- upon deletion, extmarks of inner nodes should shift to end of
        -- placeholder-text.
        for _, node in ipairs(snip.nodes) do
          node:set_mark_rgrav(true, true)
        end

        -- SELECT all text inside the snippet.
        if not no_move then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
          node_util.select_node(snip)
        end
      end
      function snippet:jump_into(dir, no_move)
        if self.active then
          -- inside snippet, but not selected.
          if dir == 1 then
            self:input_leave()
            return self.next:jump_into(dir, no_move)
          else
            select(self, no_move)
            return self
          end
        else
          -- jumping in from outside snippet.
          self:input_enter()
          if dir == 1 then
            select(self, no_move)
            return self
          else
            return self.inner_last:jump_into(dir, no_move)
          end
        end
      end

      -- this is called only if the snippet is currently selected.
      function snippet:jump_from(dir, no_move)
        if dir == 1 then
          return self.inner_first:jump_into(dir, no_move)
        else
          self:input_leave()
          return self.prev:jump_into(dir, no_move)
        end
      end

      return snippet
    end,
    history = false,
    delete_check_events = "InsertLeave",
    region_check_events = "InsertEnter",
  })
  require("luasnip.loaders.from_vscode").lazy_load()
end

M.load_autopairs = function()
  npairs.setup({
    -- disable_filetype = { "TelescopePrompt" },
    -- enable_moveright = true,
    -- enable_afterquota = true,
    -- enable_check_bracket_line = true,
    -- ignored_next_char = "[%w%.]",
    check_ts = true,
  })

  npairs.add_rules({
    rule("$$","$$","tex"):with_pair(function(opts)
      print(vim.inspect(opts))
        if opts.line=="aa $$" then
        -- don't add pair on that line
        return false
      end
    end),
     })
end

return M
