vim.keymap.set('n', '<localleader>rr', ':split term://go run %<cr>', { silent = true, desc = 'Go: [R]un current file' })
