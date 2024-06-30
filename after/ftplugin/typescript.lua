vim.keymap.set('n', '<localleader>rr', ':TermExec cmd="deno run %"<CR>', { desc = 'Deno (TS): Quick [R]un current file', silent = true })
