return {
  'andrewferrier/wrapping.nvim',
  config = function()
    local wrapping = require 'wrapping'

    wrapping.setup {
      create_keymaps = false,
      create_autocmds = false,
    }

    vim.keymap.set('n', '<bs>ww', wrapping.toggle_wrap_mode, { desc = 'Toggle [W]rap Mode' })
  end,
}
