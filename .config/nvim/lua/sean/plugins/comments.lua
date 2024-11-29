-- "gc" to comment selected visual region
-- "gcc" toggle comment of current line
-- "gb" to toggle block comment of visual region
-- "gbc" to toggle block comment of current line

return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    -- import comment plugin safely
    local comment = require 'Comment'

    local ts_context_commentstring = require 'ts_context_commentstring.integrations.comment_nvim'

    -- enable comment
    comment.setup {
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    }
  end,
}
