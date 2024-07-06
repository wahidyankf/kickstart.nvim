return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        start_in_insert = true,
        persist_size = true,
        persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
        -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
        direction = 'horizontal',
        size = 15,
      }

      vim.keymap.set('n', '<bs>tt', ':ToggleTerm<CR>', { desc = '[T]oggle terminal' })
      vim.keymap.set('n', '<C-t><C-t>', ':ToggleTerm<CR>', { desc = '[T]oggle terminal' })
    end,
  },
}
