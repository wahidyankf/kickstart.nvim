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

      -- Table to store command history for each project
      local command_history = {}

      -- Function to get the current project root
      local function get_project_root()
        local current_file = vim.fn.expand('%:p')
        local current_dir = vim.fn.fnamemodify(current_file, ':h')
        return vim.fn.finddir('.git/..', current_dir .. ';')
      end

      -- Function to run command in terminal
      local function run_command_in_terminal(command)
        if command and command ~= "" then
          require("toggleterm").exec(command)
        end
      end

      -- Function to show Telescope prompt for command selection/input
      local function show_command_prompt()
        local project_root = get_project_root()
        if not command_history[project_root] then
          command_history[project_root] = {}
        end

        local actions = require "telescope.actions"
        local action_state = require "telescope.actions.state"
        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local conf = require("telescope.config").values

        pickers.new({}, {
          prompt_title = "Run Terminal Command",
          finder = finders.new_table {
            results = {"", unpack(command_history[project_root])},
          },
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              local cmd
              if selection then
                cmd = selection[1]
              else
                cmd = action_state.get_current_line()
              end
              if cmd and cmd ~= "" then
                run_command_in_terminal(cmd)
                -- Remove the command if it already exists in the history
                for i, v in ipairs(command_history[project_root]) do
                  if v == cmd then
                    table.remove(command_history[project_root], i)
                    break
                  end
                end
                -- Add the command to the beginning of the history
                table.insert(command_history[project_root], 1, cmd)
                -- Limit the history to a certain number (e.g., 50) to prevent it from growing indefinitely
                if #command_history[project_root] > 50 then
                  table.remove(command_history[project_root])
                end
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
