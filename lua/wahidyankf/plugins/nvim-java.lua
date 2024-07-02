return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup {}
    require('lspconfig').jdtls.setup {}
  end,
}

-- NOTE: related issues -> https://github.com/nvim-java/nvim-java/issues/212
