
require("neorg").setup{
  load = {
    ["core.defaults"] = {},
    ["core.integrations.telescope"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          default = "~/dir/data",
          personal = "~/dir/data/note/journal",
          uni = "~/dir/data/class",
          gtd = "~/dir/data/note/todo"
        },
        autodetect = true,
        autochdir = true,
      },
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "gtd"
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      },
    },
    ["core.keybinds"] = { -- Configure core.keybinds
       config = {
       default_keybinds = true, -- Generate the default keybinds
       neorg_leader = "<Leader>o" -- This is the default if unspecified
      },
    },
    ["core.norg.concealer"] = {
      config = {
        icons = {
          heading = {
            level_1 = {
              icon = "◉",
            },
            level_2 = {
              icon = " ◎",
            },
            level_3 = {
              icon = "  ○",
            },
            level_4 = {
              icon = "   ∙",
            },
          },
        },
      },
    },
  },
}
