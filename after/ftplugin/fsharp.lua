local run_current_file = '"dotnet fsi %"'

vim.keymap.set('n', '<localleader>rrr', ':TermExec cmd=' .. run_current_file .. '<CR>', { desc = 'F#: Quick [R]un current file', silent = true })
vim.keymap.set(
  'n',
  '<localleader>rrx',
  ':TermExec cmd=' .. run_current_file .. 'direction=horizontal<CR>',
  { desc = 'F#: Quick [R]un current file', silent = true }
)
vim.keymap.set(
  'n',
  '<localleader>rrv',
  ':TermExec cmd=' .. run_current_file .. 'direction=vertical<CR>',
  { desc = 'F#: Quick [R]un current file', silent = true }
)
vim.keymap.set('n', '<localleader>rrt', ':TermExec cmd=' .. run_current_file .. 'direction=tab<CR>', { desc = 'F#: Quick [R]un current file', silent = true })
vim.keymap.set(
  'n',
  '<localleader>rrf',
  ':TermExec cmd=' .. run_current_file .. 'direction=float<CR>',
  { desc = 'F#: Quick [R]un current file', silent = true }
)

-- Disable codelens for F# files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "fsharp",
  callback = function()
    vim.lsp.codelens.refresh = function() end
  end,
})