local telescope = require("telescope")
local action = require("telescope.actions")
local themes = require("telescope.themes")

local default_ivy = {
  theme = "ivy",
  layout_config = { height = 13 },
}

telescope.setup({
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 130,
      },
      horizontal = {
        mirror = false,
        width = 0.8,
      },
      vertical = {
        mirror = false,
      },
    },
    path_display = { "truncate" },
    wrap_results = true,
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = " ",
    selection_caret = " ",
    color_devicons = true,
    file_ignore_patterns = {
      "__pycache__/*",
      "__init__.py",
      "%.env",
      "node_modules/*",
      "scratch/.*",
      "%.dll",
      "go/pkg/*",
    },
    extensions = {
      ["fzf"] = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case",
      },
      -- ["ui-select"] = themes.get_dropdown({
      --   initial_mode = "normal",
      --   layout_config = {
      --     height = 12,
      --     width = 60,
      --   },
      -- }),
    },
    use_less = false,
    mappings = {
      i = {
        ["<C-k>"] = action.move_selection_previous,
        ["<C-j>"] = action.move_selection_next,
        ["<C-o>"] = action.toggle_selection,
        ["<C-O>"] = action.toggle_all,
        ["<esc>"] = action.close,
      },
    },
  },
  pickers = {
    find_files = {
      layout_strategy = "flex",
      layout_config = {
        flex = {
          flip_columns = 130,
        },
        horizontal = {
          mirror = false,
          width = 0.8,
        },
        vertical = {
          mirror = false,
          preview_height = 0.65,
        },
      },
    },
    lsp_code_actions = {
      theme = "cursor",
      layout_config = { width = 50 },
    },
    arecibo = {
      theme = "dropdown",
      layout_config = { height = 20 },
    },
    diagnostics = default_ivy,
    lsp_definitions = default_ivy,
    lsp_references = default_ivy,
  },
})

-- Load extensions
-- telescope.load_extension("ui-select")
telescope.load_extension("bibtex")
telescope.load_extension("fzf")
-- telescope.load_extension("dotfiles")

