return {
  'ionide/Ionide-vim',
  config = function()
    vim.g['fsharp_display_type'] = 1
    vim.g['fsharp#show_signature_on_cursor_move'] = 1
  end,
}
