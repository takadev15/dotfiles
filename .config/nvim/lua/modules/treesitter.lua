-- nvim-treesitter `main` branch has no module system:
--   * highlighting is provided by Neovim core, started per-buffer with
--     vim.treesitter.start()
--   * indentation is opt-in via the `indentexpr` helper
-- Parsers are managed with :TSInstall / :TSUpdate (see plugins.lua build).

require("nvim-treesitter").setup({})

-- Conditions under which treesitter highlighting should be skipped.
local function ts_disable(buf)
  local fname = vim.api.nvim_buf_get_name(buf)

  -- CSV is better left to the default syntax
  if vim.filetype.match({ filename = fname }) == "csv" then
    return true
  end

  -- Skip very large files (~4 MB)
  local max_filesize = 4000 * 1024
  local ok, stats = pcall(vim.uv.fs_stat, fname)
  if ok and stats and stats.size > max_filesize then
    return true
  end

  return false
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("nvim_treesitter", { clear = true }),
  callback = function(args)
    local buf = args.buf

    if ts_disable(buf) then
      return
    end

    local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
    if not lang then
      return
    end

    -- start() errors if no parser is installed for `lang`; guard it so the
    -- indentexpr is only set when highlighting actually came up.
    if pcall(vim.treesitter.start, buf, lang) then
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
