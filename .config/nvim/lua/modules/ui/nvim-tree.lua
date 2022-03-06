local set = vim.g
local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

-- set.nvim_tree_auto_open = 1 --0 by default, opens the tree when typing `vim $DIR` or `vim`
set.nvim_tree_auto_ignore_ft = { "startify", "dashboard" } --empty by default, don't auto open tree on specific filetypes.
set.nvim_tree_quit_on_open = 1 --0 by default, closes the tree when you open a file
set.nvim_tree_indent_markers = 1 --0 by default, this option shows indent markers when folders are open
set.nvim_tree_git_hl = 1 --0 by default, will enable file highlight for git attributes (can be used without the icons).
set.nvim_tree_root_folder_modifier = ":~" --This is the default. See :help filename-modifiers for more options
set.nvim_tree_add_trailing = 1 --0 by default, append a trailing slash to folder names
set.nvim_tree_group_empty = 1 --0 by default, compact folders that only contain a single folder into one node in the file tree
set.nvim_tree_disable_window_picker = 1 --0 by default, will disable the window picker.
set.nvim_tree_icon_padding = " " --one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
set.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
set.nvim_tree_special_files = { README = 1, Makefile = 1, MAKEFILE = 1 }
set.nvim_tree_icon_padding = " "
set.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    enable = true,
    ignore = true,
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "?",
  },
  folder = {
    default = "",
    open = "",
  },
}

-- keymaps
local tree_cb = require("nvim-tree.config").nvim_tree_callback
local keymaps = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
  { key = "<C-v>", cb = tree_cb("vsplit") },
  { key = "<C-x>", cb = tree_cb("split") },
  { key = "<C-t>", cb = tree_cb("tabnew") },
  { key = "<", cb = tree_cb("prev_sibling") },
  { key = ">", cb = tree_cb("next_sibling") },
  { key = "P", cb = tree_cb("parent_node") },
  { key = "<BS>", cb = tree_cb("close_node") },
  { key = "<S-CR>", cb = tree_cb("close_node") },
  { key = "<Tab>", cb = tree_cb("preview") },
  { key = "K", cb = tree_cb("first_sibling") },
  { key = "J", cb = tree_cb("last_sibling") },
  { key = "I", cb = tree_cb("toggle_ignored") },
  { key = "H", cb = tree_cb("toggle_dotfiles") },
  { key = "R", cb = tree_cb("refresh") },
  { key = "a", cb = tree_cb("create") },
  { key = "d", cb = tree_cb("remove") },
  { key = "r", cb = tree_cb("rename") },
  { key = "<C-r>", cb = tree_cb("full_rename") },
  { key = "x", cb = tree_cb("cut") },
  { key = "c", cb = tree_cb("copy") },
  { key = "p", cb = tree_cb("paste") },
  { key = "y", cb = tree_cb("copy_name") },
  { key = "Y", cb = tree_cb("copy_path") },
  { key = "gy", cb = tree_cb("copy_absolute_path") },
  { key = "[c", cb = tree_cb("prev_git_item") },
  { key = "]c", cb = tree_cb("next_git_item") },
  { key = "-", cb = tree_cb("dir_up") },
  { key = "S", cb = tree_cb("system_open") },
  { key = "q", cb = tree_cb("close") },
  { key = "g?", cb = tree_cb("toggle_help") },
}

gmap("n", "<leader>fd", [[<cmd> NvimTreeToggle<CR>]])

require("nvim-tree").setup({
  -- diagnostics = {
  --   enable = true,
  --   icons = {
  --     errors = " ",
  --   },
  -- },
  auto_close = true,
  auto_open = true,
  open_on_tab = true,
  hijack_cursor = 0,
  hijack_netrw = false,
  disable_netrw = false,
  update_focused_file = {
    enable = false,
    update_cwd = true,
    ignore_list = {},
  },
  view = {
    side = "left",
    mappings = {
      list = keymaps,
    },
  },
  filters = {
    dotfiles = true,
	  custom = {".git", ".cache", "node_modules", "__pycache__"}
  },
})
