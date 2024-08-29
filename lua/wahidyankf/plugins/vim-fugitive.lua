return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gg', ':Git<CR>', { desc = 'Open [G]it console' })
    vim.keymap.set('n', '<leader>gh', ':Git stash<CR>', { desc = 'Git [S]tash' })
  end,
}
