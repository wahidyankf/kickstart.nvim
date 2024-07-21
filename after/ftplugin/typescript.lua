local run_current_file = '"deno run %"'

vim.keymap.set('n', '<localleader>rrr', ':TermExec cmd=' .. run_current_file .. '<CR>', { desc = 'Deno: Quick [R]un current file', silent = true })
vim.keymap.set(
  'n',
  '<localleader>rrx',
  ':TermExec cmd=' .. run_current_file .. 'direction=horizontal<CR>',
  { desc = 'Deno: Quick [R]un current file', silent = true }
)
vim.keymap.set(
  'n',
  '<localleader>rrv',
  ':TermExec cmd=' .. run_current_file .. 'direction=vertical<CR>',
  { desc = 'Deno: Quick [R]un current file', silent = true }
)
vim.keymap.set('n', '<localleader>rrt', ':TermExec cmd=' .. run_current_file .. 'direction=tab<CR>', { desc = 'Deno: Quick [R]un current file', silent = true })
vim.keymap.set(
  'n',
  '<localleader>rrf',
  ':TermExec cmd=' .. run_current_file .. 'direction=float<CR>',
  { desc = 'Deno: Quick [R]un current file', silent = true }
)
