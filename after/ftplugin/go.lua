vim.keymap.set('n', '<localleader>rr', ':TermExec cmd="go run %"<CR>', { silent = true, desc = 'Go: Quick [R]un current file' })
