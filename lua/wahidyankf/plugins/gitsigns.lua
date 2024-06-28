-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions

        -- visual mode
        map('v', '<leader>gsh', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>grh', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })

        -- normal mode
        map('n', '<leader>gsh', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>gsb', gitsigns.stage_buffer, { desc = 'git [s]tage buffer' })

        map('n', '<leader>grh', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>grb', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })

        map('n', '<leader>gvh', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })

        map('n', '<leader>guh', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })

        map('n', '<leader>gbl', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>gbb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })

        map('n', '<leader>gdd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>gdl', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })

        map('n', '<leader>gee', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
}
