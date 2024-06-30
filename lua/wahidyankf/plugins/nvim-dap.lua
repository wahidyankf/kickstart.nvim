return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'leoluz/nvim-dap-go',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
  },
  config = function()
    local dap = require 'dap'

    require('dapui').setup()
    require('dap-go').setup()

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
    vim.keymap.set('n', '<space>dg', dap.run_to_cursor, { desc = '[G]o to cursor' })
  end,
}
