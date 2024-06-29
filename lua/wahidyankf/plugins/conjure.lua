return {
  'Olical/conjure',
  ft = { 'clojure', 'fennel' }, -- etc
  lazy = true,
  init = function()
    -- Set configuration options here
    vim.g['conjure#debug'] = false
    vim.g['conjure#client#clojure#nrepl#eval#print_options#length'] = 2000
    vim.g['conjure#filetypes'] = { 'clojure', 'fennel', 'racket' }
    vim.g['conjure#filetype#clojure'] = 'conjure.client.clojure.nrepl'
    vim.g['conjure#filetype#fennel'] = 'conjure.client.fennel.aniseed'
    vim.g['conjure#eval#comment_prefix'] = ';;'
  end,

  -- Optional cmp-conjure integration
  dependencies = { 'PaterJason/cmp-conjure' },
}
