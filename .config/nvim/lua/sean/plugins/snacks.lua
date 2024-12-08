return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    lazygit = { enabled = true },
    git = { enabled = true },
  },
  config = function()
    local snacks = require 'snacks'

    vim.keymap.set('n', '<leader>lg', snacks.lazygit.open, { desc = '[L]azy [G]it' })
    vim.keymap.set('n', '<leader>gb', snacks.git.blame_line, { desc = '[G]it [B]lame' })
  end,
}
