vim.keymap.set('n', '<localleader>rr', ':split term://deno run %<CR>', { desc = 'Deno (TS): [R]un current file', silent = true })
