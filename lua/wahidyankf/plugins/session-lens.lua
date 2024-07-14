return {
  'rmagatti/session-lens',
  dependencies = {
    'rmagatti/auto-session',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('session-lens').setup {}
    vim.keymap.set('n', '<leader>wl', ':Telescope session-lens search_session<CR>', { desc = '[L]ist saved sessions' })
  end,
}
