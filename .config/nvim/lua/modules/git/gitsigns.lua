require("gitsigns").setup({
  signs = {
    add = { text = "│" },
    change = { hl = "DiffChange", text = "│" },
    delete = { text = "│" },
    topdelete = { text = "x" },
    changedelete = { hl = "DiffChange", text = "│" },
  },
  on_attach = function(bufnr)
    local gsigns = package.loaded.gitsigns
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]h", function()
      if vim.wo.diff then
        return "]h"
      end
      vim.schedule(function()
        gsigns.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "[h", function()
      if vim.wo.diff then
        return "[h"
      end
      vim.schedule(function()
        gsigns.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    -- Actions
    map({ "n", "v" }, "<leader>hs", gsigns.stage_hunk)
    map({ "n", "v" }, "<leader>hr", gsigns.reset_hunk)
    map("n", "<leader>hS", gsigns.stage_buffer)
    map("n", "<leader>hu", gsigns.undo_stage_hunk)
    map("n", "<leader>hU", gsigns.reset_buffer_index)
    map("n", "<leader>hR", gsigns.reset_buffer)
    map("n", "<leader>hb", function()
      gsigns.blame_line({ full = true })
    end)
    map("n", "<leader>hp", gsigns.preview_hunk)
    map("n", "<leader>hd", gsigns.diffthis)
    map("n", "<leader>hD", function()
      gsigns.diffthis("~")
    end)

    --Text objects
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")

  end,
  preview_config = {
    width = 40,
    height = 12,
    border = "single",
  },
  current_line_blame_opts = {
    virt_text_pos = "right_align",
    delay = 2000,
    ignore_whitespace = true,
  },
  sign_priority = 1,
  update_debounce = 500,
  _threaded_diff = true,
  _extmark_signs = true,
})
