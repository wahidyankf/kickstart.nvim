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

      ['<bs>c'] = { name = '[C]onfig', _ = 'which_key_ignore' },
      ['<bs>cp'] = { name = '[P]ackage', _ = 'which_key_ignore' },
      ['<bs>cv'] = { name = '[V]im', _ = 'which_key_ignore' },

      ['<bs>g'] = { name = '[G]it ', _ = 'which_key_ignore' },
      ['<bs>gb'] = { name = '[B]lame', _ = 'which_key_ignore' },
      ['<bs>gd'] = { name = '[D]iff', _ = 'which_key_ignore' },
      ['<bs>ge'] = { name = 'D[e]leted', _ = 'which_key_ignore' },
      ['<bs>gr'] = { name = '[R]eset', _ = 'which_key_ignore' },
      ['<bs>gs'] = { name = '[S]tage', _ = 'which_key_ignore' },
      ['<bs>gu'] = { name = '[U]ndo', _ = 'which_key_ignore' },
      ['<bs>gv'] = { name = '[V]iew', _ = 'which_key_ignore' },
    }
    -- visual mode
    require('which-key').register({
      ['<leader>h'] = { 'Git [H]unk' },
    }, { mode = 'v' })
  end,
}
