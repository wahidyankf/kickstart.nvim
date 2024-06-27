return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
    }

    local keymap = vim.keymap

    keymap.set('n', '<bs>wr', '<cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- restore last workspace session for current directory
    keymap.set('n', '<bs>ww', '<cmd>SessionSave<CR><cmd>echo "Session saved!!"<CR>', { desc = 'Save session for auto session root dir' }) -- save workspace session for current working directory

    keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
  end,
}
