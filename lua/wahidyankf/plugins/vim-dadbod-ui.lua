-- see https://github.com/tpope/vim-dadbod for more info

return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_save_location = '~/Dropbox/wkf-dbs/db_ui_queries'

    vim.keymap.set('n', '<leader>bv', ':DBUIToggle<CR>', { desc = 'Toggle DB [V]iew' })
    vim.keymap.set('n', '<leader>bc', ':DBUIAddConnection<CR>', { desc = 'Toggle DB [V]iew' })
  end,
}
