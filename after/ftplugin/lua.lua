vim.keymap.set('n', '<localleader>rs', ':source %<CR>', { desc = 'Lua: [S]ource current file', silent = false })
vim.keymap.set('n', '<localleader>rr', ':split term://lua %<CR>', { desc = 'Lua: [R]un current file', silent = false })
