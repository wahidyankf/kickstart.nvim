--[[
  options.lua
  
  This module configures Neovim's core settings and behaviors. Options are organized
  into logical groups for better maintainability.

  Option Groups:
  1. User Interface
     - Line numbers
     - Colors and visual elements
     - Window splits
  2. Editing Behavior
     - Indentation
     - Line wrapping
     - Mouse support
  3. System Integration
     - Clipboard
     - File handling
  4. Search and Replace
     - Case sensitivity
     - Live preview
  5. Performance
     - Update times
     - Timeouts
  6. Code Folding
     - TreeSitter integration
     - Default levels

  For more information, see:
  - :help vim.opt
  - :help option-list
  - :help option-summary
--]]

local opt = vim.opt

--[[ File Explorer Configuration ]]---------------------------------------------
-- Set netrw list style to tree view
vim.cmd 'let g:netrw_liststyle = 3'

--[[ User Interface ]]--------------------------------------------------------

-- Line Numbers
opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Show relative line numbers

-- Colors and Visual Elements
opt.termguicolors = true   -- Enable 24-bit RGB color in the TUI
opt.background = 'dark'     -- Default to dark background
opt.signcolumn = 'yes'     -- Always show the signcolumn
opt.cursorline = true      -- Highlight the current line
opt.showmode = false       -- Don't show mode in command line (statusline handles this)
opt.list = true           -- Show some invisible characters
opt.listchars = {         -- Define which invisible characters to show
  tab = '» ',            -- Tab characters
  trail = '·',           -- Trailing spaces
  nbsp = '␣'            -- Non-breaking spaces
}

-- Window Splits
opt.splitright = true      -- Place new window to the right of current one
opt.splitbelow = true      -- Place new window below the current one
opt.scrolloff = 10         -- Keep 10 lines visible above/below cursor

--[[ Editing Behavior ]]-----------------------------------------------------

-- Indentation
opt.tabstop = 2           -- Number of spaces a tab counts for
opt.shiftwidth = 2        -- Size of an indent
opt.expandtab = true      -- Use spaces instead of tabs
opt.autoindent = true     -- Copy indent from current line when starting new line
opt.breakindent = true    -- Maintain indent when wrapping lines

-- Line Wrapping
opt.wrap = false          -- Don't wrap lines by default

-- Mouse
opt.mouse = 'a'           -- Enable mouse for all modes

--[[ System Integration ]]--------------------------------------------------

-- Clipboard
opt.clipboard = 'unnamedplus'  -- Use system clipboard

-- File Handling
opt.swapfile = false      -- Disable swap files
opt.undofile = true       -- Save undo history to file

--[[ Search and Replace ]]------------------------------------------------

-- Search Behavior
opt.ignorecase = true     -- Ignore case in search patterns
opt.smartcase = true      -- Override ignorecase if pattern contains upper case
opt.hlsearch = true       -- Highlight search matches

-- Replace Preview
opt.inccommand = 'split'  -- Show preview of substitutions as you type

--[[ Performance ]]------------------------------------------------------

-- Timings
opt.updatetime = 250      -- Faster completion and other features
opt.timeoutlen = 300      -- Time to wait for mapped sequence to complete

--[[ Code Folding ]]----------------------------------------------------

-- TreeSitter Integration
opt.foldmethod = 'expr'                              -- Use TreeSitter for folding
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'    -- TreeSitter folding expression
opt.foldlevel = 99                                   -- High default fold level (less folding)
opt.foldlevelstart = 2                               -- Start with some folds closed
