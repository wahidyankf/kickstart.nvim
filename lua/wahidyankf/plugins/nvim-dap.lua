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

    vim.keymap.set('n', '<leader>dd', dap.continue, { desc = 'Run [D]ebugging' })
    vim.keymap.set('n', '<leader>dq', dap.close, { desc = 'Terminate debugging process [Q]' })
    vim.keymap.set('n', '<leader>dbb', dap.toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
    vim.keymap.set('n', '<leader>dbr', dap.clear_breakpoints, { desc = 'Clea[R] all breakpoint' })
    vim.keymap.set('n', '<leader>dbl', dap.clear_breakpoints, { desc = '[L]ist all breakpoint' })
    vim.keymap.set('n', '<leader>dg', dap.run_to_cursor, { desc = '[G]o to cursor' })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[C]ontinue debugging' })
    vim.keymap.set('n', '<leader>dso', dap.step_out, { desc = 'Step [O]ut' })
    vim.keymap.set('n', '<leader>dsb', dap.step_back, { desc = 'Step [B]ack' })
    vim.keymap.set('n', '<leader>dsi', dap.step_into, { desc = 'Step [I]nto' })
    vim.keymap.set('n', '<leader>dsv', dap.step_over, { desc = 'Step O[V]er' })
    vim.keymap.set('n', '<leader>dr', dap.restart, { desc = '[R]estart debugging' })

    -- vim.keymap.set('n', '<leader>dr', ":lua require('dapui').open({reset = true})<CR>", { desc = '[R]eset debugging' })
  end,
}
