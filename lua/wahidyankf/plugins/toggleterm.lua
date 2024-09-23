return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
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

      -- Table to store command history for each folder
      local command_history = {}

      -- Get the initial working directory
      local initial_cwd = (function()
        local argv = vim.v.argv
        for i = #argv, 1, -1 do
          if argv[i] ~= '-c' and argv[i]:sub(1, 1) ~= '+' then
            return vim.fn.fnamemodify(argv[i], ':p:h')
          end
        end
        return vim.fn.getcwd()
      end)()

      -- Function to save command history to a file
      local function save_command_history()
        local history_file = vim.fn.stdpath('data') .. '/toggleterm_history.json'
        local file = io.open(history_file, 'w')
        if file then
          file:write(vim.fn.json_encode(command_history))
          file:close()
        end
      end

      -- Function to load command history from a file
      local function load_command_history()
        local history_file = vim.fn.stdpath('data') .. '/toggleterm_history.json'
        local file = io.open(history_file, 'r')
        if file then
          local content = file:read('*all')
          file:close()
          if content ~= "" then
            command_history = vim.fn.json_decode(content)
          end
        end
      end

      -- Load command history when Neovim starts
      load_command_history()

      -- Function to run command in terminal
      local function run_command_in_terminal(command)
        if command and command ~= "" then
          require("toggleterm").exec(command)
        end
      end

      -- Function to show Telescope prompt for command selection/input
      local function show_command_prompt()
        if not command_history[initial_cwd] then
          command_history[initial_cwd] = {}
        end

        local actions = require "telescope.actions"
        local action_state = require "telescope.actions.state"
        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local conf = require("telescope.config").values

        local manually_selected = false

        pickers.new({}, {
          prompt_title = "Run Terminal Command",
          finder = finders.new_table {
            results = command_history[initial_cwd],
          },
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            -- Track manual selection
            map('i', '<C-n>', function()
              actions.move_selection_next(prompt_bufnr)
              manually_selected = true
            end)
            map('i', '<C-p>', function()
              actions.move_selection_previous(prompt_bufnr)
              manually_selected = true
            end)
            map('i', '<Down>', function()
              actions.move_selection_next(prompt_bufnr)
              manually_selected = true
            end)
            map('i', '<Up>', function()
              actions.move_selection_previous(prompt_bufnr)
              manually_selected = true
            end)

            actions.select_default:replace(function()
              local cmd
              if manually_selected then
                local selection = action_state.get_selected_entry()
                cmd = selection and selection[1] or action_state.get_current_line()
              else
                cmd = action_state.get_current_line()
              end
              actions.close(prompt_bufnr)
              if cmd and cmd ~= "" then
                run_command_in_terminal(cmd)
                -- Remove the command if it already exists in the history
                for i, v in ipairs(command_history[initial_cwd]) do
                  if v == cmd then
                    table.remove(command_history[initial_cwd], i)
                    break
                  end
                end
                -- Add the command to the beginning of the history
                table.insert(command_history[initial_cwd], 1, cmd)
                -- Limit the history to a certain number (e.g., 50) to prevent it from growing indefinitely
                if #command_history[initial_cwd] > 50 then
                  table.remove(command_history[initial_cwd])
                end
                -- Save the updated command history
                save_command_history()
              end
            end)
            return true
          end,
        }):find()
      end

      -- New command to show Telescope prompt
      vim.api.nvim_create_user_command('TermRun', show_command_prompt, {})

      -- New keymaps to trigger the command
      vim.keymap.set('n', '<C-t><C-r>', ':TermRun<CR>', { desc = 'Run command in [T]erminal' })
      vim.keymap.set('n', '<bs>tr', ':TermRun<CR>', { desc = 'Run command in [T]erminal' })
    end,
  },
}
