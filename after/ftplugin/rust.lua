local run_current_project = '"cargo run"'

vim.keymap.set(
  'n',
  '<localleader>rrr',
  ':TermExec cmd=' .. run_current_project .. '<CR>',
  { desc = 'Go: Quick [R]un current project in terminal', silent = true }
)
vim.keymap.set(
  'n',
  '<localleader>rrx',
  ':TermExec cmd=' .. run_current_project .. 'direction=horizontal<CR>',
  { desc = 'Go: Quick [R]un current project in terminal split', silent = true }
)
vim.keymap.set(
  'n',
  '<localleader>rrv',
  ':TermExec cmd=' .. run_current_project .. 'direction=vertical<CR>',
  { desc = 'Go: Quick [R]un current project in terminal vsplit', silent = true }
)
vim.keymap.set(
  'n',
  '<localleader>rrt',
  ':TermExec cmd=' .. run_current_project .. 'direction=tab<CR>',
  { desc = 'Go: Quick [R]un current project in terminal new tab', silent = true }
)
vim.keymap.set(
  'n',
  '<localleader>rrf',
  ':TermExec cmd=' .. run_current_project .. 'direction=float<CR>',
  { desc = 'Go: Quick [R]un current project in terminal float', silent = true }
)
