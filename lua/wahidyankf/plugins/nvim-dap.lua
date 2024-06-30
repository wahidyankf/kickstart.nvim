return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'leoluz/nvim-dap-go',
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'williamboman/mason.nvim',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    dapui.setup()
    require('dap-go').setup()

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
    vim.keymap.set('n', '<leader>dg', dap.run_to_cursor, { desc = '[G]o to cursor' })
    vim.keymap.set('n', '<leader>dd', ':DapUiToggle<CR>', { desc = 'Toggle debugging [V]iew' })
    vim.keymap.set('n', '<leader>dc', dap.reverse_continue, { desc = '[C]ontinue debugging' })
    vim.keymap.set('n', '<leader>dr', ":lua require('dapui').open({reset = true})<CR>", { desc = '[R]eset debugging' })
  end,
}
