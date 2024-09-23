return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'horizontal', -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
        open_mapping = { [[<C-t><C-t>]] },
        persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
        persist_size = true,
        start_in_insert = true,
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
      }

      vim.keymap.set('n', '<C-t><C-t>', ':ToggleTerm<CR>', { desc = '[T]oggle terminal defaul[T]' })
      vim.keymap.set('n', '<bs>tt', ':ToggleTerm<CR>', { desc = '[T]oggle terminal defaul[T]' })
      vim.keymap.set('n', '<C-t><C-f>', ':ToggleTerm direction=float name=default-float<CR>', { desc = 'Toggle terminal [F]loat' })
      vim.keymap.set('n', '<bs>tf', ':ToggleTerm direction=float name=default-float<CR>', { desc = 'Toggle terminal [F]loat' })
      vim.keymap.set('n', '<C-t><C-v>', ':ToggleTerm direction=vertical name=default-vertical<CR>', { desc = 'Toggle terminal [V]ertical' })
      vim.keymap.set('n', '<bs>tv', ':ToggleTerm direction=vertical name=default-vertical<CR>', { desc = 'Toggle terminal [V]ertical' })
      vim.keymap.set('n', '<C-t><C-x>', ':ToggleTerm direction=horizontal name=default-horizontal<CR>', { desc = 'Toggle terminal horizontal ([X])' })
      vim.keymap.set('n', '<bs>tx', ':ToggleTerm direction=horizontal name=default-horizontal<CR>', { desc = 'Toggle terminal horizontal ([X])' })
      vim.keymap.set('n', '<C-t><C-b>', ':ToggleTerm direction=tab name=default-tab<CR>', { desc = 'Toggle terminal Ta[B]' })
      vim.keymap.set('n', '<bs>tb', ':ToggleTerm direction=tab name=default-tab<CR>', { desc = 'Toggle terminal Ta[B]' })

      -- Function to create a centered input window
      local function centered_input(prompt, callback)
        local width = 60
        local height = 1
        local buf = vim.api.nvim_create_buf(false, true)
        local ui = vim.api.nvim_list_uis()[1]
        local opts = {
          relative = 'editor',
          width = width,
          height = height,
          col = (ui.width - width) / 2,
          row = (ui.height - height) / 2,
          style = 'minimal',
          border = 'rounded',
        }
        local win = vim.api.nvim_open_win(buf, true, opts)
        vim.api.nvim_buf_set_option(buf, 'buftype', 'prompt')
        vim.fn.prompt_setprompt(buf, prompt)
        vim.cmd('startinsert')

        -- Handle Enter key press
        vim.keymap.set('i', '<CR>', function()
          local input = vim.fn.getline('.')
          vim.api.nvim_win_close(win, true)
          vim.schedule(function()
            callback(input:sub(#prompt + 1)) -- Remove prompt from input
          end)
        end, { buffer = buf, nowait = true })
      end

      -- New function to run command in terminal with centered input
      local function run_command_in_terminal()
        centered_input("Enter command: ", function(input)
          if input and input ~= "" then
            require("toggleterm").exec(input)
          end
        end)
      end

      -- New command to run input in terminal
      vim.api.nvim_create_user_command('TermRun', run_command_in_terminal, {})

      -- New keymaps to trigger the command
      vim.keymap.set('n', '<C-t><C-r>', ':TermRun<CR>', { desc = 'Run command in [T]erminal' })
      vim.keymap.set('n', '<bs>tr', ':TermRun<CR>', { desc = 'Run command in [T]erminal' })
    end,
  },
}
