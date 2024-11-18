--[[
  autocommands.lua
  
  This module contains Neovim autocommands - commands that automatically execute in response to events.
  For more information, see:
  - :help autocmd
  - :help lua-guide-autocommands
  - :help events
--]]

-- Create an autocommand for text yank (copy) operations
-- This provides visual feedback when text is yanked by briefly highlighting the copied text
-- Examples of when this triggers:
--   - yy: yank a line
--   - yap: yank a paragraph
--   - y$: yank to end of line
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  -- Create a new autocommand group to prevent duplicate autocommands
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    -- Highlight the yanked text
    -- Default highlight duration is 150ms
    -- See :help vim.highlight.on_yank() for customization options
    vim.highlight.on_yank()
  end,
})
