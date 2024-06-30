vim.keymap.set('n', '<localleader>rr', ':TermExec cmd="javac % && java % && rm %:r.class"<CR>', { silent = true, desc = 'Java: Quick [R]un current file' })
