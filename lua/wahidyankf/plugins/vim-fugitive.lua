return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gi', ':Git<CR>', { desc = 'Open vim fug[i]tive' })
  end,
}
