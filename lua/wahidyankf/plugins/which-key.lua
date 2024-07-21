return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    local whichkey = require 'which-key'
    whichkey.setup {}

    whichkey.add {
      { '<C-t>', group = '[T]erminal' },
      { '<C-t>t_', hidden = true },

      { '<bs>c', group = '[C]onfig' },
      { '<bs>c_', hidden = true },
      { '<bs>cv', group = '[V]im' },
      { '<bs>cv_', hidden = true },

      { '<bs>p', group = '[P]ackage Manager' },
      { '<bs>p_', hidden = true },

      { '<bs>t', group = '[T]erminal' },
      { '<bs>t_', hidden = true },

      { '<bs>w', group = '[W]rap' },
      { '<bs>w_', hidden = true },

      { '<leader>b', desc = 'Data[B]ase' },

      { '<leader>c', group = '[C]ode' },
      { '<leader>c_', hidden = true },
      { '<leader>cd', group = '[D]iagnostic' },
      { '<leader>cd_', hidden = true },
      { '<leader>ch', group = '[H]int' },
      { '<leader>ch_', hidden = true },
      { '<leader>cs', group = '[S]ymbol' },
      { '<leader>cs_', hidden = true },
      { '<leader>ct', group = '[T]ype definitions' },
      { '<leader>ct_', hidden = true },

      { '<leader>d', group = '[D]ebug' },
      { '<leader>d_', hidden = true },
      { '<leader>db', group = 'Debugging [B]reakpoint' },
      { '<leader>db_', hidden = true },
      { '<leader>ds', group = '[S]tep' },
      { '<leader>ds_', hidden = true },

      { '<leader>e', desc = '[E]dit text' },
      { '<leader>es', desc = '[S]ubstitute' },

      { '<leader>f', group = 'Fuzzy [F]ind' },
      { '<leader>f_', hidden = true },

      { '<leader>g', group = '[G]it ' },
      { '<leader>g_', hidden = true },
      { '<leader>gb', group = '[B]lame' },
      { '<leader>gb_', hidden = true },
      { '<leader>gd', group = '[D]iff' },
      { '<leader>gd_', hidden = true },
      { '<leader>ge', group = 'D[e]leted' },
      { '<leader>ge_', hidden = true },
      { '<leader>gr', group = '[R]eset' },
      { '<leader>gr_', hidden = true },
      { '<leader>gs', group = '[S]tage' },
      { '<leader>gs_', hidden = true },
      { '<leader>gu', group = '[U]ndo' },
      { '<leader>gu_', hidden = true },
      { '<leader>gv', group = '[V]iew' },
      { '<leader>gv_', hidden = true },

      { '<leader>q', group = '[Q]uit' },
      { '<leader>q_', hidden = true },

      { '<leader>s', group = '[S]plit' },
      { '<leader>s_', hidden = true },
      { '<leader>ss', group = '[S]ize' },
      { '<leader>ss_', hidden = true },

      { '<leader>t', group = '[T]ab' },
      { '<leader>t_', hidden = true },

      { '<leader>u', group = 'B[U]ffer' },
      { '<leader>u_', hidden = true },
      { '<leader>uc', group = '[C]lose buffer' },
      { '<leader>uc_', hidden = true },

      { '<leader>w', group = '[W]orking session' },
      { '<leader>w_', hidden = true },

      { '<leader>x', group = 'File E[x]plorer' },
      { '<leader>x_', hidden = true },

      { '<localleader>r', group = '[R]un' },
      { '<localleader>r_', hidden = true },

      {
        mode = { 'v' },
        { '<leader>e', desc = '[E]dit text' },
        { '<leader>eo', desc = 'S[O]rt' },
        { '<leader>es', desc = '[S]ubtitute' },

        { '<leader>g', desc = '[G]it' },
        { '<leader>gr', group = '[R]eset' },
        { '<leader>gr_', hidden = true },
        { '<leader>gs', group = '[S]tage' },
        { '<leader>gs_', hidden = true },

        { '<leader>u', desc = 'B[U]ffer' },
      },
    }
  end,
}
