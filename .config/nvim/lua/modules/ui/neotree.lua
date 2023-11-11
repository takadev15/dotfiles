require("neo-tree").setup({
  close_if_last_window = true,
  default_component_configs = {
    git_status = {
      symbols = {
        added = "✚",
        modified = "⏺",
      },
      align = "right",
    },
    modified = {
      symbol = "⏺",
    },
  },
  enable_diagnostics = true,
  enable_git_status = false,
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd("set cursorlineopt=both")
        vim.cmd("hi Cursor blend=100")
      end,
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        vim.cmd("hi Cursor blend=0")
        vim.cmd("set cursorlineopt=number")
      end,
    },
  },
  filesystem = {
    hijack_netrw_behavior = "disabled",
    filtered_items = {
      hide_by_name = {
        "node_modules",
        "__pycache__",
      },
    },
  },
  popup_border_style = "double",
  sort_case_insensitive = true,
  use_libuv_file_watcher = true,
  window = {
    mappings = {
      -- ["<cr>"] = "open_with_window_picker",
      ["<cr>"] = "open",
      ["s"] = "none",
      ["S"] = "none",
      ["f"] = "none",
      [","] = "navigate_up",
      ["<c-t>"] = "open_tabnew",
      o = function(state)
        vim.cmd("silent !xdg-open " .. state.tree:get_node():get_id())
      end,
      ["<C-z>"] = "clear_filter",
    },
    width = 35,
  },
})
