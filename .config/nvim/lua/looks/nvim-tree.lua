local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end
local set = vim.g

set.nvim_tree_side = 'left'
set.nvim_tree_ignore = {".git", ".cache", "node_modules", ".cache", "__pycache__"}
set.nvim_tree_gitignore = 1
set.nvim_tree_auto_open = 1 --0 by default, opens the tree when typing `vim $DIR` or `vim`
set.nvim_tree_auto_close = 1 --0 by default, closes the tree when it's the last window
set.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } --empty by default, don't auto open tree on specific filetypes.
set.nvim_tree_quit_on_open = 1 --0 by default, closes the tree when you open a file
set.nvim_tree_follow = 1 --0 by default, this option allows the cursor to be updated when entering a buffer
set.nvim_tree_indent_markers = 1 --0 by default, this option shows indent markers when folders are open
set.nvim_tree_hide_dotfiles = 1 --0 by default, this option hides files and folders starting with a dot `.`
set.nvim_tree_git_hl = 1 --0 by default, will enable file highlight for git attributes (can be used without the icons).
set.nvim_tree_highlight_opened_files = 1 --0 by default, will enable folder and file icon highlight for opened files/directories.
set.nvim_tree_root_folder_modifier = ':~' --This is the default. See :help filename-modifiers for more options
set.nvim_tree_tab_open = 1 --0 by default, will open the tree when entering a new tab and the tree was previously open
set.nvim_tree_auto_resize = 0 --1 by default, will resize the tree to its saved width when opening a file
set.nvim_tree_disable_netrw = 0 --1 by default, disables netrw
set.nvim_tree_hijack_netrw = 0 --1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
set.nvim_tree_add_trailing = 1 --0 by default, append a trailing slash to folder names
set.nvim_tree_group_empty = 1 --0 by default, compact folders that only contain a single folder into one node in the file tree
set.nvim_tree_lsp_diagnostics = 1 --0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
set.nvim_tree_disable_window_picker = 1 --0 by default, will disable the window picker.
set.nvim_tree_hijack_cursor = 0 --1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
set.nvim_tree_icon_padding = ' ' --one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
set.nvim_tree_update_cwd = 1 --0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir se
set.nvim_tree_show_icons = {
    git= 1,
    folders= 1,
    files= 1,
    folder_arrows= 1,
  }
set.nvim_tree_lsp_diagnostics = 0
    
set.nvim_tree_special_files = {README=1, Makefile= 1, MAKEFILE= 1 }
set.nvim_tree_icon_padding = " "
set.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
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
gmap('n','<leader>fd',[[<cmd> NvimTreeToggle<CR>]])
