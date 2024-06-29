return {
  'gbprod/substitute.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local substitute = require 'substitute'

    substitute.setup()

    local keymap = vim.keymap

    keymap.set('n', '<leader>esm', substitute.operator, { desc = 'Substitute with motion' })
    keymap.set('n', '<leader>ess', substitute.line, { desc = 'Substitute line' })
    keymap.set('n', '<leader>esC', substitute.eol, { desc = 'Substitute to end of line' })
    keymap.set('x', '<leader>ess', substitute.visual, { desc = 'Substitute in visual mode' })
  end,
}
