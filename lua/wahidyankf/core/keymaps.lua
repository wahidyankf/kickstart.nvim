--[[
  keymaps.lua
  
  This module defines all core key mappings for Neovim. The mappings are organized
  into logical groups for better maintainability.

  Key Prefixes:
  - <leader> (Space): Primary prefix for common operations
  - <bs> (Backspace): Secondary prefix for specific operations
  - <C-key>: Control + key combinations for window management

  Mapping Groups:
  1. Basic Operations (quit, numbers)
  2. Package Management
  3. Diagnostics
  4. Terminal Mode
  5. Window Navigation and Management
  6. Buffer Management
  7. Split Management
  8. Tab Management
  9. Configuration File Access
  10. Text Manipulation
  11. Copilot Integration

  For more information, see:
  - :help vim.keymap.set()
  - :help mapping
  - :help mapleader
--]]

-- Create a shorter alias for the keymap function
local keymap = vim.keymap

--[[ Basic Operations ]]-----------------------------------------------------------

-- Quit operations
keymap.set('n', '<leader>qq', ':q<CR>', { desc = 'quit' })
keymap.set('n', '<leader>qa', ':qa<CR>', { desc = 'quit all' })

-- Number manipulation
keymap.set('n', '<leader>=', '<C-a>', { desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

--[[ Package Management ]]-------------------------------------------------------
keymap.set('n', '<bs>pr', ':Lazy reload ', { desc = '[R]eload package' })

--[[ Diagnostic Navigation ]]---------------------------------------------------
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>cdp', vim.diagnostic.open_float, { desc = '[P]review in float' })
keymap.set('n', '<leader>cdq', vim.diagnostic.setloclist, { desc = '[Q]uickfix list' })

--[[ Terminal Mode ]]----------------------------------------------------------
-- Make terminal mode exit easier than the default <C-\><C-n>
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--[[ Movement Training ]]-----------------------------------------------------
-- Disable arrow keys to encourage using hjkl
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--[[ Window Navigation ]]-----------------------------------------------------
-- Use Ctrl + hjkl to move between windows
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window resizing
keymap.set('n', '<C-w>+', ':resize +5<cr>', { desc = 'Resize window vertically +5' })
keymap.set('n', '<C-w>-', ':resize -5<cr>', { desc = 'Resize window vertically -5' })
keymap.set('n', '<C-w>>', ':vertical resize -5<cr>', { desc = 'Resize window horizontally -5' })
keymap.set('n', '<C-w><', ':vertical resize +5<cr>', { desc = 'Resize window horizontally +5' })

--[[ Buffer Management ]]-----------------------------------------------------
keymap.set('n', '<leader>uw', ':w<CR>', { desc = '[W]rite current' })
keymap.set('n', '<leader>uq', ':q<CR>', { desc = '[Q]uit current' })
keymap.set('n', '<leader>uo', ':!echo % | pbcopy <CR>', { desc = 'Print l[o]cation and copy to clipboard' })
keymap.set('n', '<leader>uca', ':w | %bd | e#<CR>', { desc = 'Close all buffer except current' })

--[[ Split Management ]]-----------------------------------------------------
keymap.set('n', '<leader>sv', ':vsp<CR>', { desc = 'Split: current buffer [V]ertically' })
keymap.set('n', '<leader>sx', ':sp<CR>', { desc = 'Split: current buffer horizontally (x)' })
keymap.set('n', '<leader>sse', '<C-w>=', { desc = 'Split: equalize window sizes' })
keymap.set('n', '<leader>sq', '<cmd>close<CR>', { desc = 'Split: close current split' })

--[[ Tab Management ]]-------------------------------------------------------
-- Tab creation and navigation
keymap.set('n', '<bs>te', ':tabnew<CR>', { desc = 'Tab: Open n[E]w tab' })
keymap.set('n', '<bs>th', ':tabprevious<CR>', { desc = 'Tab: Go to previous tab [H]' })
keymap.set('n', '<bs>tl', ':tabnext<CR>', { desc = 'Tab: Go to next tab [L]' })

-- Quick tab switching (1-9, 0 for last)
keymap.set('n', '<bs>t1', '1gt', { desc = 'Tab: Go to tab [1]' })
keymap.set('n', '<bs>t2', '2gt', { desc = 'Tab: Go to tab [2]' })
keymap.set('n', '<bs>t3', '3gt', { desc = 'Tab: Go to tab [3]' })
keymap.set('n', '<bs>t4', '4gt', { desc = 'Tab: Go to tab [4]' })
keymap.set('n', '<bs>t5', '5gt', { desc = 'Tab: Go to tab [5]' })
keymap.set('n', '<bs>t6', '6gt', { desc = 'Tab: Go to tab [6]' })
keymap.set('n', '<bs>t7', '7gt', { desc = 'Tab: Go to tab [7]' })
keymap.set('n', '<bs>t8', '8gt', { desc = 'Tab: Go to tab [8]' })
keymap.set('n', '<bs>t9', '9gt', { desc = 'Tab: Go to tab [9]' })
keymap.set('n', '<bs>t0', ':tablast<CR>', { desc = 'Tab: Go to last tab' })

--[[ Configuration File Access ]]--------------------------------------------
-- Neovim config
keymap.set('n', '<bs>cve', ':e $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC: op[E]n' })
keymap.set('n', '<bs>cvr', ':source $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC: [R]eload' })
keymap.set('n', '<bs>cvt', ':tabnew $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC open in new [t]ab' })
keymap.set('n', '<bs>cvv', ':vsp<CR> :e $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC open in new [v]split' })
keymap.set('n', '<bs>cvx', ':sp<CR> :e $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC open in new [s]plit' })

