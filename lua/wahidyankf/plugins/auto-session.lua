return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
    }

    local keymap = vim.keymap

    keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = '[W]orking Session: Restore for cwd' }) -- restore last workspace session for current directory
    keymap.set(
      'n',
      '<leader>ww',
      '<cmd>NvimTreeClose<CR><cmd>DBUI<CR><cmd>DBUIClose<CR><cmd>SessionSave<CR><cmd>echo "Session saved!!"<CR>',
      { desc = '[W]orking Session: Save for auto session root dir' }
    ) -- save workspace session for current working directory

    keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
  end,
}
