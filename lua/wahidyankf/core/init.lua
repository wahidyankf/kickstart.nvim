--[[
  init.lua (core)
  
  This is the entry point for Neovim's core configuration. It loads all essential 
  configuration modules in the correct order:

  1. options.lua: Basic Neovim options and settings
  2. keymaps.lua: Key mappings and bindings
  3. autocommands.lua: Event-triggered automatic commands

  Each module is kept separate for better organization and maintainability, but they
  are all loaded here to ensure proper initialization order.

  For more information about Lua modules in Neovim, see:
  - :help lua-guide
  - :help lua-module
--]]

-- Load core Neovim configurations
require 'wahidyankf.core.options'      -- Editor options and settings
require 'wahidyankf.core.keymaps'      -- Key mappings and bindings
require 'wahidyankf.core.autocommands' -- Automatic commands

-- Note: Plugin configurations are handled separately by lazy.nvim
-- See: lua/wahidyankf/lazy.lua
