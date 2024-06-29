return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
      ['<leader>bc'] = { name = '[C]lose', _ = 'which_key_ignore' },

      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>cd'] = { name = '[D]iagnostic', _ = 'which_key_ignore' },
      ['<leader>ch'] = { name = '[H]int', _ = 'which_key_ignore' },
      ['<leader>cs'] = { name = '[S]ymbol', _ = 'which_key_ignore' },
      ['<leader>ct'] = { name = '[T]ype definitions', _ = 'which_key_ignore' },

      ['<leader>f'] = { name = 'Fuzzy [F]ind', _ = 'which_key_ignore' },

      ['<leader>g'] = { name = '[G]it ', _ = 'which_key_ignore' },
      ['<leader>gb'] = { name = '[B]lame', _ = 'which_key_ignore' },
      ['<leader>gd'] = { name = '[D]iff', _ = 'which_key_ignore' },
      ['<leader>ge'] = { name = 'D[e]leted', _ = 'which_key_ignore' },
      ['<leader>gr'] = { name = '[R]eset', _ = 'which_key_ignore' },
      ['<leader>gs'] = { name = '[S]tage', _ = 'which_key_ignore' },
      ['<leader>gu'] = { name = '[U]ndo', _ = 'which_key_ignore' },
      ['<leader>gv'] = { name = '[V]iew', _ = 'which_key_ignore' },

      ['<leader>s'] = { name = '[S]plit', _ = 'which_key_ignore' },
      ['<leader>ss'] = { name = '[S]ize', _ = 'which_key_ignore' },

      ['<leader>t'] = { name = '[T]ab', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orking session', _ = 'which_key_ignore' },
      ['<leader>x'] = { name = 'File E[x]plorer', _ = 'which_key_ignore' },

      ['<localleader>r'] = { name = '[R]un', _ = 'which_key_ignore' },

      ['<bs>c'] = { name = '[C]onfig', _ = 'which_key_ignore' },
      ['<bs>cp'] = { name = '[P]ackage', _ = 'which_key_ignore' },
      ['<bs>cv'] = { name = '[V]im', _ = 'which_key_ignore' },
    }
    -- visual mode
    require('which-key').register({
      ['<leader>b'] = { '[B]uffer' },
      ['<leader>g'] = { '[G]it' },
      ['<leader>gr'] = { name = '[R]eset', _ = 'which_key_ignore' },
      ['<leader>gs'] = { name = '[S]tage', _ = 'which_key_ignore' },
    }, { mode = 'v' })
  end,
}
