return {
  'coder/claudecode.nvim',
  dependencies = {
    'folke/snacks.nvim', -- optional: nicer terminal + picker integration
  },
  opts = {
    terminal = {
      -- Position of the Claude window. Change `position` to "top", "bottom",
      -- "left", "right", or "float".
      snacks_win_opts = {
        position = 'bottom',
        height = 0.4,
        width = 1.0,
        border = 'single',
      },
    },
  },
  keys = {
    { '<leader>cc', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude Code' },
    -- Diff management
    { '<leader>cy', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept (yes) Claude diff' },
    { '<leader>cn', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny (no) Claude diff' },
  },
}