-- Tmux config
keymap.set('n', '<bs>cte', ':e ~/.tmux.conf<CR>', { desc = '[C]onfig: [T]mux: op[E]n' })
keymap.set('n', '<bs>ctt', ':tabnew ~/.tmux.conf<CR>', { desc = '[C]onfig: [T]mux open in new [t]ab' })
keymap.set('n', '<bs>ctv', ':vsp<CR> :e ~/.tmux.conf<CR>', { desc = '[C]onfig: [T]mux open in new [v]split' })
keymap.set('n', '<bs>ctx', ':sp<CR> :e ~/.tmux.conf<CR>', { desc = '[C]onfig: [T]mux open in new [s]plit' })

-- Zsh config
keymap.set('n', '<bs>cze', ':e ~/.zshrc<CR>', { desc = '[C]onfig: ZSH: op[E]n' })
keymap.set('n', '<bs>czt', ':tabnew ~/.zshrc<CR>', { desc = '[C]onfig: ZSH open in new [t]ab' })
keymap.set('n', '<bs>czv', ':vsp<CR> :e ~/.zshrc<CR>', { desc = '[C]onfig: ZSH open in new [v]split' })
keymap.set('n', '<bs>czx', ':sp<CR> :e ~/.zshrc<CR>', { desc = '[C]onfig: ZSH open in new [s]plit' })

--[[ Search and Navigation ]]------------------------------------------------
-- Clear search highlighting
keymap.set('n', '<Esc>', '', { desc = 'Clear search highlight' })
keymap.set('n', '<bs>/', ':nohl<CR>', { desc = 'Clear search highlight' })

-- File explorer
keymap.set('n', '<leader>xn', ':Explore<CR>', { desc = 'Open netrw' })

--[[ Text Manipulation ]]---------------------------------------------------
keymap.set('x', '<leader>eoa', ":'<,'>sort<CR>", { desc = 'Sort selected text [A]scending' })

--[[ Copilot Integration ]]------------------------------------------------
-- Toggle and basic operations
keymap.set('n', '<leader>ccc', ':CopilotChatToggle<CR>', { desc = 'Copilot [C]hat Toggle', silent = true })

-- Visual mode operations
keymap.set('v', '<leader>cce', ':CopilotChatExplain<CR>', { desc = 'Copilot Chat [E]xplain', silent = true })
keymap.set('v', '<leader>ccff', ':CopilotChatFix<CR>', { desc = 'Copilot Chat [F]ix', silent = true })
keymap.set('v', '<leader>cco', ':CopilotChatOptimize<CR>', { desc = 'Copilot Chat [O]ptimize', silent = true })
keymap.set('v', '<leader>ccd', ':CopilotChatDocs<CR>', { desc = 'Copilot Chat [D]ocs', silent = true })
keymap.set('v', '<leader>cct', ':CopilotChatTests<CR>', { desc = 'Copilot Chat [T]ests', silent = true })
