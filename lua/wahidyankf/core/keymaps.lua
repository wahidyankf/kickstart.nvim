-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local keymap = vim.keymap

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

keymap.set('n', '<leader>=', '<C-a>', { desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>ee', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands

keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffer management
keymap.set('n', '<leader>bw', ':w<CR>', { desc = '[B]uffer: Write current' })
keymap.set('n', '<localleader>w', ':w<CR>', { desc = '[B]uffer: Write current' }) -- old habbit die hard

keymap.set('n', '<leader>bq', ':q<CR>', { desc = '[B]uffer: Close current' })

-- split management
keymap.set('n', '<bs>sv', ':vsp<CR>', { desc = '[S]plit: current buffer [V]ertically' })
keymap.set('n', '<bs>sx', ':sp<CR>', { desc = '[S]plit: current buffer [H]orizontally' })
keymap.set('n', '<bs>se', '<C-w>=', { desc = '[S]plit: Equal Size' })
keymap.set('n', '<bs>sq', '<cmd>close<CR>', { desc = '[S]plit: close current split' })

-- tab management
keymap.set('n', '<bs>tn', ':tabnew<CR>', { desc = '[T]ab: Open [N]ew tab' })
keymap.set('n', '<bs>th', ':tabprevious<CR>', { desc = '[T]ab: Go to previous tab' })
keymap.set('n', '<bs>tl', ':tabnext<CR>', { desc = '[T]ab: Go to next tab' })
keymap.set('n', '<bs>1', '1gt', { desc = 'Go to tab [1]' })
keymap.set('n', '<bs>t1', '1gt', { desc = '[T]ab: Go to tab [1]' })
keymap.set('n', '<bs>2', '2gt', { desc = 'Go to tab [2]' })
keymap.set('n', '<bs>t2', '2gt', { desc = '[T]ab: Go to tab [2]' })
keymap.set('n', '<bs>3', '3gt', { desc = 'Go to tab [3]' })
keymap.set('n', '<bs>t3', '3gt', { desc = '[T]ab: Go to tab [3]' })
keymap.set('n', '<bs>4', '4gt', { desc = 'Go to tab [4]' })
keymap.set('n', '<bs>t4', '4gt', { desc = '[T]ab: Go to tab [4]' })
keymap.set('n', '<bs>5', '5gt', { desc = 'Go to tab [5]' })
keymap.set('n', '<bs>t5', '5gt', { desc = '[T]ab: Go to tab [5]' })
keymap.set('n', '<bs>6', '6gt', { desc = 'Go to tab [6]' })
keymap.set('n', '<bs>t6', '6gt', { desc = '[T]ab: Go to tab [6]' })
keymap.set('n', '<bs>7', '7gt', { desc = 'Go to tab [7]' })
keymap.set('n', '<bs>t7', '7gt', { desc = '[T]ab: Go to tab [7]' })
keymap.set('n', '<bs>8', '8gt', { desc = 'Go to tab [8]' })
keymap.set('n', '<bs>t8', '8gt', { desc = '[T]ab: Go to tab [8]' })
keymap.set('n', '<bs>9', '9gt', { desc = 'Go to tab [9]' })
keymap.set('n', '<bs>t9', '9gt', { desc = '[T]ab: Go to tab [9]' })
keymap.set('n', '<bs>0', ':tablast<CR>', { desc = 'Go to last tab' })
keymap.set('n', '<bs>t0', ':tablast<CR>', { desc = '[T]ab: Go to last tab' })

-- config
keymap.set('n', '<bs>cvr', ':source $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC: [R]eload' })
keymap.set('n', '<bs>cve', ':e $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC: op[E]n' })
keymap.set('n', '<bs>cvv', ':vsp<CR> :e $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC open in new [v]split' })
keymap.set('n', '<bs>cvx', ':sp<CR> :e $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC open in new [s]plit' })
keymap.set('n', '<bs>cvt', ':tabnew $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC open in new [t]ab' })

-- clear search
keymap.set('n', '<bs>/', ':nohl<CR>', { desc = 'Clear search highlight' })

-- clear all buffer except current
keymap.set('n', '<bs>bca', ':w | %bd | e#<CR>', { desc = 'Close all display except current one' })
