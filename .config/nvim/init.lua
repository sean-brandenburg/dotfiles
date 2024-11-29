require 'sean.config.options'
require 'sean.config.keymaps'
require 'sean.autocmd'

-- Setup LazyVim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'airblade/vim-rooter', -- set cwd to project root

  -- "gc" to comment selected visual region
  -- "gcc" toggle comment of current line
  -- "gb" to toggle block comment of visual region
  -- "gbc" to toggle block comment of current line
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
    },
  },

  -- {
  --   -- Auto close xml tags
  --   'windwp/nvim-ts-autotag',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   opts = {
  --     enable_close = true,
  --     enable_rename = true,
  --     enable_close_on_slash = true,
  --   },
  -- },
  { import = 'sean.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
