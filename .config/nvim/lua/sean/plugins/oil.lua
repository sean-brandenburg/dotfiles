return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = {
      'icon',
    },
    view_options = {
      show_hidden = true,
    },

    keymaps = {
      ['<C-h>'] = false, -- Disable ctrl-h since I use it for vim tmux nav
    },
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },

  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
}
