--[[
  alpha.lua
  
  This module configures alpha-nvim, a fast and fully customizable greeter for Neovim.
  It creates a beautiful dashboard that appears when you start Neovim without any files.

  Features:
  1. Custom ASCII art header
  2. Quick action buttons for common operations
  3. Lazy-loaded on VimEnter event
  4. Integration with other plugins (NvimTree, Telescope, etc.)

  For more information, see:
  - https://github.com/goolord/alpha-nvim
  - :help alpha.txt
--]]

return {
  -- Plugin: alpha-nvim (Neovim greeter)
  'goolord/alpha-nvim',
  
  -- Load when Neovim starts without opening a file
  event = 'VimEnter',
  
  -- Plugin configuration
  config = function()
    -- Import required modules
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    --[[ Dashboard Header ]]--------------------------------------------------
    -- Set custom ASCII art header
    -- Generated using: https://patorjk.com/software/taag/ (ANSI Shadow)
    dashboard.section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    --[[ Quick Action Buttons ]]--------------------------------------------
    -- Configure dashboard buttons with icons and commands
    -- Icons from: https://www.nerdfonts.com/cheat-sheet
    dashboard.section.buttons.val = {
      dashboard.button('e',       '  > New File',                          '<cmd>ene<CR>'),
      dashboard.button('SPC xx',  '  > Toggle file explorer',              '<cmd>NvimTreeToggle<CR>'),
      dashboard.button('SPC ff',  '󰱼 > Find File',                         '<cmd>Telescope find_files<CR>'),
      dashboard.button('SPC fg',  '  > Find Word (Grep)',                 '<cmd>Telescope live_grep<CR>'),
      dashboard.button('SPC wr',  '󰁯  > Restore Session For Current Directory', '<cmd>SessionRestore<CR>'),
      dashboard.button('q',       ' > Quit NVIM',                         '<cmd>qa<CR>'),
    }

    --[[ Final Setup ]]----------------------------------------------------
    -- Initialize alpha with the dashboard configuration
    alpha.setup(dashboard.opts)

    -- Disable folding in the dashboard buffer for cleaner appearance
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
