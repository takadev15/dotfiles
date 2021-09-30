-- The setup config table shows all available config options with their default values:
require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "Neovim",                   -- Text displayed when hovered over the Neovim image
    main_image          = "file",                     -- Main image display (either "neovim" or "file")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer
    git_commit_text     = "Committing changes",       -- Format string rendered when commiting changes in git
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer
    workspace_text      = "Working on %s",            -- Workspace format string (either string or function(git_project_name: string|nil, buffer: string): string)
})
