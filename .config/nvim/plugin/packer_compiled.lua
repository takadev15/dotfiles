-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/taka15/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/taka15/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/taka15/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/taka15/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/taka15/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/Comment.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25modules.ui.dashboard\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/alpha-nvim"
  },
  ["asyncrun.vim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28modules.misc.async_conf\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["comfortable-motion.vim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/comfortable-motion.vim"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20modules.ui.line\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    config = { "\27LJ\2\n¼\3\0\0\2\1\v\0%-\0\0\0009\0\0\0+\1\2\0=\1\1\0-\0\0\0009\0\0\0'\1\3\0=\1\2\0-\0\0\0009\0\0\0+\1\1\0=\1\1\0-\0\0\0009\0\0\0+\1\2\0=\1\4\0-\0\0\0009\0\0\0+\1\2\0=\1\5\0-\0\0\0009\0\0\0)\1\20\0=\1\6\0-\0\0\0009\0\0\0)\0012\0=\1\a\0-\0\0\0009\0\0\0005\1\t\0=\1\b\0-\0\0\0009\0\0\0+\1\2\0=\1\n\0K\0\1\0\0\0(git_messenger_popup_content_margins\1\0\1\vborder\vsingle$git_messenger_floating_win_opts\"git_messenger_max_popup_width#git_messenger_max_popup_height$git_messenger_always_into_popup(git_messenger_into_popup_after_show\fcurrent\31git_messenger_include_diff(git_messenger_close_on_cursor_moved\6g\0" },
    keys = { { "", "<leader>gm" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/opt/git-messenger.vim"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25modules.git.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/go.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["magma-nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/magma-nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21default_mappings\2\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/marks.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  neogen = {
    config = { "\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/neogen"
  },
  neogit = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/neogit"
  },
  neorg = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23modules.misc.neorg\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/opt/neorg"
  },
  ["neorg-telescope"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/neorg-telescope"
  },
  ["neuron.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/neuron.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26modules.ui.bufferline\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27modules.completion.cmp\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-gps"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16modules.lsp\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nb\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\22background_colour\f#000000\vstages\nslide\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25modules.ui.nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "neorg" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    commands = { "Octo" },
    config = { "\27LJ\2\nh\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\19default_remote\1\0\0\1\4\0\0\fupsteam\vorigin\tmain\nsetup\tocto\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/opt/octo.nvim"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26modules.misc.discordo\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\n¨\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2\ftimeout\3–\1\fenabled\2\1\0\3\28result_split_horizontal\1\20jump_to_request\1\26skip_ssl_verification\1\nsetup\14rest-nvim\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/rest.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-asynctasks.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/telescope-asynctasks.nvim"
  },
  ["telescope-bibtex.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/telescope-bibtex.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-heading.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fheading\19load_extension\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/opt/telescope-heading.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-npm.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/telescope-npm.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29modules.ui.todo-comments\frequire\0" },
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/vim-autoformat"
  },
  ["vim-dadbod"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/opt/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-ultest"] = {
    commands = { "Ultest", "UltestNearest", "UltestDebug", "UltestDebugNearest" },
    loaded = false,
    needs_bufread = false,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/opt/vim-ultest"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/taka15/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26modules.ui.bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27modules.completion.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20modules.ui.line\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29modules.ui.todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23modules.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26modules.misc.discordo\frequire\0", "config", "presence.nvim")
time([[Config for presence.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25modules.ui.dashboard\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16modules.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: asyncrun.vim
time([[Config for asyncrun.vim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28modules.misc.async_conf\frequire\0", "config", "asyncrun.vim")
time([[Config for asyncrun.vim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nb\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\22background_colour\f#000000\vstages\nslide\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25modules.ui.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25modules.git.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21default_mappings\2\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: rest.nvim
time([[Config for rest.nvim]], true)
try_loadstring("\27LJ\2\n¨\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2\ftimeout\3–\1\fenabled\2\1\0\3\28result_split_horizontal\1\20jump_to_request\1\26skip_ssl_verification\1\nsetup\14rest-nvim\frequire\0", "config", "rest.nvim")
time([[Config for rest.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd neorg ]]

-- Config for: neorg
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23modules.misc.neorg\frequire\0", "config", "neorg")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ultest lua require("packer.load")({'vim-ultest'}, { cmd = "Ultest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestNearest lua require("packer.load")({'vim-ultest'}, { cmd = "UltestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestDebug lua require("packer.load")({'vim-ultest'}, { cmd = "UltestDebug", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestDebugNearest lua require("packer.load")({'vim-ultest'}, { cmd = "UltestDebugNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Octo lua require("packer.load")({'octo.nvim'}, { cmd = "Octo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>gm <cmd>lua require("packer.load")({'git-messenger.vim'}, { keys = "<lt>leader>gm", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown', 'telescope-heading.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType sql ++once lua require("packer.load")({'vim-dadbod'}, { ft = "sql" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/taka15/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/taka15/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/taka15/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
