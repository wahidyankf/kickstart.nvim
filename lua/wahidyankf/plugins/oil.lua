return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup()
    vim.keymap.set('n', '<bs>ee', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
