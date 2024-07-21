return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'horizontal', -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
        open_mapping = { [[<C-t><C-t>]] },
        persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
        persist_size = true,
        start_in_insert = true,
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
      }

      vim.keymap.set('n', '<C-t><C-t>', ':ToggleTerm<CR>', { desc = '[T]oggle terminal defaul[T]' })
      vim.keymap.set('n', '<bs>tt', ':ToggleTerm<CR>', { desc = '[T]oggle terminal defaul[T]' })
      vim.keymap.set('n', '<C-t><C-f>', ':ToggleTerm direction=float name=default-float<CR>', { desc = 'Toggle terminal [F]loat' })
      vim.keymap.set('n', '<bs>tf', ':ToggleTerm direction=float name=default-float<CR>', { desc = 'Toggle terminal [F]loat' })
      vim.keymap.set('n', '<C-t><C-v>', ':ToggleTerm direction=vertical name=default-vertical<CR>', { desc = 'Toggle terminal [V]ertical' })
      vim.keymap.set('n', '<bs>tv', ':ToggleTerm direction=vertical name=default-vertical<CR>', { desc = 'Toggle terminal [V]ertical' })
      vim.keymap.set('n', '<C-t><C-x>', ':ToggleTerm direction=horizontal name=default-horizontal<CR>', { desc = 'Toggle terminal horizontal ([X])' })
      vim.keymap.set('n', '<bs>tx', ':ToggleTerm direction=horizontal name=default-horizontal<CR>', { desc = 'Toggle terminal horizontal ([X])' })
      vim.keymap.set('n', '<C-t><C-b>', ':ToggleTerm direction=tab name=default-tab<CR>', { desc = 'Toggle terminal Ta[B]' })
      vim.keymap.set('n', '<bs>tb', ':ToggleTerm direction=tab name=default-tab<CR>', { desc = 'Toggle terminal Ta[B]' })
    end,
  },
}
