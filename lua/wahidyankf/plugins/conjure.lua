return {
  'Olical/conjure',
  ft = { 'clojure', 'fennel', 'python' }, -- etc
  lazy = true,
  init = function()
    -- Set configuration options here
    vim.g['conjure#debug'] = true
  end,

  -- Optional cmp-conjure integration
  dependencies = { 'PaterJason/cmp-conjure' },
}
