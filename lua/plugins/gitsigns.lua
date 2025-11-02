return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gitsigns.next_hunk() end)
          return "<Ignore>"
        end, { expr = true })
        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gitsigns.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "<leader>hs", function() gitsigns.stage_hunk() end)
        map("n", "<leader>hr", function() gitsigns.reset_hunk() end)
        map("n", "<leader>hp", function() gitsigns.preview_hunk() end)
        map("n", "<leader>hb", function() gitsigns.blame_line() end)
        map("n", "<leader>hS", function() gitsigns.stage_buffer() end)
        map("n", "<leader>hR", function() gitsigns.reset_buffer() end)
        map("n", "<leader>hu", function() gitsigns.undo_stage_hunk() end)
        map("n", "<leader>hd", function() gitsigns.diffthis() end)

        -- Text objects
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    })
  end,
}
