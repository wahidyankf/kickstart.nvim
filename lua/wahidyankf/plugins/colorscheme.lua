return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('tokyonight').setup {
        style = 'night',
      }
      -- load the colorscheme here
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
}

-- return {
--   'sainnhe/gruvbox-material',
-- }

-- return {
--   'AbdelrahmanDwedar/awesome-nvim-colorschemes',
--   config = function()
--     require('tokyonight').setup {
--       style = 'night',
--       transparent = true,
--       terminal_colors = true,
--       styles = {
--         sidebars = 'transparent', -- style for sidebars, see below
--         floats = 'transparent',
--       },
--     }
--   end,
-- }
