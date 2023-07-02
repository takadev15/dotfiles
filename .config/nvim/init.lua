local vim = vim
-- Set leader to space
vim.g.mapleader = " "

-- neovim options
require("modules.settings")

-- plugins
require("modules.plugins")

-- keymapping
require("modules.keymaps")

-- git helper
require("modules.git")

-- theme
require("modules.theme")

-- Special plugin(impatient)
-- require('impatient')

