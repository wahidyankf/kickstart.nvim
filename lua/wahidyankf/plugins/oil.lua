return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      default_file_explorer = false,
      columns = { 'icon', 'permission', 'size', 'mtime' },
    }
    vim.keymap.set('n', '<leader>xe', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
