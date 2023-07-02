require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "今、働いている", -- Text displayed when hovered over the Neovim image
    main_image          = "file",                   -- Main image display (either "neovim" or "file")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = {{label = "Who Am I 🤨", url = "https://github.com/takadev15"}},                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`
    show_time           = false,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "This User is currently Busy :p",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "This User is currently Busy :p",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "忙しいです〜",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "忙しいです〜",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "This User is currently Busy :p",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "忙しいです〜",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
})
