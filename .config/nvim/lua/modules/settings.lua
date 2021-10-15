local vim = vim
local opt = vim.opt
local cmd = vim.api.nvim_command

opt.encoding = "utf-8"
opt.showmode = true
opt.termguicolors = true -- Use GUI colors in terminal
cmd("syntax on")

opt.hidden = true -- Hide unloaded buffer
opt.lazyredraw = true -- Don't redraw easily
opt.ttyfast = true -- Performance related
opt.clipboard = { "unnamedplus" } -- Enable system-wide clipboard
opt.mouse = "n" -- Mouse only on normal mode
opt.updatetime = 250 -- Editor update time in ms
opt.foldenable = true -- Prevent folding upon opening file

opt.splitright = true -- Vertical split always on the right
opt.splitbelow = true -- Horizontal split always on the bottom
opt.fillchars = {
  vert = "│",
  fold = " ",
  eob = " ",
  diff = "",
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

opt.list = true -- Invisible chars
opt.listchars = {
  eol = " ",
  tab = "  ",
  extends = "›",
  precedes = "‹",
  trail = "•",
}

opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.joinspaces = true

opt.breakindentopt = "shift:2,min:40,sbr"
opt.lbr = true -- Enable line break
opt.wrap = true

opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smarttab = true
opt.expandtab = true
opt.signcolumn = "auto:1"

opt.laststatus = 2 -- Always show statusline
opt.number = true -- Enable number column
opt.relativenumber = true -- Make number column relative

opt.wildmenu = true -- Use wildmenu
opt.wildoptions = "pum" -- Use popup style for wildmenu
opt.pumheight = 3 -- Set popup height to 3 entry
opt.pumblend = 3 -- Make popup menu translucent

opt.wildignorecase = true
opt.wildignore = {
  ".pdf",
  ".zip",
  ".tar.xz",
  ".rar",
  ".o",
  ".out",
  ".toc",
  ".aux",
  ".lock",
  ".png",
  ".gif",
  ".jpg",
}

opt.shortmess = {
  t = true,
  A = true,
  o = true,
  O = true,
  T = true,
  f = true,
  F = true,
  s = true,
  W = true,
  c = true,
}

opt.completeopt = { "menuone", "noinsert", "noselect" }

opt.formatoptions = {
  ["1"] = true,
  ["2"] = true,
  q = true,
  c = true,
  r = true,
  n = true,
  t = false,
  j = true,
  l = true,
  v = true,
}

opt.swapfile = false -- Tbh swap file are disturbing af
opt.backup = false -- Disable backup file
opt.writebackup = false
opt.undofile = false
opt.autowriteall = true

opt.backspace = { "indent", "eol", "start" }

opt.emoji = false
opt.conceallevel = 2
