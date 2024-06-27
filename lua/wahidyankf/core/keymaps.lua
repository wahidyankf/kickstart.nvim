-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- saving
vim.keymap.set('n', '<localleader>w', ':w<CR>', { desc = 'Save current buffer' })
vim.keymap.set('n', '<localleader>q', ':q<CR>', { desc = 'Close current buffer' })

-- splitting window
vim.keymap.set('n', '<localleader>v', ':vsp<CR>', { desc = 'Split current buffer vertically' })
vim.keymap.set('n', '<localleader>x', ':sp<CR>', { desc = 'Split current buffer horizontally' })

-- tab management
vim.keymap.set('n', '<bs>tn', ':tabnew<CR>', { desc = 'Create new tab' })
vim.keymap.set('n', '<bs>th', ':tabprevious<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<bs>tl', ':tabnext<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<bs>1', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<bs>t1', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<bs>2', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<bs>t2', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<bs>3', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<bs>t3', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<bs>4', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<bs>t4', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<bs>5', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<bs>t5', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<bs>6', '6gt', { desc = 'Go to tab 6' })
vim.keymap.set('n', '<bs>t6', '6gt', { desc = 'Go to tab 6' })
vim.keymap.set('n', '<bs>7', '7gt', { desc = 'Go to tab 7' })
vim.keymap.set('n', '<bs>t7', '7gt', { desc = 'Go to tab 7' })
vim.keymap.set('n', '<bs>8', '8gt', { desc = 'Go to tab 8' })
vim.keymap.set('n', '<bs>t8', '8gt', { desc = 'Go to tab 8' })
vim.keymap.set('n', '<bs>9', '9gt', { desc = 'Go to tab 9' })
vim.keymap.set('n', '<bs>t9', '9gt', { desc = 'Go to tab 9' })
vim.keymap.set('n', '<bs>0', ':tablast<CR>', { desc = 'Go to last tab' })
vim.keymap.set('n', '<bs>t0', ':tablast<CR>', { desc = 'Go to last tab' })

-- config
vim.keymap.set('n', '<bs>cvr', ':source $MYVIMRC<CR>', { desc = 'Config - Reload $MYVIMRC' })
vim.keymap.set('n', '<bs>cve', ':e $MYVIMRC<CR>', { desc = 'Config - Open $MYVIMRC in new vsplit' })
vim.keymap.set('n', '<bs>cvv', ':vsp<CR> :e $MYVIMRC<CR>', { desc = 'Config - Open $MYVIMRC in new vsplit' })
vim.keymap.set('n', '<bs>cvx', ':sp<CR> :e $MYVIMRC<CR>', { desc = 'Config - Open $MYVIMRC in new split' })
vim.keymap.set('n', '<bs>cvt', ':tabnew $MYVIMRC<CR>', { desc = 'Config - Open $MYVIMRC in new tab' })

-- clear search
vim.keymap.set('n', '<bs>/', ':nohl<CR>', { desc = 'Clear search highlight' })

-- clear all buffer except current
vim.keymap.set('n', '<bs>bca', ':w | %bd | e#', { desc = 'Close all display except current one' })
