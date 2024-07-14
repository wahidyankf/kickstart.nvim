-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local keymap = vim.keymap

-- quit vim
keymap.set('n', '<leader>qq', ':q<CR>', { desc = 'quit' })
keymap.set('n', '<leader>qa', ':qa<CR>', { desc = 'quit' })

-- number operations
keymap.set('n', '<leader>=', '<C-a>', { desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- Package
keymap.set('n', '<bs>pr', ':Lazy reload ', { desc = '[R]eload package' })

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>cdp', vim.diagnostic.open_float, { desc = '[P]review in float' })
keymap.set('n', '<leader>cdq', vim.diagnostic.setloclist, { desc = '[Q]uickfix list' })

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
keymap.set('n', '<leader>uw', ':w<CR>', { desc = '[W]rite current' })
keymap.set('n', '<leader>uq', ':q<CR>', { desc = '[Q]uit current' })
keymap.set('n', '<leader>uo', ':!echo % | pbcopy <CR>', { desc = 'Print l[o]cation and copy to clipboard' })
keymap.set('n', '<leader>uca', ':w | %bd | e#<CR>', { desc = 'Close all buffer except current' })

-- split management
keymap.set('n', '<leader>sv', ':vsp<CR>', { desc = 'Split: current buffer [V]ertically' })
keymap.set('n', '<leader>sx', ':sp<CR>', { desc = 'Split: current buffer horizontally (x)' })
keymap.set('n', '<leader>sse', '<C-w>=', { desc = 'Split: equalize window sizes' })
keymap.set('n', '<leader>sq', '<cmd>close<CR>', { desc = 'Split: close current split' })

-- tab management
keymap.set('n', '<leader>te', ':tabnew<CR>', { desc = 'Tab: Open n[E]w tab' })
keymap.set('n', '<leader>th', ':tabprevious<CR>', { desc = 'Tab: Go to previous tab [H]' })
keymap.set('n', '<leader>tl', ':tabnext<CR>', { desc = 'Tab: Go to next tab [L]' })
keymap.set('n', '<leader>t1', '1gt', { desc = 'Tab: Go to tab [1]' })
keymap.set('n', '<leader>t2', '2gt', { desc = 'Tab: Go to tab [2]' })
keymap.set('n', '<leader>t3', '3gt', { desc = 'Tab: Go to tab [3]' })
keymap.set('n', '<leader>t4', '4gt', { desc = 'Tab: Go to tab [4]' })
keymap.set('n', '<leader>t5', '5gt', { desc = 'Tab: Go to tab [5]' })
keymap.set('n', '<leader>t6', '6gt', { desc = 'Tab: Go to tab [6]' })
keymap.set('n', '<leader>t7', '7gt', { desc = 'Tab: Go to tab [7]' })
keymap.set('n', '<leader>t8', '8gt', { desc = 'Tab: Go to tab [8]' })
keymap.set('n', '<leader>t9', '9gt', { desc = 'Tab: Go to tab [9]' })
keymap.set('n', '<leader>t0', ':tablast<CR>', { desc = 'Tab: Go to last tab' })

-- config
keymap.set('n', '<bs>cve', ':e $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC: op[E]n' })
keymap.set('n', '<bs>cvr', ':source $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC: [R]eload' })
keymap.set('n', '<bs>cvt', ':tabnew $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC open in new [t]ab' })
keymap.set('n', '<bs>cvv', ':vsp<CR> :e $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC open in new [v]split' })
keymap.set('n', '<bs>cvx', ':sp<CR> :e $MYVIMRC<CR>', { desc = '[C]onfig: $MY[V]IMRC open in new [s]plit' })

-- clear search
keymap.set('n', '<Esc>', ":'<,'>nohlsearch<CR>", { desc = 'Clear search highlight' })
keymap.set('n', '<bs>/', ':nohl<CR>', { desc = 'Clear search highlight' })

-- Explore
keymap.set('n', '<leader>xn', ':Explore<CR>', { desc = 'Open netrw' })

-- text manipulation
keymap.set('x', '<leader>eoa', ":'<,'>sort<CR>", { desc = 'Sort selected text [A]scending' })
