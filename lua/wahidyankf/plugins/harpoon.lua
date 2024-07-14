return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon.setup {}

    vim.keymap.set('n', '<leader>um', require('harpoon.mark').add_file, { desc = '[M]ark file (add to Harpoon)' })
    vim.keymap.set('n', '<leader>fp', ':Telescope harpoon marks<CR>', { desc = 'Find [P]inned file' })
  end,
}
