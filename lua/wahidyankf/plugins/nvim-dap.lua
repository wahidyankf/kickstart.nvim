return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'leoluz/nvim-dap-go',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'
    local dap_virtual_text = require 'nvim-dap-virtual-text'
    local dapgo = require 'dap-go'

    dapui.setup()
    dapgo.setup()
    dap_virtual_text.setup {
      commented = true,
      show_stop_reason = true,
    }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
    vim.keymap.set('n', '<leader>dq', dap.terminate, { desc = 'Terminate debugging process [Q]' })
    vim.keymap.set('n', '<leader>dg', dap.run_to_cursor, { desc = '[G]o to cursor' })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[C]ontinue debugging' })
    vim.keymap.set('n', '<leader>dr', ":lua require('dapui').open({reset = true})<CR>", { desc = '[R]eset debugging' })
  end,
}
