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
  -- 'airblade/vim-rooter', -- set cwd to project root (this was not working properly for me)

  { import = 'sean.plugins' },
  { import = 'sean.plugins.lsp' },
}

-- vim: ts=2 sts=2 sw=2 et
