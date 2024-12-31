return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    lazygit = { enabled = true },
    debug = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    dashboard = { enabled = true },
  },
  config = function()
    local snacks = require 'snacks'

    vim.keymap.set('n', '<leader>lg', snacks.lazygit.open, { desc = '[L]azy [G]it' })
    vim.keymap.set('n', '<leader>gb', snacks.git.blame_line, { desc = '[G]it [B]lame' })
    vim.keymap.set('n', '<leader>go', snacks.gitbrowse.open, { desc = '[G]it [O]pen' })
  end,
}
